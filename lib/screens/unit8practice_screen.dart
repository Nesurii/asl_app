import 'dart:math';
import 'package:flutter/material.dart';
import 'video_player_widget.dart';

class Unit8PracticeScreen extends StatefulWidget {
  const Unit8PracticeScreen({super.key});

  @override
  State<Unit8PracticeScreen> createState() => _Unit8PracticeScreenState();
}

class _Unit8PracticeScreenState extends State<Unit8PracticeScreen> {
  final List<Map<String, String>> practices = [
    {
      'practiceText':
          'Practice 1: Someone asked if you had already tried bungee jumping. Try using this as your response.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/no,%20i%20haven't%20gone%20bungee%20jumping.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L25vLCBpIGhhdmVuJ3QgZ29uZSBidW5nZWUganVtcGluZy53ZWJtIiwiaWF0IjoxNzQ0NzgzNTI2LCJleHAiOjE3NzYzMTk1MjZ9.EH5zA5qaX7xQwNry1aq1l52s0Q9_rYwZ4A-lf_sQ-aU",
      'videoLabel': 'No, I haven’t gone bungee jumping',
    },
    {
      'practiceText':
          'Practice 2: Someone asked on what time you get up during weekends. Try using this.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/on%20saturdays,%20i%20wake%20up%20around%2010_00.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL29uIHNhdHVyZGF5cywgaSB3YWtlIHVwIGFyb3VuZCAxMF8wMC53ZWJtIiwiaWF0IjoxNzQ0NzkxOTU3LCJleHAiOjE3NzYzMjc5NTd9.4x1t4vN9ziXoJ2zrcG4TAV914ouz5fB9qiOh706q8lE",
      'videoLabel': 'On Saturday I wake up around 10:00',
    },
    {
      'practiceText':
          'Practice 3: You were asked if you have a tip for having a bright and glowing skin. Try using this as a response.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2031/i%20always%20use%20sunscreen.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMxL2kgYWx3YXlzIHVzZSBzdW5zY3JlZW4ud2VibSIsImlhdCI6MTc0NDc5Mjc3NCwiZXhwIjoxNzc2MzI4Nzc0fQ.I7cbbM1oQsCyb0fow-R_v6Bmxolb_svKzasCH2I4p4Y',
      'videoLabel': 'I always use sunscreen',
    },
    {
      'practiceText':
          'Practice 4: You were asked when do you take out your trash. Try using this as a response.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2032/i%20take%20out%20my%20trash%20every%20friday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMyL2kgdGFrZSBvdXQgbXkgdHJhc2ggZXZlcnkgZnJpZGF5LndlYm0iLCJpYXQiOjE3NDQ3OTMzMzAsImV4cCI6MTc3NjMyOTMzMH0.P_WrgvqjvApN0fYsUAxWFs6JE3NXzcFS4N9UAuIzRmc",
      'videoLabel': 'I take out the trash every Friday',
    },
    {
      'practiceText':
          'Practice 5: You were asked when do you feed your dog. Try practicing this as a response.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2032/i%20feed%20my%20cat%20every%20night.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMyL2kgZmVlZCBteSBjYXQgZXZlcnkgbmlnaHQud2VibSIsImlhdCI6MTc0NDc5MzMxMywiZXhwIjoxNzc2MzI5MzEzfQ.2Yt3rZEMmZEAZuiPUCH3lzhC0HQBrfcSY5Qs_17h1gw',
      'videoLabel': 'I feed my cat every night',
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
          'Unit 8: Practice',
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
