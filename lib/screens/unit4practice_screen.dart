import 'dart:math';
import 'package:flutter/material.dart';

import 'video_player_widget.dart';

class Unit4PracticeScreen extends StatefulWidget {
  const Unit4PracticeScreen({super.key});

  @override
  State<Unit4PracticeScreen> createState() => _Unit4PracticeScreenState();
}

class _Unit4PracticeScreenState extends State<Unit4PracticeScreen> {
  final List<Map<String, String>> practices = [
    {
      'practiceText':
          'Practice 1: You were asked how many pens you have. Try practicing this as a response.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2013/I%20have%203%20pens.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDEzL0kgaGF2ZSAzIHBlbnMud2VibSIsImlhdCI6MTc0NDExMTYxMSwiZXhwIjoxNzc1NjQ3NjExfQ.cSihi661mFR88-qr50sAfhvXNdB20LFuuhA-rTWzRV0",
      'videoLabel': 'I have 3 pens',
    },
    {
      'practiceText':
          'Practice 2: You’re going out with some friends tomorrow and you need to inform your sister. You can try signing this.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/i'm%20going%20to%20hangout%20with%20my%20friends%20on%20saturday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L2knbSBnb2luZyB0byBoYW5nb3V0IHdpdGggbXkgZnJpZW5kcyBvbiBzYXR1cmRheS53ZWJtIiwiaWF0IjoxNzQ0MTE2ODczLCJleHAiOjE3NzU2NTI4NzN9.jhi3TsgZt60ZEj5NO1eWVFPMEEaOF7AMrhilXgycYOk",
      'videoLabel': 'I’m going to hangout with my friends on Saturday',
    },
    {
      'practiceText':
          'Practice 3: You were asked when you were born. Try practicing this as a response.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2015/i%20was%20born%20on%20june%201.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE1L2kgd2FzIGJvcm4gb24ganVuZSAxLndlYm0iLCJpYXQiOjE3NDQxMTk2NzksImV4cCI6MTc3NTY1NTY3OX0.NLsFxv_wfUpQXiukMz5BCaTZLNnu5CnYMLSvryRfBBU',
      'videoLabel': 'I was born on June 1',
    },
    {
      'practiceText':
          'Practice 4: You were asked how old you were. Try practicing this!',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2016/I'm%2018%20years%20old.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE2L0knbSAxOCB5ZWFycyBvbGQud2VibSIsImlhdCI6MTc0NDEyNTM3OCwiZXhwIjoxNzc1NjYxMzc4fQ.RKfnz3d4BWcqdH2ftkEYp4-xYnSfZLsFCt1P3tGMz3Y",
      'videoLabel': 'I’m 18 years old',
    },
    {
      'practiceText':
          'Practice 5: You were asked how old your grandparents are. Try practicing this!',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2016/They%20are%2067%20years%20old.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE2L1RoZXkgYXJlIDY3IHllYXJzIG9sZC53ZWJtIiwiaWF0IjoxNzQ0MTI1MjQ2LCJleHAiOjE3NzU2NjEyNDZ9.A42UWeOkT8QgtWM8DM8xOb4DbhsDcnRmAlXuK4qqm6g',
      'videoLabel': 'They are 67 years old',
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
          'Unit 4: Practice',
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
