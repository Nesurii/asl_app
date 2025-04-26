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
          'Practice 1: This is one of the signs that learners get confused because of the similarity with the handshape. Practice it!',
      'imageUrls':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%205/1.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDUvMS53ZWJwIiwiaWF0IjoxNzQzODYxMjcyLCJleHAiOjE3NzUzOTcyNzJ9.NAEEo0h8KdtahfswXrPQ34MTqusy7Mu72egtfni3PxI, https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/D.jpg',
      'videoLabel':
          'Number 1 is in the left picture, and letter D is in the right picture.',
    },
    {
      'practiceText':
          'Practice 2: It is a holiday so there were no classes and many of your friends liked it. You can try this to communicate with them.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/me%20too,%20i'm%20happy.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvbWUgdG9vLCBpJ20gaGFwcHkud2VibSIsImlhdCI6MTc0Mzg2MTk1MSwiZXhwIjoxNzc1Mzk3OTUxfQ.o5XehWjNWzckpvduLK5PER9AZayxl9WoJolzpqHgSw0",
      'videoLabel': 'Me too. I’m happy',
    },
    {
      'practiceText':
          'Practice 3: The desk is too heavy for you and you want to ask for help in moving it. You can try signing this.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/please%20help%20me%20move%20the%20table.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvcGxlYXNlIGhlbHAgbWUgbW92ZSB0aGUgdGFibGUud2VibSIsImlhdCI6MTc0Mzg2MTk0MCwiZXhwIjoxNzc1Mzk3OTQwfQ.-xtpipRdBSk8A_KiWEJmTEr1ulheaKFdldteF53dmd4',
      'videoLabel': 'Please help me move the desk',
    },
    {
      'practiceText':
          'Practice 4: You want to ask someone if they are deaf. You can try asking like this.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%208/are%20you%20deaf.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDgvYXJlIHlvdSBkZWFmLndlYm0iLCJpYXQiOjE3NDM4NjAxNDEsImV4cCI6MTc3NTM5NjE0MX0.tOunmP0lvtK0qxfIoDESrtKa7vC-H-sKRj7QGQ9j5wY',
      'videoLabel': 'Are you deaf?',
    },
    {
      'practiceText':
          'Practice 5: You were asked by someone if you are deaf but you are part of the Hearing community. Try this response.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%208/no,%20i_m%20hearing.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDgvbm8sIGlfbSBoZWFyaW5nLndlYm0iLCJpYXQiOjE3NDM4NjAyNTMsImV4cCI6MTc3NTM5NjI1M30.NU182QaVo4u0blg_QWILpEAzGJhjykZOVmIdyzhq9RU',
      'videoLabel': 'No, I am Hearing',
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
