import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CameraWidget extends StatefulWidget {
  final VoidCallback onClose;
  
  const CameraWidget({super.key, required this.onClose});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];
  bool _isRecording = false;
  String? _videoPath;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
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
        if (mounted) setState(() {});
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
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        Positioned.fill(child: CameraPreview(_cameraController!)),
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
        Positioned(
          bottom: 50,
          left: 20,
          right: 20,
          child: Center(
            child: ElevatedButton(
              onPressed: widget.onClose,
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
    );
  }
}
