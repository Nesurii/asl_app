import 'package:flutter/material.dart';
import 'main_screen.dart'; 
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  CameraController? cameraController;
  List<CameraDescription> _cameras = [];
  bool _showCamera = false; // toggle camera screen
  bool _isRecording = false; 
  String? _videoPath; // Stores recorded video path

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

  Future<void> _setupCameraController() async {
  try {
    _cameras = await availableCameras();

    if (_cameras.isNotEmpty) {
      // Find the front camera; fallback to first available if not found
      final frontCamera = _cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => _cameras.first,
      );

      cameraController = CameraController(
        frontCamera,
        ResolutionPreset.high,
        enableAudio: true,
      );

      await cameraController!.initialize();

      if (mounted) {
        setState(() {}); // Update UI after initialization
      }
    } else {
      debugPrint("No cameras found.");
    }
  } catch (e) {
    debugPrint("Error initializing camera: $e");
  }
}


  Future<void> _startRecording() async {
    if (cameraController == null || !cameraController!.value.isInitialized) return;

    final directory = await getTemporaryDirectory();
    final videoFile = File('${directory.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4');

    try {
      await cameraController!.startVideoRecording();
      setState(() {
        _isRecording = true;
        _videoPath = videoFile.path;
      });
    } catch (e) {
      debugPrint("Error starting video recording: $e");
    }
  }


  Future<void> _stopRecording() async {
    if (cameraController == null || !cameraController!.value.isRecordingVideo) return;

    try {
      XFile videoFile = await cameraController!.stopVideoRecording();
      setState(() {
        _isRecording = false;
        _videoPath = videoFile.path;
      });

      debugPrint("Video saved at: $_videoPath");
    } catch (e) {
      debugPrint("Error stopping video recording: $e");
    }
  }


  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showCamera ? _cameraScreen() : _buildPracticeUI(),
    );
  }

  // Main UI before opening the camera
  Widget _buildPracticeUI() {
    return Stack(
      children: [
        // Background Image with Dark Overlay
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/practice_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withAlpha((0.2 * 255).toInt()), // Dark overlay
          ),
        ),

        // Foreground UI Elements
        Column(
          children: [
            // Top Bar with Close Icon & Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Close Button (X) - Goes Back to MainScreen
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white, size: 32),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(category: 'Unit 1, Level 1'),
                        ),
                      );
                    },
                  ),

                  // Enlarged Progress Bar
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 12,
                        child: LinearProgressIndicator(
                          value: 0.0, // Example progress value
                          backgroundColor: Colors.grey[700],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Space before scenario image and text
            SizedBox(height: 40),

            // Scenario Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/scenario_image.png',
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 20),

            // Scenario Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Pretend you're ordering coffee. Sign 'I want coffee, please.’",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Spacer(),

            // Camera Button (Toggles Camera)
            GestureDetector(
              onTap: () {
                setState(() {
                  _showCamera = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withAlpha((0.2 * 255).toInt()),
                ),
                padding: EdgeInsets.all(25),
                child: Icon(
                  Icons.camera_alt,
                  size: 55,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 40),

          ],
        ),
      ],
    );
  }

  // Camera Screen UI
  Widget _cameraScreen() {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(cameraController!),
          ),

          // Record/Stop Button
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: _isRecording ? _stopRecording : _startRecording,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isRecording ? Colors.red : Colors.white,
                  ),
                  padding: EdgeInsets.all(25),
                  child: Icon(
                    _isRecording ? Icons.stop : Icons.fiber_manual_record,
                    size: 55,
                    color: _isRecording ? Colors.white : Colors.red,
                  ),
                ),
              ),
            ),
          ),

          // Back Button
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showCamera = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text("Back", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
