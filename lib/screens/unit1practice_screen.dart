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
          'Practice 1: Now that you know the Alphabet signs, try fingerspelling the word GAME. You can follow the guide below.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/G.A.M.E..webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvRy5BLk0uRS4ud2VibSIsImlhdCI6MTc0NDgwMDA5OCwiZXhwIjoxNzc2MzM2MDk4fQ.nmOu_qNzjfz8t7NdBUzli33var6XypDNq6gD1qgxby0',
      'videoLabel': 'Game',
    },
    {
      'practiceText':
          'Practice 2: You were asked how you were, try this response.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%204/I_m%20fine,%20how%20are%20you.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDQvSV9tIGZpbmUsIGhvdyBhcmUgeW91LndlYm0iLCJpYXQiOjE3NDM0MzI3MzcsImV4cCI6MTc3NDk2ODczN30.y_kWhbUr1mBNaW0U0k--a9d06wX2HIHw439iua1SDPc',
      'videoLabel': 'I’m fine, how are you?',
    },
    {
      'practiceText':
          'Practice 3: You were happy meeting a new friend. Try this as farewell.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/i_m%20happy%20to%20meet%20you.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvaV9tIGhhcHB5IHRvIG1lZXQgeW91LndlYm0iLCJpYXQiOjE3NDM0MjUzNzcsImV4cCI6MTc3NDk2MTM3N30.W99IOQZX4drFbJ_KANr4XEvgenqd44fxaCc8bIyqFJI',
      'videoLabel': 'I’m happy to meet you',
    },
    {
      'practiceText':
          'Practice 4: It’s your turn to introduce yourself. Follow the visual guide below.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%204/My%20name%20is%20judith.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDQvTXkgbmFtZSBpcyBqdWRpdGgud2VibSIsImlhdCI6MTc0MzQzMjc3NSwiZXhwIjoxNzc0OTY4Nzc1fQ.75teHY1m80QNPzj2yM7dLnvEmTvAWRfMwseOh0sN7xE',
      'videoLabel': 'My name is Judith',
    },
    {
      'practiceText':
          'Practice 5: You want to introduce someone to your friends. Try the visual guide below.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%204/Her%20name%20is%20Hannah.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDQvSGVyIG5hbWUgaXMgSGFubmFoLndlYm0iLCJpYXQiOjE3NDM0MzI2NjYsImV4cCI6MTc3NDk2ODY2Nn0.Jndu8AdP9-aMXICw2QlN_w_zB-jgr2wZN1gohWGdFdE',
      'videoLabel': 'Her name is Hannah',
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
