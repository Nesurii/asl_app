import 'dart:math';
import 'package:flutter/material.dart';

import 'video_player_widget.dart';

class Unit2PracticeScreen extends StatefulWidget {
  const Unit2PracticeScreen({super.key});

  @override
  State<Unit2PracticeScreen> createState() => _Unit2PracticeScreenState();
}

class _Unit2PracticeScreenState extends State<Unit2PracticeScreen> {
  final List<Map<String, String>> practices = [
    {
      'practiceText':
          'Practice 1: This is one of the signs that learners gets confused because of the similarity with the handshape. Practice it!',
      'imageUrls':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%205/1.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDUvMS53ZWJwIiwiaWF0IjoxNzQzODYxMjcyLCJleHAiOjE3NzUzOTcyNzJ9.NAEEo0h8KdtahfswXrPQ34MTqusy7Mu72egtfni3PxI',
      'videoLabel':
          '1',
    },
    {
      'practiceText':
          'Practice 2: You got sick so you missed classes yesterday. Try signing the visual guide below.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%206/Sick.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDYvU2ljay53ZWJtIiwiaWF0IjoxNzQzODU4OTEzLCJleHAiOjE3NzUzOTQ5MTN9.V_zijxyiLdjR0d-HWnV4yowRB-UQg4xFKHqAyrePtwc",
      'videoLabel': 'Sick',
    },
    {
      'practiceText':
          'Practice 3: The desk is too heavy for you, so you asked for help moving it. You can try signing this.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/help.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvaGVscC53ZWJtIiwiaWF0IjoxNzQ2NjI1MjM1LCJleHAiOjE3NzgxNjEyMzV9.XBjdzEMzp13OAb04gdmJFz3O5fvLJV3d1rK-HlTaIag',
      'videoLabel': 'Help',
    },
    {
      'practiceText':
          'Practice 4: You want to ask someone if they are deaf. Try signing the “deaf”.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%208/are%20you%20deaf.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDgvYXJlIHlvdSBkZWFmLndlYm0iLCJpYXQiOjE3NDM4NjAxNDEsImV4cCI6MTc3NTM5NjE0MX0.tOunmP0lvtK0qxfIoDESrtKa7vC-H-sKRj7QGQ9j5wY',
      'videoLabel': 'Deaf',
    },
    {
      'practiceText':
          'Practice 5: You were asked by someone if you are deaf but you are part of the Hearing community. Try signing this',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%208/no,%20i_m%20hearing.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDgvbm8sIGlfbSBoZWFyaW5nLndlYm0iLCJpYXQiOjE3NDM4NjAyNTMsImV4cCI6MTc3NTM5NjI1M30.NU182QaVo4u0blg_QWILpEAzGJhjykZOVmIdyzhq9RU',
      'videoLabel': 'Hearing',
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
          'Unit 2: Practice',
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
