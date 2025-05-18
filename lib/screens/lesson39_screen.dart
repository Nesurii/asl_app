import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../services/completed_lessons_progress.dart';
import '../services/state_progress.dart';
import 'video_player_widget.dart';

class Lesson39Screen extends StatefulWidget {
  final String lessonId;

  const Lesson39Screen({super.key, required this.lessonId});

  @override
  State<Lesson39Screen> createState() => _Lesson39ScreenState();
}

class _Lesson39ScreenState extends State<Lesson39Screen> {
  int currentIndex = 0;
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();
  final lessonManager = LessonManager();

  bool lessonCompleted = false;
  bool answeredQuestion1 = false;
  bool answeredQuestion2 = false;
  bool answeredQuestion5 = false;
  bool answered1 = false;
  bool answered2 = false;

  final List<Map<String, dynamic>> lessonSections = [
    {
      'title': 'Going to the grocery store',
    },
    {
      'title': 'Vocabulary: Dessert and Sweets',
    },
    {
      'title': 'Vocabulary: Meat and Dairy',
    },
    {
      'title': 'Vocabulary: Meals and Fast foods',
    },
    {
      'title': 'Lesson Completed!',
    },
    {
      'title': 'Exercise',
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedPage();
  }

  Future<void> _loadSavedPage() async {
    final currentState = await lessonManager.getCurrentState();

    if (currentState != null) {
      final lessonPages =
          Map<String, dynamic>.from(currentState['lesson_pages'] ?? {});
      final savedPageTitle = lessonPages[widget.lessonId];

      if (savedPageTitle != null) {
        // Parse the page number from savedPageTitle
        final match = RegExp(r'Page (\d+):').firstMatch(savedPageTitle);
        if (match != null) {
          final savedPageIndex = int.tryParse(match.group(1)!);
          if (savedPageIndex != null &&
              savedPageIndex < lessonSections.length) {
            setState(() {
              currentIndex = savedPageIndex; // Jump to saved page
            });
          }
        }
      }
    }
  }

  void nextSection() {
    if (currentIndex < lessonSections.length - 1) {
      setState(() {
        currentIndex++;
      });
      _saveCurrentPage();
    }
  }

  void previousSection() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      _saveCurrentPage();
    }
  }

  @override
  void dispose() {
    if (!lessonCompleted) {
      _saveCurrentPage();
    }
    super.dispose();
  }

  Future<void> _saveCurrentPage() async {
    final section = lessonSections[currentIndex];

    await lessonManager.updateCurrentPageForLesson(
      widget.lessonId,
      'Page $currentIndex: ${section['title']}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final section = lessonSections[currentIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Lesson 39 - ${section['title']}',
          style: TextStyle(
            fontSize: 18,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Builder(
                        builder: (context) {
                          switch (section['title']) {
                            case 'Going to the grocery store':
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "Most food items are fingerspelled in American Sign Language. Foods similar in shape or size, such as cucumbers and zucchinis, are often signed using a classifier followed by the fingerspelled word. If you don't know a particular sign, describe the food in detail and you will likely be understood.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/grocery%20store.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9ncm9jZXJ5IHN0b3JlLndlYm0iLCJpYXQiOjE3NDY2NzI3MzksImV4cCI6MTc3ODIwODczOX0.BNuX3tq351sZytMSCrempaiGPEyFKLfnG5b_mG_1KCo'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Grocery Store",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Vocabulary: Work and Study",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/apple.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9hcHBsZS53ZWJtIiwiaWF0IjoxNzQ2NjcyNzY0LCJleHAiOjE3NzgyMDg3NjR9.yrR_cC9DhpMMQz2bU58aWD1DU9mg19rh4Vf8CTf71qE'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Apple",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/banana.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9iYW5hbmEud2VibSIsImlhdCI6MTc0NjY3Mjc5NSwiZXhwIjoxNzc4MjA4Nzk1fQ.5peQEJwUtWhfzquTll7JBAQgNlQMxRVstMZdElmr1uw'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Banana",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/cherry.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9jaGVycnkud2VibSIsImlhdCI6MTc0NjY3Mjg0MSwiZXhwIjoxNzc4MjA4ODQxfQ.Sq4HMkp24jDthlaI9ojATiG798MeJE_-OvTwiPZzYbg'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Cherry",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/fruits.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9mcnVpdHMud2VibSIsImlhdCI6MTc0NjY3Mjg4MiwiZXhwIjoxNzc4MjA4ODgyfQ.Xvb4bfGtZYVaqUimgPJtH-GkOmsV4ES0eNNWIRntjUU'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Fruit",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/grapes.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9ncmFwZXMud2VibSIsImlhdCI6MTc0NjY3MjkxMCwiZXhwIjoxNzc4MjA4OTEwfQ.deCFHsCWYzQtRjAaqypy6OLFZeOxiqIvl1j0exc9wbk'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Grapes",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/melon.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9tZWxvbi53ZWJtIiwiaWF0IjoxNzQ2NjcyOTM4LCJleHAiOjE3NzgyMDg5Mzh9.mV4AHfVfvu3kfD9tB7yhTUTF7Uv8VYqxc5gpRtcA5Gw'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Melon",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/orange.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9vcmFuZ2Uud2VibSIsImlhdCI6MTc0NjY4OTM0MywiZXhwIjoxNzc4MjI1MzQzfQ.8OUZsW6H3cvaeWS6QYNcxuTYT6q-0MNVcfnuygJKWOo'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Orange",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/peach.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9wZWFjaC53ZWJtIiwiaWF0IjoxNzQ2NjczMDAyLCJleHAiOjE3NzgyMDkwMDJ9.IHsDqrnUo194f9aX8fDx8opcle6Weut44sDfs18L2oE'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Peach",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/pineapple.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9waW5lYXBwbGUud2VibSIsImlhdCI6MTc0NjY3MzAzMywiZXhwIjoxNzc4MjA5MDMzfQ.0s9IFdXrD_A0IfQJCpD3DFKvRpnphTPHGT9LxZGHItI'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Pineapple",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/potato.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9wb3RhdG8ud2VibSIsImlhdCI6MTc0NjY3MzA1NywiZXhwIjoxNzc4MjA5MDU3fQ.K04ZKYR1qnmSuyJOoQOwltNkjv5xRymb1Kz6rvTI9gA'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Potato",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/salad.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9zYWxhZC53ZWJtIiwiaWF0IjoxNzQ2NjczMDkzLCJleHAiOjE3NzgyMDkwOTN9.oh7Quvc2AJQ_zXAWOsUvskMzwnmTGgs5zcOzZpaiz8s'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Salad",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/strawberry.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9zdHJhd2JlcnJ5LndlYm0iLCJpYXQiOjE3NDY2NzMxMjgsImV4cCI6MTc3ODIwOTEyOH0.QoLJmzxqwL9Ztcnxke7QAeYjmhngZPlfyF0spUeweUg'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Strawberry",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/tomato.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS90b21hdG8ud2VibSIsImlhdCI6MTc0NjY3MzE1NiwiZXhwIjoxNzc4MjA5MTU2fQ.293rRkIH-s73X6YCJO8rF4t7BXpNemki0xTM7td81zE'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Tomato",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/vegetable.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS92ZWdldGFibGUud2VibSIsImlhdCI6MTc0NjY3MzE4OCwiZXhwIjoxNzc4MjA5MTg4fQ.GeA9QZ6CQWhoXKei9i2cyZVT08VEDewt5xuMGZ-gtYg'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Vegetable",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: "Fingerspelled:",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                "Apricot\nAvocado\nBell pepper\nBerry\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "Blackberry\nBroccoli\nCarrot\nCauliflower\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "Celery\nCorn\nCucumber\nGarlic\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "Grapefruit\nMango\nPapaya\nPear\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "Peas\nPlum\nRadish\nRaisins\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "Raspberry\nSpinach\nString beans\nTangerine",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: Dessert and Sweets':
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                "Vocabulary: Dessert and Sweets",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/candy.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9jYW5keS53ZWJtIiwiaWF0IjoxNzQ2NjczMjIwLCJleHAiOjE3NzgyMDkyMjB9.Pi12p0lNtBe5olKQooxj3EK0qJuFBNtRta27vWb0LNA'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Candy",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/chocolate.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9jaG9jb2xhdGUud2VibSIsImlhdCI6MTc0NjY3MzI0OCwiZXhwIjoxNzc4MjA5MjQ4fQ.GCsO0Vg_udTgdWvySwqZjTlIOibOh2GJ7rSTHLXFKpg'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Chocolate",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/cookie.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9jb29raWUud2VibSIsImlhdCI6MTc0NjY3MzMwNiwiZXhwIjoxNzc4MjA5MzA2fQ.103cVyK55gx6I-CSznnEVRN9BLHHuPUu2zz1GgcVTzc'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Cookie",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/dessert.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9kZXNzZXJ0LndlYm0iLCJpYXQiOjE3NDY2NzMzMzUsImV4cCI6MTc3ODIwOTMzNX0.ZPPHjGj9oNFAGnzESTwhRpNBOgHa6MVOzNyk7Y42XHM'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Dessert",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/ice%20cream.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9pY2UgY3JlYW0ud2VibSIsImlhdCI6MTc0NjY3MzM3MiwiZXhwIjoxNzc4MjA5MzcyfQ.D6smRC95GDsH8rPe8QTumDWfGS2lsek5zcNNEqdkEE0'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Ice cream",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: "Fingerspelled:",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Brownie\nCake\nChips\n\n",
                                          ),
                                          TextSpan(
                                            text: "Cupcake\nPie\n\n",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );
                            case 'Vocabulary: Meat and Dairy':
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Vocabulary: Meat and Dairy",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/bacon.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9iYWNvbi53ZWJtIiwiaWF0IjoxNzQ2NjczNDA0LCJleHAiOjE3NzgyMDk0MDR9.ah3yXh2ZtfuM3zOPL93vdj7nJIMTTUpTBPabusnec38'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Bacon",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/butter.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9idXR0ZXIud2VibSIsImlhdCI6MTc0NjY3MzQ0MiwiZXhwIjoxNzc4MjA5NDQyfQ.L8BGtQotHNuopaCqBtuFSGHmiTJ_jBllem4a1-kxuGk'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Butter",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/cheese.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9jaGVlc2Uud2VibSIsImlhdCI6MTc0NjY3MzQ5NCwiZXhwIjoxNzc4MjA5NDk0fQ.xU2XorjGV5OCISe2nhlEkyqT-bY3FQowjrPVowhRK_I'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Cheese",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/egg.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9lZ2cud2VibSIsImlhdCI6MTc0NjY3MzUzNSwiZXhwIjoxNzc4MjA5NTM1fQ.A8FUjSlUUzC2ns1vbhf68OLTO52LFQRoGNGv_ZJ7EFg'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Egg",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/hotdog.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9ob3Rkb2cud2VibSIsImlhdCI6MTc0NjY3MzU3NCwiZXhwIjoxNzc4MjA5NTc0fQ.yRzbU77CXPLi_z_S-VwWnKNhh_Z7ddspKmlyC1bJPyw'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Hot dog/Sausage",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/meat.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9tZWF0LndlYm0iLCJpYXQiOjE3NDY2NzM2MDUsImV4cCI6MTc3ODIwOTYwNX0.1EhVo6t6mfp2gPjXADHj4nnytb7x9L01pQGVfi8Lz8Q'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Meat/Beef ",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/milk.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9taWxrLndlYm0iLCJpYXQiOjE3NDY2NzM2MzQsImV4cCI6MTc3ODIwOTYzNH0.fMMpi97LMDdE5W8A4xgb5ALlg9qSQ5wIEYbAi_sfVjA'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Milk",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/turkey.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS90dXJrZXkud2VibSIsImlhdCI6MTc0NjY3MzY3MSwiZXhwIjoxNzc4MjA5NjcxfQ.h5TjTfyO8ZSPhIqy8KByvIVZ_ud8YzmF9LcpUUE4YSQ'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Turkey",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: "Fingerspelled:",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Clam\nCrab\nHam\nLamb\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "Lobster\nOyster\nPork\nPork Chops\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "Ribs\nRoast beef\nShrimp\nSushi\n\n",
                                          ),
                                          TextSpan(
                                            text: "Tofu\nYogurt",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: Meals and Fast foods':
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                "Vocabulary: Meals and Fast foods",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/bread.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9icmVhZC53ZWJtIiwiaWF0IjoxNzQ2NjczNjk4LCJleHAiOjE3NzgyMDk2OTh9.FuAuwgfxnLPQpmrc4RqPLCohCcIhYmJRVB3pcHa6jII'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Bread",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/cereal.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9jZXJlYWwud2VibSIsImlhdCI6MTc0NjY3MzcyOCwiZXhwIjoxNzc4MjA5NzI4fQ.iKphGqLIXCiAchs4q-0iLd3311P2eAGzFiQ7x2jAgwQ'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Cereal (Version 1)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/cereal%20ver%202.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9jZXJlYWwgdmVyIDIud2VibSIsImlhdCI6MTc0NjY3Mzc2OCwiZXhwIjoxNzc4MjA5NzY4fQ.m0m5Zp60DTYRqg6LzP-Lq9jy1H-_JbQi-UcpRIFYPjk'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Cereal (Version 2)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/french%20fries.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9mcmVuY2ggZnJpZXMud2VibSIsImlhdCI6MTc0NjY3MzgwMCwiZXhwIjoxNzc4MjA5ODAwfQ.KQHLiYiaNgbFtYRgQjJZGj04lZlK6Cavs8SoxuaSt5o'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "French fries",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/hamburger.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9oYW1idXJnZXIud2VibSIsImlhdCI6MTc0NjYzOTA3NCwiZXhwIjoxNzc4MTc1MDc0fQ.azTBJZQ2iINorX9Z6qXuLHhR0HHCMPXH98Q2T-G_ByQ'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Hamburger",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/pizza.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9waXp6YS53ZWJtIiwiaWF0IjoxNzQ2NjczODY2LCJleHAiOjE3NzgyMDk4NjZ9.C9lBGAB6M9L44lmdoUSxlKI7SYEZ9kHR5F23r_0T2nE'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Pizza",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/sandwich.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9zYW5kd2ljaC53ZWJtIiwiaWF0IjoxNzQ2NjczODk3LCJleHAiOjE3NzgyMDk4OTd9.865LXYg5ysohU_8mNI73lZ3uUM-Aw8yQ5D6IOARdrgI'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Sandwich",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/soup.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9zb3VwLndlYm0iLCJpYXQiOjE3NDY2NzM5MjUsImV4cCI6MTc3ODIwOTkyNX0.cHVPiunFpmKQ9Ylmgf6IuCwAcsFWzSOR1GWl86Rg_uE'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Soup",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/spaghetti.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9zcGFnaGV0dGkud2VibSIsImlhdCI6MTc0NjY3Mzk1MiwiZXhwIjoxNzc4MjA5OTUyfQ.7Tmtw0fU2iF2msddkodwOKtF3EKmfdP8f14t96WxoGM'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Spaghetti",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/toast.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS90b2FzdC53ZWJtIiwiaWF0IjoxNzQ2NjczOTgwLCJleHAiOjE3NzgyMDk5ODB9.-0wN0Z_OI3_43VHKa3UU3JZ-Izh27PEcw16z9n7yjfM'),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Toast",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: "Fingerspelled:",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                "Bagel\nBeans\nBurrito\nJuice\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "Ketchup\nMayo\nMilkshake\nMustard\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "Nachos\nPancake\nPasta\nPepperoni\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "Rice\nTaco\nTortilla\nWaffle",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Lesson Completed!':
                              return Column(
                                children: [
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text:
                                              "Fantastic! That’s the end of this lesson. Let’s see what you remember!",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );

                            case 'Exercise':
                              double progress = totalScore / 100;

                              int selectedAnswer1 = -1;
                              int selectedAnswer2 = -1;
                              int selectedAnswer5 = -1;

                              int correctAnswer1 = 2;
                              int correctAnswer2 = 1;
                              int correctAnswer5 = 2;

                              bool isCorrect1 = false;
                              bool isCorrect2 = false;

                              TextEditingController answerController1 =
                                  TextEditingController();
                              TextEditingController answerController2 =
                                  TextEditingController();

                              List<String> correctAnswers1 = [
                                'avocado, apple, and grapes',
                                'avocado, apple and grapes',
                              ];

                              void checkAnswer1(StateSetter setState) async {
                                if (!answered1) {
                                  String userAnswer = answerController1.text
                                      .trim()
                                      .toLowerCase();
                                  isCorrect1 =
                                      correctAnswers1.contains(userAnswer);

                                  if (isCorrect1) {
                                    totalScore += 10;
                                    progress = totalScore / 100;
                                    await player.play(
                                        AssetSource('sounds/correct.mp3'));
                                  } else {
                                    await player
                                        .play(AssetSource('sounds/wrong.mp3'));
                                  }

                                  answered1 = true;
                                  setState(() {}); // Update UI
                                }
                              }

                              void checkAnswer2(StateSetter setState) async {
                                if (!answered2) {
                                  isCorrect2 = answerController2.text
                                          .trim()
                                          .toLowerCase() ==
                                      'cereals and yogurt';

                                  if (isCorrect2) {
                                    totalScore += 10;
                                    progress = totalScore / 100;
                                    await player.play(
                                        AssetSource('sounds/correct.mp3'));
                                  } else {
                                    await player
                                        .play(AssetSource('sounds/wrong.mp3'));
                                  }

                                  answered2 = true;
                                  setState(() {}); // Update UI
                                }
                              }

                              return StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  Color getButtonColor(
                                      int questionNumber, int choice) {
                                    if (questionNumber == 1 &&
                                        selectedAnswer1 == choice) {
                                      return selectedAnswer1 == correctAnswer1
                                          ? Colors.green
                                          : Colors.red;
                                    } else if (questionNumber == 2 &&
                                        selectedAnswer2 == choice) {
                                      return selectedAnswer2 == correctAnswer2
                                          ? Colors.green
                                          : Colors.red;
                                    } else if (questionNumber == 5 &&
                                        selectedAnswer5 == choice) {
                                      return selectedAnswer5 == correctAnswer5
                                          ? Colors.green
                                          : Colors.red;
                                    }
                                    return Colors.white; // Default button color
                                  }

                                  void checkAnswer(int questionNumber,
                                      int selectedAnswer) async {
                                    bool isCorrect = false;
                                    if (questionNumber == 1 &&
                                        !answeredQuestion1) {
                                      selectedAnswer1 = selectedAnswer;
                                      isCorrect =
                                          selectedAnswer1 == correctAnswer1;
                                      answeredQuestion1 = true;
                                    } else if (questionNumber == 2 &&
                                        !answeredQuestion2) {
                                      selectedAnswer2 = selectedAnswer;
                                      isCorrect =
                                          selectedAnswer2 == correctAnswer2;
                                      answeredQuestion2 = true;
                                    } else if (questionNumber == 5 &&
                                        !answeredQuestion5) {
                                      selectedAnswer5 = selectedAnswer;
                                      isCorrect =
                                          selectedAnswer5 == correctAnswer5;
                                      answeredQuestion5 = true;
                                    }
                                    if (isCorrect) {
                                      totalScore += 10;
                                      await player.play(
                                          AssetSource('sounds/correct.mp3'));
                                    } else {
                                      await player.play(
                                          AssetSource('sounds/wrong.mp3'));
                                    }
                                    progress = totalScore / 100;
                                    setState(() {});
                                  }

                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            LinearProgressIndicator(
                                              value: progress.clamp(0.0, 1.0),
                                              backgroundColor: Colors.grey[300],
                                              color: Colors.blue,
                                              minHeight: 10,
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Score: $totalScore',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Question 1
                                      Text(
                                        "1. The following are fruits except one, which is it?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Tap the frame to select the answer',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: getButtonColor(1,
                                                  1), // dynamic background 					color
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Colors.black54,
                                                  width: 1),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 4,
                                                  offset: Offset(2, 2),
                                                ),
                                              ],
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              onTap: () {
                                                setState(() {
                                                  checkAnswer(1, 1);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/apple.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9hcHBsZS53ZWJtIiwiaWF0IjoxNzQ2NjcyNzY0LCJleHAiOjE3NzgyMDg3NjR9.yrR_cC9DhpMMQz2bU58aWD1DU9mg19rh4Vf8CTf71qE',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: getButtonColor(1,
                                                  2), // dynamic background 					color
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Colors.black54,
                                                  width: 1),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 4,
                                                  offset: Offset(2, 2),
                                                ),
                                              ],
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              onTap: () {
                                                setState(() {
                                                  checkAnswer(1, 2);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/cheese.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9jaGVlc2Uud2VibSIsImlhdCI6MTc0NjY3MzQ5NCwiZXhwIjoxNzc4MjA5NDk0fQ.xU2XorjGV5OCISe2nhlEkyqT-bY3FQowjrPVowhRK_I',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: getButtonColor(1,
                                                  3), // dynamic background 					color
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Colors.black54,
                                                  width: 1),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 4,
                                                  offset: Offset(2, 2),
                                                ),
                                              ],
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              onTap: () {
                                                setState(() {
                                                  checkAnswer(1, 3);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/avocado.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9hdm9jYWRvLndlYm0iLCJpYXQiOjE3NDY2NzQwNTcsImV4cCI6MTc3ODIxMDA1N30.wsHNhBok_7nuV0UMlkI9thmEGwrdzffBiJLWB20aGyE',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),

                                      // Question 2
                                      Text(
                                        '2. The following are from meat and dairy section, which one does not belong to the group?',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Tap the frame to select the answer',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),

                                      SizedBox(height: 10),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: getButtonColor(2,
                                                  1), // dynamic background 					color
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Colors.black54,
                                                  width: 1),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 4,
                                                  offset: Offset(2, 2),
                                                ),
                                              ],
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              onTap: () {
                                                setState(() {
                                                  checkAnswer(2, 1);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/toast.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS90b2FzdC53ZWJtIiwiaWF0IjoxNzQ2NjczOTgwLCJleHAiOjE3NzgyMDk5ODB9.-0wN0Z_OI3_43VHKa3UU3JZ-Izh27PEcw16z9n7yjfM',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: getButtonColor(2,
                                                  2), // dynamic background 					color
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Colors.black54,
                                                  width: 1),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 4,
                                                  offset: Offset(2, 2),
                                                ),
                                              ],
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              onTap: () {
                                                setState(() {
                                                  checkAnswer(2, 2);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/butter.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9idXR0ZXIud2VibSIsImlhdCI6MTc0NjY3MzQ0MiwiZXhwIjoxNzc4MjA5NDQyfQ.L8BGtQotHNuopaCqBtuFSGHmiTJ_jBllem4a1-kxuGk',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: getButtonColor(2,
                                                  3), // dynamic background 					color
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Colors.black54,
                                                  width: 1),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 4,
                                                  offset: Offset(2, 2),
                                                ),
                                              ],
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              onTap: () {
                                                setState(() {
                                                  checkAnswer(2, 3);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/yogurt.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL3lvZ3VydC53ZWJtIiwiaWF0IjoxNzQ2Njg5NDk3LCJleHAiOjE3NzgyMjU0OTd9.goyxuKHAP9jWsTq0h-fw8imD1W3TmN3f1tWK1ngWzBE',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),

                                      Text(
                                        "3. What fruits does the person in the video shown below likes?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/i%20love%20avocado,%20apple%20and%20grapes.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9pIGxvdmUgYXZvY2FkbywgYXBwbGUgYW5kIGdyYXBlcy53ZWJtIiwiaWF0IjoxNzQ2Njc0MTM5LCJleHAiOjE3NzgyMTAxMzl9.B8b4fMP2BfkZhEZ04ptUx69CXNU8453gjhhnhQjejtE",
                                      ),
                                      SizedBox(height: 10),
                                      // Answer Input
                                      SizedBox(
                                        width: 250,
                                        child: TextField(
                                          controller: answerController1,
                                          enabled: !answered1,
                                          decoration: InputDecoration(
                                            hintText: 'Enter your answer here',
                                            border: OutlineInputBorder(),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.send,
                                                color: answered1
                                                    ? Colors.grey
                                                    : Colors.blue,
                                              ),
                                              onPressed: () {
                                                checkAnswer1(setState);
                                              },
                                            ),
                                            filled: true,
                                            fillColor: answered1
                                                ? (isCorrect1
                                                    ? Colors.green[100]
                                                    : Colors.red[100])
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 40),

                                      // Question 4
                                      Text(
                                        '4. What does the person eat for breakfast according to the video below?',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/i%20eat%20cereals%20and%20yogurt%20for%20breakfast.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9pIGVhdCBjZXJlYWxzIGFuZCB5b2d1cnQgZm9yIGJyZWFrZmFzdC53ZWJtIiwiaWF0IjoxNzQ2Njc0MTkzLCJleHAiOjE3NzgyMTAxOTN9.7Mtrq5Ql93Ih76paR55A3ek4jMzx0RF9UJcxUDHG70c",
                                      ),
                                      SizedBox(height: 10),
                                      // Answer Input
                                      SizedBox(
                                        width: 250,
                                        child: TextField(
                                          controller: answerController2,
                                          enabled: !answered2,
                                          decoration: InputDecoration(
                                            hintText: 'Enter your answer here',
                                            border: OutlineInputBorder(),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.send,
                                                color: answered2
                                                    ? Colors.grey
                                                    : Colors.blue,
                                              ),
                                              onPressed: () {
                                                checkAnswer2(setState);
                                              },
                                            ),
                                            filled: true,
                                            fillColor: answered2
                                                ? (isCorrect2
                                                    ? Colors.green[100]
                                                    : Colors.red[100])
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      // Question
                                      Text(
                                        "5. All foods have an assigned sign, usually using classifiers and are not fingerspelled.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () => checkAnswer(5, 1),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(5, 1),
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                            ),
                                            child: Text(
                                              'True',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          ElevatedButton(
                                            onPressed: () => checkAnswer(5, 2),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(5, 2),
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                            ),
                                            child: Text(
                                              'False',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 40),
                                    ],
                                  );
                                },
                              );

                            default:
                              return Text(
                                section['content'] ?? 'No content available.',
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.justify,
                              );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Conditionally show the "Previous" button
                if (currentIndex != 0 && currentIndex != 5)
                  ElevatedButton(
                    onPressed: previousSection,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                    child:
                        Text('Previous', style: TextStyle(color: Colors.black)),
                  )
                else
                  SizedBox(width: 120), // Placeholder for spacing

                // Next or Finish Button
                ElevatedButton(
                  onPressed: (currentIndex == 5)
                      ? () async {
                          bool allQuestionsAnsweredQuiz = answeredQuestion1 &&
                              answeredQuestion2 &&
                              answered1 &&
                              answered2 &&
                              answeredQuestion5;

                          if (context.mounted) {
                            if (!allQuestionsAnsweredQuiz) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Please answer all quiz questions before finishing.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
                            // mark completed lessons
                            final lessonCompletionManager =
                                LessonCompletionManager();
                            await lessonCompletionManager.completeLesson(
                              lessonId: widget.lessonId,
                              score: totalScore,
                            );

                            lessonCompleted = true;
                            if (context.mounted) {
                              Navigator.pop(context, true);
                            }
                            await lessonManager
                                .resetLessonProgress(widget.lessonId);
                          }
                        }
                      : nextSection,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  child: Text(
                    (currentIndex == 5) ? 'Finish' : 'Next',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
