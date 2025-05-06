import 'dart:math';
import 'package:flutter/material.dart';
import 'video_player_widget.dart';

class Unit9PracticeScreen extends StatefulWidget {
  const Unit9PracticeScreen({super.key});

  @override
  State<Unit9PracticeScreen> createState() => _Unit9PracticeScreenState();
}

class _Unit9PracticeScreenState extends State<Unit9PracticeScreen> {
  final List<Map<String, String>> practices = [
    {
      'practiceText':
          'Practice 1: You were asked to describe your friend. Try this!',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2033/max%20is%20asian%20and%20he%20is%20muscular.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDMzL21heCBpcyBhc2lhbiBhbmQgaGUgaXMgbXVzY3VsYXIud2VibSIsImlhdCI6MTc0NDgxNjk2OSwiZXhwIjoxNzc2MzUyOTY5fQ.BeRuLa4HbPSFg8Dhy0vBuk5ttThBmWv9S8sI4OLf3iQ",
      'videoLabel': 'Max is Asian and he is muscular',
    },
    {
      'practiceText':
          'Practice 2: You were asked what hairstyle you prefer. Try using this as an example.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2034/i%20like%20having%20long%20hair.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM0L2kgbGlrZSBoYXZpbmcgbG9uZyBoYWlyLndlYm0iLCJpYXQiOjE3NDQ4MTcyMjAsImV4cCI6MTc3NjM1MzIyMH0.u3aZmXEC10OMginHjPd7BHLNnMfsD2c8Fh0jfZOq41M",
      'videoLabel': 'I like having long hair',
    },
    {
      'practiceText':
          'Practice 3: You were asked what style of clothes you usually wear. Try using this example as a response.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2035/i%20like%20to%20wear%20sweatshirts%20and%20jeans.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM1L2kgbGlrZSB0byB3ZWFyIHN3ZWF0c2hpcnRzIGFuZCBqZWFucy53ZWJtIiwiaWF0IjoxNzQ0ODIyNzU2LCJleHAiOjE3NzYzNTg3NTZ9.9JBILRzhnhyHNJcZ-9hYxx9I32yDfUNi4Onn8qEF8G4',
      'videoLabel': 'I like to wear sweatshirts and jeans',
    },
    {
      'practiceText':
          'Practice 4: Someone asked what happened to you because you were red all over. Try practicing this as a response.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2036/my%20allergies%20started%20acting%20up%20yesterday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM2L215IGFsbGVyZ2llcyBzdGFydGVkIGFjdGluZyB1cCB5ZXN0ZXJkYXkud2VibSIsImlhdCI6MTc0NDgyMzMyMSwiZXhwIjoxNzc2MzU5MzIxfQ.Zs0OAz_GPyNoHWSjUBIsFkCYbF_y4jvQEpneOtjGpW4",
      'videoLabel': 'My allergies started acting up yesterday',
    },
    {
      'practiceText':
          'Practice 5: You were asked why you didn’t attend the class yesterday. Try this as a response.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2036/i%20got%20sick%20yesterday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM2L2kgZ290IHNpY2sgeWVzdGVyZGF5LndlYm0iLCJpYXQiOjE3NDQ4MjMyOTMsImV4cCI6MTc3NjM1OTI5M30.re-pxGz-Jo6sjB4bmJUuHo8XOpRblqe9lnnHh_AS_vo',
      'videoLabel': 'I got sick yesterday',
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
          'Unit 9: Practice',
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
