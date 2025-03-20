import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LessonScreen extends StatefulWidget {
  final int lessonNumber;
  final String videoUrl; // Add video URL

  const LessonScreen({
    super.key,
    required this.lessonNumber,
    required this.videoUrl,
  });

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video player
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {}); // Refresh state once initialized
        _controller.play(); // Auto-play the video
      })
      ..setLooping(true); // Loop video

    _controller.addListener(() {
      if (_controller.value.hasError) {
        debugPrint("Video error: ${_controller.value.errorDescription}");
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up controller when widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lesson ${widget.lessonNumber}')),
      body: Column(
        children: [
          // Display video player if initialized
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const Center(child: CircularProgressIndicator()),
          
          // Lesson content below the video
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Content for Lesson ${widget.lessonNumber}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
