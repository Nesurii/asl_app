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
      'practiceText': "Practice 1: Your classes on Mondays and Wednesdays always start at 9 o'clock.Try practicing the sign for this!",
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/9%20o'clock.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvOSBvJ2Nsb2NrLndlYm0iLCJpYXQiOjE3NDY2MTkzNTMsImV4cCI6MTc3ODE1NTM1M30.gmT7zZuGVAujIMRLq8TnosuCWgpzVrSDF_AFDWVvy6U",
      'videoLabel': '9 o’clock',
    },
    {
      'practiceText': 'Practice 2: The price of all the fruits that you bought from the market costs 5 dollars. Try signing “5 dollars”!',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/5%20dollars.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvNSBkb2xsYXJzLndlYm0iLCJpYXQiOjE3NDY2MzU1OTgsImV4cCI6MTc3ODE3MTU5OH0.J41Y2xvyBCbzlKXywtXnqrfmYJGcECzlK-Xcf28903A",
      'videoLabel': '5 dollars',
    },
    {
      'practiceText':
          'Practice 3: TIt took me 8 hours to travel from Bicol to Manila. Try practicing what you’ve learned about the rule of 9. The base would be hours.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/8%20hours.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvOCBob3Vycy53ZWJtIiwiaWF0IjoxNzQ2NjE5MzkyLCJleHAiOjE3NzgxNTUzOTJ9.X_rk8YKyRXdQ-aeO5J5EWMFGmj0QRkm_ss9elp5XI9A',
      'videoLabel': '8 hours',
    },
    {
      'practiceText': 'Practice 4: Soon, you will be turning 23 years old. Try signing “soon”.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2020/soon.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDIwL3Nvb24ud2VibSIsImlhdCI6MTc0NDI0OTM0MCwiZXhwIjoxNzc1Nzg1MzQwfQ.3laIm97jV3NJtruvLK4lV8v5tOe6UMrY9fH8bEdFz80",
      'videoLabel': 'Soon',
    },
    {
      'practiceText': 'Practice 5: You were sick last week, try practicing the sign for “last week”',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/last%20week.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvbGFzdCB3ZWVrLndlYm0iLCJpYXQiOjE3NDY2MTk0OTYsImV4cCI6MTc3ODE1NTQ5Nn0.bOZbaA84l6xFIzeqLEQnQ2bn1pfbT0Ar5lCUwno_wJ0',
      'videoLabel': 'Last week',
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
