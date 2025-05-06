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
          'Practice 1: You were asked if there is an activity you want to try. Use this as a reference and practice it!',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2037/i%20want%20to%20hike%20in%20the%20mountains.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzNy9pIHdhbnQgdG8gaGlrZSBpbiB0aGUgbW91bnRhaW5zLndlYm0iLCJpYXQiOjE3NDQ4MjUyODIsImV4cCI6MTc3NjM2MTI4Mn0.2j5lTB0FfBp_6lMxs9C7uXKDJqIJ8YrvCp8IDm7p5Y8",
      'videoLabel': 'I want to hike in the mountains',
    },
    {
      'practiceText':
          'Practice 2: You were asked what you want to do in the future. Try using this as an example and practice it.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2038/i%20want%20to%20be%20a%20photographer.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOC9pIHdhbnQgdG8gYmUgYSBwaG90b2dyYXBoZXIud2VibSIsImlhdCI6MTc0NTIzNzc2OCwiZXhwIjoxNzc2NzczNzY4fQ.xy0F2zhmdvl2mNAAcJ_IECXhh76gRivpAtpICvXQt3E",
      'videoLabel': 'I want to be a photographer',
    },
    {
      'practiceText':
          'Practice 3: You were asked if you eat fastfood. Try using this as a response.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/yes,%20i%20like%20french%20fries,%20spaghetti%20and%20burger.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL3llcywgaSBsaWtlIGZyZW5jaCBmcmllcywgc3BhZ2hldHRpIGFuZCBidXJnZXIud2VibSIsImlhdCI6MTc0NDg4ODI2MSwiZXhwIjoxNzc2NDI0MjYxfQ.q9F5Fgwa1qELfFXjBEvilsV9eaxiB4XuD9-4vg_CKgA',
      'videoLabel': 'Yes, I like french fries, spaghetti, and hamburgers',
    },
    {
      'practiceText':
          'Practice 4: Your niece was asking to go to the zoo. Try this response and practice it.',
      'videoUrl':
          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2040/sure,%20let's%20go%20to%20the%20zoo.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiA0MC9zdXJlLCBsZXQncyBnbyB0byB0aGUgem9vLndlYm0iLCJpYXQiOjE3NDQ4MjgzMzEsImV4cCI6MTc3NjM2NDMzMX0.SvatnQP_R8lV3rUQVTKMHFvCP76842plqlccj29_iJQ",
      'videoLabel': 'Sure, let’s go to the zoo',
    },
    {
      'practiceText':
          'Practice 5: You were asked what animals you want to see in the zoo. Try using this example as a practice.',
      'videoUrl':
          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2040/i%20want%20to%20see%20the%20dolphins%20and%20the%20penguins.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiA0MC9pIHdhbnQgdG8gc2VlIHRoZSBkb2xwaGlucyBhbmQgdGhlIHBlbmd1aW5zLndlYm0iLCJpYXQiOjE3NDQ4MjgyNTQsImV4cCI6MTc3NjM2NDI1NH0.0rLLX_IAoC-oVIt22c_LOIOEjPtU3XG5XHoYWEUfmCM',
      'videoLabel': 'I want to see the dolphins and the penguins',
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
