import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mypod_flutter/screens/video_player_widget.dart';

class Unit6PracticeScreen extends StatefulWidget {
  const Unit6PracticeScreen({super.key});

  @override
  State<Unit6PracticeScreen> createState() => _Unit6PracticeScreenState();
}

class _Unit6PracticeScreenState extends State<Unit6PracticeScreen> {
  final List<Map<String, String>> practices = [
    {
      'practiceText':
          'Practice 1: Try describing your family. Start by practicing the sign for “family”. Try it!',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2021/family.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIxL2ZhbWlseS53ZWJtIiwiaWF0IjoxNzQ0MjYzNTI0LCJleHAiOjE3NzU3OTk1MjR9.EWrOlp0OZ2fjrR7mthGj4j6W6DYe8QW5jdv64jASypQ",
      'videoLabel': 'Family',
    },
    {
      'practiceText':
          'Practice 2: People always say that you resemble your mother a lot. Try practicing the sign for “mother” by using this example as a reference.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2021/mother.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIxL21vdGhlci53ZWJtIiwiaWF0IjoxNzQ0MjYzMzkwLCJleHAiOjE3NzU3OTkzOTB9.12fCIlynFEKINRLRAYwIDIoj2ZtOKbPL3Ub9s1MHLik",
      'videoLabel': 'Mother',
    },
    {
      'practiceText':
          'Practice 3: You have always thought that you looked pretty in pink. Try practicing the sign for “pretty”.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2024/to%20be%20pretty.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDI0L3RvIGJlIHByZXR0eS53ZWJtIiwiaWF0IjoxNzQ0NjgwMDA2LCJleHAiOjE3NzYyMTYwMDZ9.-oio04cs8nL741dv7kNh7z-ZznAStK5ez5gKKOwNR5M',
      'videoLabel': 'Pretty',
    },
    {
      'practiceText':
          'Practice 4: You have been single all of your life and now you want to have a boyfriend. Try signing the word “boyfriend”.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/boyfriend.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL2JveWZyaWVuZC53ZWJtIiwiaWF0IjoxNzQ0MjY2NTEwLCJleHAiOjE3NzU4MDI1MTB9.ujkOt56rv90YIz2o9AxYkilIysAxhJgAkTbHwLVDu_c",
      'videoLabel': 'Boyfriend',
    },
    {
      'practiceText':
          'Practice 5: You were asked to describe why Mila is your friend. Try practicing the sign for “smart” as one of her descriptions!',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2024/to%20be%20smart.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDI0L3RvIGJlIHNtYXJ0LndlYm0iLCJpYXQiOjE3NDQ2ODAwMzYsImV4cCI6MTc3NjIxNjAzNn0.zAVTLFFzxz2rQfs7BVWlzV9AOvLqg_nS3yKe4vpjwys',
      'videoLabel': 'Smart',
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
          'Unit 6: Practice',
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
