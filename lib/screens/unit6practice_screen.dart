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
          'Practice 1: Try describing your family, you can use this as a basis. Try it!',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2021/my%20family%20is%20big,%20i%20have%204%20brothers.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIxL215IGZhbWlseSBpcyBiaWcsIGkgaGF2ZSA0IGJyb3RoZXJzLndlYm0iLCJpYXQiOjE3NDQyNjMzNzksImV4cCI6MTc3NTc5OTM3OX0.ygulP2cz8xMOPbqe_oTrJJrxHo-dwl3_I7PwK-_o4cY",
      'videoLabel': 'My family is big, I have four brothers',
    },
    {
      'practiceText':
          'Practice 2: Try practicing shoulder shifting, use this example as a reference.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2022/i%20have%202%20brothers,%20neil%20and%20marc.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIyL2kgaGF2ZSAyIGJyb3RoZXJzLCBuZWlsIGFuZCBtYXJjLndlYm0iLCJpYXQiOjE3NDQyNjM4NTYsImV4cCI6MTc3NTc5OTg1Nn0.mXeSVj84CQofHee49My94ybc8TZA_41udLZhIiMyq2M",
      'videoLabel': 'I have two brothers, Niel and Marc',
    },
    {
      'practiceText':
          'Practice 3: You were asked to describe your friend. Try using this!',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/may%20is%20my%20best%20friend%20she%20is%20a%20good%20friend.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL21heSBpcyBteSBiZXN0IGZyaWVuZCBzaGUgaXMgYSBnb29kIGZyaWVuZC53ZWJtIiwiaWF0IjoxNzQ0MjY2MzcyLCJleHAiOjE3NzU4MDIzNzJ9.oVZDJXl9SZDdqUWf9vUQUYzjQ9cemJR839hIc7vpxK4',
      'videoLabel': 'May is my best friend, she is a good friend.',
    },
    {
      'practiceText':
          'Practice 4: You were asked what your relationship with each other was. Try responding like this!',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2024/the%20two%20of%20us%20are%20dating.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDI0L3RoZSB0d28gb2YgdXMgYXJlIGRhdGluZy53ZWJtIiwiaWF0IjoxNzQ0Njc5NTQxLCJleHAiOjE3NzYyMTU1NDF9.Z28UkfkudRVzFb2RUn1bx7_8b99TS-YxvgFS1NXGWuU",
      'videoLabel': 'The two of us are dating',
    },
    {
      'practiceText':
          'Practice 5: You were asked to describe why Mila is your friend. Try using this!',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2024/mila%20is%20pretty%20and%20smart.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDI0L21pbGEgaXMgcHJldHR5IGFuZCBzbWFydC53ZWJtIiwiaWF0IjoxNzQ0Njc5NDAyLCJleHAiOjE3NzYyMTU0MDJ9.gvLl1cFXqemTLG0Fte5rPTMh-9K0cbMB-i-G4Qtz3_I',
      'videoLabel': 'Mila is pretty and smart',
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
