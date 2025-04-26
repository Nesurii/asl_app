import 'dart:math';
import 'package:flutter/material.dart';
import 'video_player_widget.dart';

class Unit5PracticeScreen extends StatefulWidget {
  const Unit5PracticeScreen({super.key});

  @override
  State<Unit5PracticeScreen> createState() => _Unit5PracticeScreenState();
}

class _Unit5PracticeScreenState extends State<Unit5PracticeScreen> {
  final List<Map<String, String>> practices = [
    {
      'practiceText': 'Practice 1: Try practicing this!',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/10_15.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3LzEwXzE1LndlYm0iLCJpYXQiOjE3NDQyODI3MDYsImV4cCI6MTc3NTgxODcwNn0.R4C4XrblTR9ynHWVxDfJyJ9FLaoUEAJoDCleOQSA9Sg",
      'videoLabel': '10:15',
    },
    {
      'practiceText': 'Practice 2: Try signing this!',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2018/17.50%20dollars.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE4LzE3LjUwIGRvbGxhcnMud2VibSIsImlhdCI6MTc0NDIzNjA1OCwiZXhwIjoxNzc1NzcyMDU4fQ.jNoJgq9BpSp_DiJBdrzEt9kN43qMtcTIKGJs8DwXbFU",
      'videoLabel': '17.50 dollars',
    },
    {
      'practiceText':
          'Practice 3: Try practicing what you’ve learned about the rule of 9. The base would be months.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2019/13%20months.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE5LzEzIG1vbnRocy53ZWJtIiwiaWF0IjoxNzQ0MjM2MzYwLCJleHAiOjE3NzU3NzIzNjB9.vForlpUcyCnbqdGwyAo2PcIqkw0ChNgO4zv4DZDw83U',
      'videoLabel': '13 months',
    },
    {
      'practiceText': 'Practice 4: Try practicing this future tense sentence.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2020/soon%20i'll%20be%2023%20years%20old.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDIwL3Nvb24gaSdsbCBiZSAyMyB5ZWFycyBvbGQud2VibSIsImlhdCI6MTc0NDI0OTM1MSwiZXhwIjoxNzc1Nzg1MzUxfQ.QPq6iyNPJ5Cs5wWG42HO0c-63xMZ3BRyj4b0SGBfY1o",
      'videoLabel': 'Soon I’ll be 23 years old',
    },
    {
      'practiceText': 'Practice 5: Try practicing this past tense sentence.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2020/i%20was%20sick%20last%20month.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDIwL2kgd2FzIHNpY2sgbGFzdCBtb250aC53ZWJtIiwiaWF0IjoxNzQ0MjQ5NDczLCJleHAiOjE3NzU3ODU0NzN9.sikG3rpUvjDy3m6KNLwQeiONx_ScAWq8dd5jwLjCUzw',
      'videoLabel': 'I was sick last month',
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
          'Unit 5: Practice',
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
