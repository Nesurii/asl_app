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
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%203/where%20are%20you%20going.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDMvd2hlcmUgYXJlIHlvdSBnb2luZy53ZWJtIiwiaWF0IjoxNzQ0MDE3Njk4LCJleHAiOjE3NzU1NTM2OTh9.hLnI1iU09II_kG07TKuf4gzaIFk3nrVhGdIAC84UCR4",
      'videoLabel': 'Where are you going?',
    },
    {
      'practiceText':
          'Practice 2: You were asked where you live. You can try responding like this.',
      'videoUrl':
          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%203/I%20live%20in%20manila.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDMvSSBsaXZlIGluIG1hbmlsYS53ZWJtIiwiaWF0IjoxNzQ0MDE3NjkzLCJleHAiOjE3NzU1NTM2OTN9.eUlx8yvXRw52549cEnZvIV552OCRPd8COluiqIWElnY",
      'videoLabel': 'I live in Manila',
    },
    {
      'practiceText': 'Practice 3: Try practicing your email address!',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%203/My%20email%20address%20is%20jade@gmail.com.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDMvTXkgZW1haWwgYWRkcmVzcyBpcyBqYWRlQGdtYWlsLmNvbS53ZWJtIiwiaWF0IjoxNzQ0MDM0Mzg4LCJleHAiOjE3NzU1NzAzODh9.n4uSX2cHBlVCEOPklVyp0tGkVvDk5xQWTsNX7QDslfY',
      'videoLabel': 'My email address is jade@gmail.com',
    },
    {
      'practiceText':
          'Practice 4: Try describing the weather today. You can use this as practice.',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%203/The%20weather%20is%20sunny%20today.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDMvVGhlIHdlYXRoZXIgaXMgc3VubnkgdG9kYXkud2VibSIsImlhdCI6MTc0NDExNTAxOCwiZXhwIjoxNzc1NjUxMDE4fQ.PbHgvJlsweTxB_4hdAbRycVBbPUFro01lgTpRGJGIH0',
      'videoLabel': 'The weather is sunny today',
    },
    {
      'practiceText':
          'Practice 5: You were asked to describe the weather. Try using this!',
      'videoUrl':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%203/It%20is%20rainy%20today.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDMvSXQgaXMgcmFpbnkgdG9kYXkud2VibSIsImlhdCI6MTc0NDExNTAzMiwiZXhwIjoxNzc1NjUxMDMyfQ.yJE5Vl0VCy9eUIo3Hqgb7IyhyZXmPEw2s6HwdMjNESM',
      'videoLabel': 'It is rainy today',
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
