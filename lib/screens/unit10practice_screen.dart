import 'dart:math';
import 'package:flutter/material.dart';
import 'video_player_widget.dart';

class Unit10PracticeScreen extends StatefulWidget {
  const Unit10PracticeScreen({super.key});

  @override
  State<Unit10PracticeScreen> createState() => _Unit10PracticeScreenState();
}

class _Unit10PracticeScreenState extends State<Unit10PracticeScreen> {
  final List<Map<String, String>> practices = [
    {
      'practiceText':
          'Practice 1: You were asked if there is an activity you want to try. You wanted to try visiting an island. Practice the sign for “island”.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2037/island.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzNy9pc2xhbmQud2VibSIsImlhdCI6MTc0NjYzODkxOCwiZXhwIjoxNzc4MTc0OTE4fQ.-UbLuqGZT7c3qsHFHRAhJaBj_FbKZlxgVVl5XqITDRQ",
      'videoLabel': 'Island',
    },
    {
      'practiceText':
          'Practice 2: You were asked what you want to do in the future. You wanted to be a lawyer. Try practicing the sign for “lawyer”.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/lawyer.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL2xhd3llci53ZWJtIiwiaWF0IjoxNzQ2NjM4OTkzLCJleHAiOjE3NzgxNzQ5OTN9.oE-JcRqq0LL-1eFWPyg7MSaQGeUp4v8mx2W3bX6C6HM",
      'videoLabel': 'Lawyer',
    },
    {
      'practiceText':
          'Practice 3: You were enumerating the fast foods that you usually eat. Among them were french fries, spaghetti, and hamburgers. Try signing “hamburger”.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/hamburger.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9oYW1idXJnZXIud2VibSIsImlhdCI6MTc0NjYzOTA3NCwiZXhwIjoxNzc4MTc1MDc0fQ.azTBJZQ2iINorX9Z6qXuLHhR0HHCMPXH98Q2T-G_ByQ',
      'videoLabel': 'Hamburgers',
    },
    {
      'practiceText':
          'Practice 4: Your niece was asking to go to the zoo to see the alligator. Try practicing the sign for “alligator”.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2040/alligator.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiA0MC9hbGxpZ2F0b3Iud2VibSIsImlhdCI6MTc0NjYzOTEzOCwiZXhwIjoxNzc4MTc1MTM4fQ.bPmsAg7lhf5qy0-WaBpIph4Tdl1NKMVY8PeXeczhZmQ",
      'videoLabel': 'Alligator',
    },
    {
      'practiceText':
          'Practice 5: You wanted to see the giraffe in the zoo. Try signing “giraffe”.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2040/giraffe.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiA0MC9naXJhZmZlLndlYm0iLCJpYXQiOjE3NDY2MzkyMTIsImV4cCI6MTc3ODE3NTIxMn0.KC-Z8s6Mn1b_CeUgEm4q4aXjWspPWTWwugpF6Ga0ubg',
      'videoLabel': 'Giraffe',
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
          'Unit 10: Practice',
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
