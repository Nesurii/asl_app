import 'dart:math';
import 'package:flutter/material.dart';

import 'video_player_widget.dart';

class Unit1PracticeScreen extends StatefulWidget {
  const Unit1PracticeScreen({super.key});

  @override
  State<Unit1PracticeScreen> createState() => _Unit1PracticeScreenState();
}

class _Unit1PracticeScreenState extends State<Unit1PracticeScreen> {
  final List<Map<String, String>> practices = [
    {
      'practiceText':
          'Practice 1: You were greeting someone you just met at your school by saying hello. Try signing the visual guide below.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/hello.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvaGVsbG8ud2VibSIsImlhdCI6MTc0MzQyNTE3MiwiZXhwIjoxNzc0OTYxMTcyfQ.L6KBXlQYq6vf4l5bLa3Mc3wH_GrEKp83Rzq9dcumvdc',
      'videoLabel': 'Hello',
    },
    {
      'practiceText':
          'Practice 2: You were asked how you were, and you were just fine. Try signing the visual guide below.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/fine.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvZmluZS53ZWJtIiwiaWF0IjoxNzQzNDI1MDcwLCJleHAiOjE3NzQ5NjEwNzB9.1i-n5W2kUWQDha9s_tFRU92gnTpN5eMouSvhBoWzSaw',
      'videoLabel': 'Fine',
    },
    {
      'practiceText':
          'Practice 3: You were bidding goodbye to your friends, saying you’ll see them tomorrow. Try signing the visual guide below.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%203/Goodbye.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDMvR29vZGJ5ZS53ZWJtIiwiaWF0IjoxNzQzNDMxNzMyLCJleHAiOjE3NzQ5Njc3MzJ9.2RfM5qMqulkT474Id3A9IVujErIcpjQg31M6ZiGCuHQ',
      'videoLabel': 'Goodbye',
    },
    {
      'practiceText':
          'Practice 4: You introduced yourself and started by saying your name. Try to practice signing “name” and follow the visual guide below.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%204/name.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDQvbmFtZS53ZWJtIiwiaWF0IjoxNzQzNDMyNzkwLCJleHAiOjE3NzQ5Njg3OTB9.zxC4ml6ObuEBNUk3EuOLjT3SZjoBUrJ9NCu7CskqsCM',
      'videoLabel': 'Name',
    },
    {
      'practiceText':
          'Practice 5: You want to introduce someone to your friends. Try signing “friend”.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%204/friend.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDQvZnJpZW5kLndlYm0iLCJpYXQiOjE3NDM0MzI2MjAsImV4cCI6MTc3NDk2ODYyMH0.zXV7n383AKR3BrTRSL8e-k70yng1D4DkRM1vpxWEIIg',
      'videoLabel': 'Friend',
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
    final imageUrls =
        shuffledPractices[currentIndex]['imageUrls']?.split(', ') ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Unit 1: Practice',
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
