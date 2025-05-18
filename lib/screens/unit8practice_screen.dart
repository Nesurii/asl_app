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
          'Practice 1: Even though you are not sporty you have always liked watching sports, especially softball. Try signing “softball”.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/softball.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3NvZnRiYWxsLndlYm0iLCJpYXQiOjE3NDY2Mzc3NTIsImV4cCI6MTc3ODE3Mzc1Mn0.eD80rQOlGv_che2RNghlzTnNlJusHNEhxKSdXuJZdS4",
      'videoLabel': 'Softball',
    },
    {
      'practiceText':
          'Practice 2: You always exercise every night as part of your daily routine. Try practicing the sign for “every night”.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/every%20night.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2V2ZXJ5IG5pZ2h0LndlYm0iLCJpYXQiOjE3NDY2Mzc4NDcsImV4cCI6MTc3ODE3Mzg0N30.Gmp0bUwj-pjsPU9Im4pl2ZLMMnCkk7ALhaGrWhwwqHc",
      'videoLabel': 'Every night',
    },
    {
      'practiceText':
          'Practice 3: You noticed that your stocks of shampoo were running out so you stepped out to buy some. Try practicing the sign for “shampoo”.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2031/shampoo.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMxL3NoYW1wb28ud2VibSIsImlhdCI6MTc0NjYzNzkyNiwiZXhwIjoxNzc4MTczOTI2fQ.hXzQ_0RsnXEII-iUXMW_wnHhplYD6w5lmqXmt1Ajtm0',
      'videoLabel': 'Shampoo',
    },
     {
      'practiceText':
          'Practice 4: You were always tasked with washing the dishes in your house. Try signing “wash the dishes”.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2032/to%20do%20the%20dishes.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMyL3RvIGRvIHRoZSBkaXNoZXMud2VibSIsImlhdCI6MTc0NjYzODM3OSwiZXhwIjoxNzc4MTc0Mzc5fQ.envXXz9tAujVVjaopeV8Iyhlmoj0lFlb72VTrKSSBnw',
      'videoLabel': 'Wash the dishes',
    },
    {
      'practiceText':
          'Practice 5: You were asked to clean your room today. Try practicing the sign for “clean”.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2032/to%20clean.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMyL3RvIGNsZWFuLndlYm0iLCJpYXQiOjE3NDY2Mzg0MzksImV4cCI6MTc3ODE3NDQzOX0.E-OeEg9295vBFgrmWjgpyBBC9P0Q8DWkiKF5XCN7GBY',
      'videoLabel': 'Clean”',
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
