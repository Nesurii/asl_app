import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:mypod_flutter/widgets/video_player.dart';

class Lesson1PracticeScreen extends StatelessWidget {
  final List<Map<String, String>> practices = [
    {
      'practiceText': 'Try to Fingerspell the word ASL',
      'videoUrl': 'https://github.com/Nesurii/try/releases/download/new/A.S.L.mp4',
    },
    {
      'practiceText': 'Try to Fingerspell the word Eat',
      'videoUrl': 'https://github.com/Nesurii/try/releases/download/new/E.A.T.mp4',
    },
    {
      'practiceText': 'Try to Fingerspell the word Love',
      'videoUrl': 'https://github.com/Nesurii/try/releases/download/new/L.O.V.E.mp4',
    },
    {
      'practiceText': 'Try to Fingerspell the word ILY',
      'videoUrl': 'https://github.com/Nesurii/try/releases/download/new/I.L.Y.mp4',
    },
    {
      'practiceText': 'Try to Fingerspell the word Game',
      'videoUrl': 'https://github.com/Nesurii/try/releases/download/new/G.A.M.E.mp4',
    },
  ];

  Lesson1PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Lesson 1: Practice',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: PageView.builder(
        itemCount: practices.length,
        itemBuilder: (context, index) {
          return PracticePage(
            practiceText: practices[index]['practiceText']!,
            videoUrl: practices[index]['videoUrl']!,
          );
        },
      ),
    );
  }
}

class PracticePage extends StatefulWidget {
  final String practiceText;
  final String videoUrl;

  const PracticePage({super.key, required this.practiceText, required this.videoUrl});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];
  bool _showCamera = false;
  bool _isRecording = false;
  String? _videoPath;

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

  Future<void> _setupCameraController() async {
    try {
      _cameras = await availableCameras();

      if (_cameras.isNotEmpty) {
        final frontCamera = _cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
          orElse: () => _cameras.first,
        );

        _cameraController = CameraController(
          frontCamera,
          ResolutionPreset.high,
          enableAudio: true,
        );

        await _cameraController!.initialize();

        if (mounted) {
          setState(() {});
        }
      } else {
        debugPrint("No cameras found.");
      }
    } catch (e) {
      debugPrint("Error initializing camera: $e");
    }
  }

  Future<void> _startRecording() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;

    final directory = await getTemporaryDirectory();
    final videoFile = File('${directory.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4');

    try {
      await _cameraController!.startVideoRecording();
      setState(() {
        _isRecording = true;
        _videoPath = videoFile.path;
      });
    } catch (e) {
      debugPrint("Error starting video recording: $e");
    }
  }

  Future<void> _stopRecording() async {
    if (_cameraController == null || !_cameraController!.value.isRecordingVideo) return;

    try {
      XFile videoFile = await _cameraController!.stopVideoRecording();
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
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String wordToFingerspell = widget.practiceText.split(' ').last;
    String remainingText = widget.practiceText.replaceFirst(wordToFingerspell, '').trim();

    return _showCamera ? _cameraScreen() : _practiceUI(remainingText, wordToFingerspell);
  }

  Widget _practiceUI(String remainingText, String wordToFingerspell) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 200),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: remainingText, style: TextStyle(fontSize: 18)),
                  TextSpan(
                    text: ' $wordToFingerspell',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          CustomVideoPlayer(videoUrl: widget.videoUrl),
          SizedBox(height: 20),

          GestureDetector(
            onTap: () {
              setState(() {
                _showCamera = true;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withAlpha((0.3 * 255).toInt()),
              ),
              padding: EdgeInsets.all(25),
              child: Icon(
                Icons.camera_alt,
                size: 55,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cameraScreen() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(_cameraController!),
          ),

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
        ],
      ),
    );
  }
}
