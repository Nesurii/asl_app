import 'dart:math';
import 'package:flutter/material.dart';

import 'video_player_widget.dart';

class Unit4PracticeScreen extends StatefulWidget {
  const Unit4PracticeScreen({super.key});

  @override
  State<Unit4PracticeScreen> createState() => _Unit4PracticeScreenState();
}

class _Unit4PracticeScreenState extends State<Unit4PracticeScreen> {
  final List<Map<String, String>> practices = [
    {
      'practiceText':
          'Practice 1: You were asked how many pens you have, and you have three of them. Try signing the number “three”.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2019/3.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE5LzMud2VibSIsImlhdCI6MTc0NDIzNjI5MSwiZXhwIjoxNzc1NzcyMjkxfQ.X6BOY7afzBBEuW_sTsHVkeGAC-mDzjbrNdMQUq0HUaY",
      'videoLabel': 'Three',
    },
    {
      'practiceText':
          'Practice 2: You’re going out with some friends on Tuesday, and you need to inform your sister. Try signing the word “Tuesday”.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/tuesday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3R1ZXNkYXkud2VibSIsImlhdCI6MTc0NDE3MTQzNywiZXhwIjoxNzc1NzA3NDM3fQ.SC1MBJvGwf_64367wPS2sVUrVFW7fY61ANnQjfxq20w",
      'videoLabel': 'Tuesday',
    },
    {
      'practiceText':
          'Practice 3: Kids like the month of April since they get to do pranks and you are also one of them. Try practicing the sign for “April”.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2015/april.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE1L2FwcmlsLndlYm0iLCJpYXQiOjE3NDQxMTk3OTMsImV4cCI6MTc3NTY1NTc5M30.w_S9l3Xh0rAsMJGrtviJISO4-D6-FgidydJZnd427ek',
      'videoLabel': 'April',
    },
    {
      'practiceText':
          'Practice 4: You have many hilarious memories from your childhood, especially the adventures you did as a child. Try practicing the sign for “child”.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2016/child.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE2L2NoaWxkLndlYm0iLCJpYXQiOjE3NDQxMjU0NDgsImV4cCI6MTc3NTY2MTQ0OH0.b2aVlekfBccm91Mo0-U6K6zgAQXUVG2wr3Z4rjMj90M",
      'videoLabel': 'Child',
    },
    {
      'practiceText':
          'Practice 5: You have noticed that your parents are now old because their hair are now turning gray. Try practicing the sign for “Old”.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/old.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvb2xkLndlYm0iLCJpYXQiOjE3NDY2MTg5MjgsImV4cCI6MTc3ODE1NDkyOH0.O2-4tC4gbmXgdt42hZURz3wDMweelbDIY7A_hNs71QY',
      'videoLabel': 'Old',
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
          'Unit 4: Practice',
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
