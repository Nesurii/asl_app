import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mypod_flutter/screens/video_player_widget.dart';

class Unit7PracticeScreen extends StatefulWidget {
  const Unit7PracticeScreen({super.key});

  @override
  State<Unit7PracticeScreen> createState() => _Unit7PracticeScreenState();
}

class _Unit7PracticeScreenState extends State<Unit7PracticeScreen> {
  final List<Map<String, String>> practices = [
    {
      'practiceText':
          'Practice 1: You have a class in room 7 today. Try practicing the sign for “room”.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2025/room.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI1L3Jvb20ud2VibSIsImlhdCI6MTc0NDY0MzQzOSwiZXhwIjoxNzc2MTc5NDM5fQ.e-Rm_SFS7gCK5vPHGL308od_aImEQSUBtGnJeTNe6zw",
      'videoLabel': 'Room',
    },
    {
      'practiceText':
          'Practice 2: Andy was the one teaching you ASL. Try signing the word “teacher”.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2026/teacher.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI2L3RlYWNoZXIud2VibSIsImlhdCI6MTc0NDY0ODQxNCwiZXhwIjoxNzc2MTg0NDE0fQ.aoSmmsUBkYQ4YNbLSXYUF09FzYAofWW8_Y1q6dMmWsI",
      'videoLabel': 'Teacher',
    },
    {
      'practiceText':
          'Practice 3: Your friend asked you if you have a physics class later. Try signing the word “physics”.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2027/physics.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI3L3BoeXNpY3Mud2VibSIsImlhdCI6MTc0NDY1Mzc4MiwiZXhwIjoxNzc2MTg5NzgyfQ.xLreUr3OMtLHROi-U0x-fD-jRZ7LLlbfA72e4HKgXD0',
      'videoLabel': 'Physics',
    },
    {
      'practiceText':
          'Practice 4: The cafeteria was so crowded today because the menu for lunch was chicken sothe menu became popular and were regularized during Fridays. Try practicing the sign for “popular”.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/popular.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3BvcHVsYXIud2VibSIsImlhdCI6MTc0NDY1NTExOSwiZXhwIjoxNzc2MTkxMTE5fQ.4yrZ-PecfHV462vhG6R3KjYoCnq1Czyr2kEz29bmaC4",
      'videoLabel': 'Popular',
    },
    {
      'practiceText':
          'Practice 5: You hate bugs that’s why you don’t like camping. Try signing the word “bug”.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/bug.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvYnVnLndlYm0iLCJpYXQiOjE3NDY2MTk1NjIsImV4cCI6MTc3ODE1NTU2Mn0.syAoJu08CvqcsWgByYEB20-0Qc-7w7RhTycypx4tsC8',
      'videoLabel': 'Bug',
    },
  ];

  late List<Map<String, String>> shuffledPractices;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _shufflePractices();
  }

  void _shufflePractices() {
    shuffledPractices = List.from(practices)..shuffle(Random());
  }

  @override
  Widget build(BuildContext context) {
    // Get image URLs for practice
    final imageUrls =
        shuffledPractices[currentIndex]['imageUrls']?.split(', ') ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Unit 7: Practice',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                shuffledPractices[currentIndex]['practiceText']!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            // Check if the practice contains images or video
            if (imageUrls.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(url, height: 150, width: 150),
                  );
                }).toList(),
              )
            else if (shuffledPractices[currentIndex]['videoUrl']!.isNotEmpty)
              Column(
                children: [
                  CustomVideoPlayer(
                    videoUrl: shuffledPractices[currentIndex]['videoUrl']!,
                  ),
                  SizedBox(height: 12),
                  Text(
                    shuffledPractices[currentIndex]['videoLabel'] ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                // TODO: Implement camera opening functionality
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withAlpha((0.3 * 255).round()),
                ),
                padding: EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withAlpha((0.2 * 255).round()),
                  ),
                  padding: EdgeInsets.all(25),
                  child: Icon(
                    Icons.camera_alt,
                    size: 55,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
