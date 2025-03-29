import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const CustomVideoPlayer({super.key, required this.videoUrl});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  bool _showPlayButton = true;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {}); // Update UI when initialized
      })
      ..addListener(() {
        if (_controller.value.position >= _controller.value.duration) {
          setState(
              () => _showPlayButton = true); // Show play button when video ends
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _showPlayButton = true;
      } else {
        _controller.play();
        _showPlayButton = false;
      }
    });
  }

  void _enterFullscreen() async {
    final position = _controller.value.position; // Save position
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenVideoPlayer(
          videoUrl: widget.videoUrl,
          startPosition: position,
        ),
      ),
    );
    // Resume video from saved position
    _controller.seekTo(position);
    _controller.play();
    setState(() => _showPlayButton = false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(
                  height: 200,
                  color: Colors.black,
                  child: const Center(child: CircularProgressIndicator()),
                ),
        ),
        Positioned.fill(
          child: GestureDetector(
            onTap: _enterFullscreen,
            behavior: HitTestBehavior.opaque,
          ),
        ),
        if (_showPlayButton)
          GestureDetector(
            onTap: _togglePlayPause,
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 60),
          ),
      ],
    );
  }
}

// Fullscreen Video Player
class FullScreenVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final Duration startPosition;

  const FullScreenVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.startPosition,
  });

  @override
  State<FullScreenVideoPlayer> createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late VideoPlayerController _controller;
  bool _showPlayButton = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        _controller.seekTo(widget.startPosition);
        _controller.play();
        setState(() {}); // Update UI
      })
      ..addListener(() {
        if (_controller.value.position >= _controller.value.duration) {
          setState(
              () => _showPlayButton = true); // Show play button when video ends
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _showPlayButton = true;
      } else {
        _controller.play();
        _showPlayButton = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const CircularProgressIndicator(),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          if (_showPlayButton)
            GestureDetector(
              onTap: _togglePlayPause,
              child:
                  const Icon(Icons.play_arrow, color: Colors.white, size: 60),
            ),
        ],
      ),
    );
  }
}
