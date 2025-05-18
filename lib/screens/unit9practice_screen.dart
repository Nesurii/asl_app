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
          'Practice 1: You have always hated the freckles on your face but some of your friends said it looked good on you, so you just accepted it and didn’t bother having it removed. Try signing the word “freckles”.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2033/freckles.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDMzL2ZyZWNrbGVzLndlYm0iLCJpYXQiOjE3NDY2Mzg1NzEsImV4cCI6MTc3ODE3NDU3MX0.bBSbeQtC5Zq1JnRCC_rjDJBucxeT7DpapYlAadgMFVA",
      'videoLabel': 'Freckles',
    },
    {
      'practiceText':
          'Practice 2: You were asked what hairstyle you wanted to try, and out of them, you want the curly hairstyle. Try practicing the sign for “curly hair”.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2034/curly%20hair.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM0L2N1cmx5IGhhaXIud2VibSIsImlhdCI6MTc0NjYzODYzOCwiZXhwIjoxNzc4MTc0NjM4fQ.6HBmh8865L_0Ha3NS_yi8j5e8_oIkdgO_NRwifT8YOY",
      'videoLabel': 'Curly hair',
    },
    {
      'practiceText':
          'Practice 3: Dresses are nice but jeans are more comfortable. Try signing “dress”.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2035/dress.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM1L2RyZXNzLndlYm0iLCJpYXQiOjE3NDY2Mzg3MTAsImV4cCI6MTc3ODE3NDcxMH0.UDLpyHor85heF2ldrFA3Qsbh5u5aIkGapMZZOeX0fxs',
      'videoLabel': 'Dress',
    },
    {
      'practiceText':
          'Practice 4: Someone asked what happened to you because you were red all over. You replied that it was because your allergies were acting up and you had already visited a doctor. Try practicing the sign for “doctor”.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2036/doctor.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM2L2RvY3Rvci53ZWJtIiwiaWF0IjoxNzQ2NjM4NzczLCJleHAiOjE3NzgxNzQ3NzN9.8K0CZRLsKIgdHj21Xl6ZLZysumUTvgm3p7b5pulApWM",
      'videoLabel': 'Doctor',
    },
    {
      'practiceText':
          'Practice 5: You explained that the reason why you didn’t attend the class yesterday was because you got hurt in a traffic accident. Try practicing the sign for “hurt”.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/hurt.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvaHVydC53ZWJtIiwiaWF0IjoxNzQ2NjE5NTk0LCJleHAiOjE3NzgxNTU1OTR9.S11RdTc1oNMFXUZ5YxQ1Irt5Wc3ndNYvwqoS8iUmBrw',
      'videoLabel': 'Hurt',
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
