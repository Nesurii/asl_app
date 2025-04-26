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
          'Practice 1: You were asked if you had a class today. Try responding like this!',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2025/I%20have%20a%20class%20on%20room%207.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI1L0kgaGF2ZSBhIGNsYXNzIG9uIHJvb20gNy53ZWJtIiwiaWF0IjoxNzQ0NjQzNTI5LCJleHAiOjE3NzYxNzk1Mjl9.fSRt7Ct_DpH-otSukl7fYlIxgIXXWN3kiHYRTPmTt3Y",
      'videoLabel': 'I have a class on room 7',
    },
    {
      'practiceText':
          'Practice 2: You were asked who was teaching you ASL. Try responding like this!',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2026/my%20asl%20teacher%20is%20andy.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI2L215IGFzbCB0ZWFjaGVyIGlzIGFuZHkud2VibSIsImlhdCI6MTc0NDY0ODQ5NCwiZXhwIjoxNzc2MTg0NDk0fQ.dcKfyl2QNS4NChiEw80-4rL8KnQMB4xrhkGfPPB08vc",
      'videoLabel': 'My ASL teacher is Andy',
    },
    {
      'practiceText':
          'Practice 3: Your friend asked you if you have a class later. Try answering like this example.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2027/yes,%20i%20have%20a%20chemistry%20class%20later.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI3L3llcywgaSBoYXZlIGEgY2hlbWlzdHJ5IGNsYXNzIGxhdGVyLndlYm0iLCJpYXQiOjE3NDQ2NTMzNTIsImV4cCI6MTc3NjE4OTM1Mn0.kkWkHRCQdjB5lQ4LctQLFV_R3qOH4_tIYQABcuUS0Qs',
      'videoLabel': 'Yes, I have a chemistry class later',
    },
    {
      'practiceText':
          'Practice 4: You were asked about how many people are attending the party. Try this example as a response.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/35%20people%20are%20going%20to%20the%20party.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4LzM1IHBlb3BsZSBhcmUgZ29pbmcgdG8gdGhlIHBhcnR5LndlYm0iLCJpYXQiOjE3NDQ2NTQ1ODYsImV4cCI6MTc3NjE5MDU4Nn0.w9l02L_PCBgkdgau1USSblbCTp4PaThm3XFAi5sKKhs",
      'videoLabel': 'Thirty-five people are going to the party',
    },
    {
      'practiceText':
          'Practice 5: You were at the park with your dog when you bumped into your friend and your dog being friendly pounced on your friend which was a bit startled by it. Try this to explain the situation.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/my%20dog%20tends%20to%20jump%20on%20people.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L215IGRvZyB0ZW5kcyB0byBqdW1wIG9uIHBlb3BsZS53ZWJtIiwiaWF0IjoxNzQ0NjU1MDk1LCJleHAiOjE3NzYxOTEwOTV9.8dvQiNhORRn4J5wO2Um66l-mMVv2HFe8p9cexynAFlE',
      'videoLabel': 'My dog tends to jump on people',
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
