import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

import '../services/stickers_progress.dart';

class RewardScreen extends StatefulWidget {
  final int rewardIndex;

  const RewardScreen({super.key, required this.rewardIndex});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  late ConfettiController _confettiController;
  late AudioPlayer _audioPlayer;

  final List<String> rewardImages = [
    'assets/rewards/sticker1.jpg',
    'assets/rewards/sticker2.jpg',
    'assets/rewards/sticker3.jpg',
    'assets/rewards/sticker4.jpg',
    'assets/rewards/sticker5.jpg',
    'assets/rewards/sticker6.jpg',
    'assets/rewards/sticker7.jpg',
    'assets/rewards/sticker8.jpg',
    'assets/rewards/sticker9.jpg',
    'assets/rewards/sticker10.jpg',
  ];

  final List<String> rewardGreetings = [
    "Congratulations!",
    "Awesome!",
    "Whew!",
    "Nice!",
    "Hooray!",
    "Amazing!",
    "Congratulations!",
    "Job well done!",
    "Hooray!",
    "Fantastic!",
  ];

  final List<String> rewardTexts = [
    "You got the Welcome sticker!",
    "Here's your Getting Started sticker!",
    "You unlocked Getting to Know You sticker!",
    "Enjoy your Numbers sticker!",
    "You earned the Time sticker!",
    "Grab your Family and Friends sticker!",
    "You unlocked School DaysRoutine sticker!",
    "You got the My Daily Routine sticker!!",
    "Here's your Describing People sticker!",
    "Making Plans sticker unlocked!",
  ];

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 3));
    _audioPlayer = AudioPlayer();

    _playConfettiSound(); // Play sound effect
    _confettiController.play(); // Start confetti animation
  }

  void _playConfettiSound() async {
    await _audioPlayer.play(AssetSource(
        'sounds/confetti.mp3')); // Make sure you have the file in assets/sounds/
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Confetti effect (background layer)
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: -pi / 2,
              emissionFrequency: 0.2,
              numberOfParticles: 10,
              maxBlastForce: 20,
              minBlastForce: 5,
              gravity: 0.3,
            ),
          ),

          // Main content (foreground layer)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image container
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha((0.2 * 255).round()),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      rewardImages[widget.rewardIndex-1],
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Space between image and text

                // Large Greeting Text
                Text(
                  rewardGreetings[widget.rewardIndex-1],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),

                // Smaller Subtext
                Text(
                  rewardTexts[widget.rewardIndex-1],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 30),

                // OK Button
                ElevatedButton(
                  onPressed: () async {
                    String earnedStickerPath = rewardImages[widget.rewardIndex-1];
                    await updateStickers(stickerId: earnedStickerPath);

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  child: Text(
                    "OK",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
