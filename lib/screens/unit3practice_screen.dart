import 'dart:math';
import 'package:flutter/material.dart';

import 'video_player_widget.dart';

class Unit3PracticeScreen extends StatefulWidget {
  const Unit3PracticeScreen({super.key});

  @override
  State<Unit3PracticeScreen> createState() => _Unit3PracticeScreenState();
}

class _Unit3PracticeScreenState extends State<Unit3PracticeScreen> {
  final List<Map<String, String>> practices = [
    {
      'practiceText': 'Practice 1: Try signing this WH-Question.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/what.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvd2hhdC53ZWJtIiwiaWF0IjoxNzQ2NjA2NjE1LCJleHAiOjE3NzgxNDI2MTV9.beAFt0Nd4o58PBR1ysD63F34Oy2oyJa6GS4xyYK9vCM",
      'videoLabel': 'What?',
    },
    {
      'practiceText':
          'Practice 2: You were asked where you live. You replied saying you were from Bicol. You can try practicing the word “From”.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/from.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvZnJvbS53ZWJtIiwiaWF0IjoxNzQ2NjA5NDc1LCJleHAiOjE3NzgxNDU0NzV9.VAUCCizeYuFcIRN84jYWCyUUNJ9FmpnEgpKIjxdM-XU",
      'videoLabel': 'From',
    },
    {
      'practiceText': 'Practice 3: You have received an email that needs an urgent response. Try signing the word “email”! ',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/email.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvZW1haWwud2VibSIsImlhdCI6MTc0NjYxMDc3MSwiZXhwIjoxNzc4MTQ2NzcxfQ.SuiJgH09gm0SU1nz9Bjoz7zj7FnSs07iB2S_JGpRrEc',
      'videoLabel': 'Email',
    },
    {
      'practiceText':
          'Practice 4: The weather is sunny today. Try signing “weather” as practice.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%203/Lesson%2012/weather%20ver.%201.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDMvTGVzc29uIDEyL3dlYXRoZXIgdmVyLiAxLndlYm0iLCJpYXQiOjE3NDQwMzM1MjEsImV4cCI6MTc3NTU2OTUyMX0.rAeFfYeAYnV8VYTmmm2n8Y66i3Ymos_loTOe1gmEO5Q',
      'videoLabel': 'Weather',
    },
    {
      'practiceText':
          'Practice 5: You were asked to describe the weather today, and the weather forecast said that it is likely to rain. Try practicing the sign for “rain”.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/rain.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvcmFpbi53ZWJtIiwiaWF0IjoxNzQ2NjE4ODM1LCJleHAiOjE3NzgxNTQ4MzV9.UGpUbmIJgkm4S9L9Y2eWpkWiBtkQEZ1qq6tU-ylkBmQ',
      'videoLabel': 'Rain',
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
          'Unit 3: Practice',
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
