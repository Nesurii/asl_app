import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../services/completed_lessons_progress.dart';
import '../services/state_progress.dart';
import 'video_player_widget.dart';

class Lesson3Screen extends StatefulWidget {
  final String lessonId;

  const Lesson3Screen({super.key, required this.lessonId});

  @override
  State<Lesson3Screen> createState() => _Lesson3ScreenState();
}

class _Lesson3ScreenState extends State<Lesson3Screen> {
  int currentIndex = 0;
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();
  final lessonManager = LessonManager();

  bool answeredQuestion1 = false;
  bool answeredQuestion2 = false;
  bool answeredQuestion3 = false;
  bool answeredQuestion4 = false;
  bool answeredQuestion5 = false;
  bool lessonCompleted = false;

  final List<Map<String, dynamic>> lessonSections = [
    {
      'title': 'Farewells',
    },
    {
      'title': 'Alternative Ways to Say Farewell',
    },
    {
      'title': 'Farewell Vocabulary',
    },
    {
      'title': 'Did You Know?',
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
      final lessonPages = Map<String, dynamic>.from(currentState['lesson_pages'] ?? {});
      final savedPageTitle = lessonPages[widget.lessonId]; // Your lessonId

      if (savedPageTitle != null) {
        // Parse the page number from savedPageTitle
        final match = RegExp(r'Page (\d+):').firstMatch(savedPageTitle);
        if (match != null) {
          final savedPageIndex = int.tryParse(match.group(1)!);
          if (savedPageIndex != null && savedPageIndex < lessonSections.length) {
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
          'Lesson 3 - ${section['title']}',
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
                            case 'Farewells':
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
                                              "Now that we already learned about greetings, let’s go to basic signs of Farewells!",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%203/Goodbye.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDMvR29vZGJ5ZS53ZWJtIiwiaWF0IjoxNzQzNDMxNzMyLCJleHAiOjE3NzQ5Njc3MzJ9.2RfM5qMqulkT474Id3A9IVujErIcpjQg31M6ZiGCuHQ',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Goodbye",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/take%20care.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvdGFrZSBjYXJlLndlYm0iLCJpYXQiOjE3NDM0MjYwNzgsImV4cCI6MTc3NDk2MjA3OH0.9aNkAZOwhphEd_0Px6TxKxBhBZXZUpA-wTKPftMiR8E',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Take care",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "There are two ways to say Farewell; Goodbye is formal and Take care is informal.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Alternative Ways to Say Farewell':
                              return Column(
                                children: [
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "You can also use these as a farewell.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/i_m%20happy%20to%20meet%20you.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvaV9tIGhhcHB5IHRvIG1lZXQgeW91LndlYm0iLCJpYXQiOjE3NDM0MjUzNzcsImV4cCI6MTc3NDk2MTM3N30.W99IOQZX4drFbJ_KANr4XEvgenqd44fxaCc8bIyqFJI',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "I'm happy to meet you",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%203/See%20you%20tomorrow%20ver.%201.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDMvU2VlIHlvdSB0b21vcnJvdyB2ZXIuIDEud2VibSIsImlhdCI6MTc0MzQzMjEzMCwiZXhwIjoxNzc0OTY4MTMwfQ.hfWlqOIqLvGid9rAJ9BZP0NdP0GwSW_CbWOEjj_ZMU4',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "See you tomorrow",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );

                            case 'Farewell Vocabulary':
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
                                              "Now let’s get you familiarized with the vocabulary related to Farewells.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%203/Goodbye.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDMvR29vZGJ5ZS53ZWJtIiwiaWF0IjoxNzQzNDMxNzMyLCJleHAiOjE3NzQ5Njc3MzJ9.2RfM5qMqulkT474Id3A9IVujErIcpjQg31M6ZiGCuHQ',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Goodbye",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/later.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvbGF0ZXIud2VibSIsImlhdCI6MTc0MzQyNTQ4MywiZXhwIjoxNzc0OTYxNDgzfQ.qy-unJDGjWJpE0k9BJqq4FU0O4TMob1PmqwRKqW1uxM',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Later",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/me%20too.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvbWUgdG9vLndlYm0iLCJpYXQiOjE3NDM0MjU0OTUsImV4cCI6MTc3NDk2MTQ5NX0.AjNxSJ7Uzgl-LQ5qmKsgBKqvawBK_vZGU3JzrXXcgCk',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Me too/Same here",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/see%20you.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvc2VlIHlvdS53ZWJtIiwiaWF0IjoxNzQzNDI1NTc0LCJleHAiOjE3NzQ5NjE1NzR9.lwRiuS4U3YaM1wviKTAsNBcE8zjXO1-tEOL2loFTMV4',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "To see/To see you",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%203/see%20you%20later.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDMvc2VlIHlvdSBsYXRlci53ZWJtIiwiaWF0IjoxNzQzNDMyMTA3LCJleHAiOjE3NzQ5NjgxMDd9.drr9r1r0sB3UbABUZKArrQHBAORvmtYVSe-uMP6hITg',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "See you later",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/tomorrow.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3RvbW9ycm93LndlYm0iLCJpYXQiOjE3NDQxMTcwNTEsImV4cCI6MTc3NTY1MzA1MX0.0r2BKXW4ACPLs4A8MzM1YM8Xtjx3FWslYvhMJiO5B9o',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Tomorrow",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Did You Know?':
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
                                              "Did you know? Pointing using the index finger is called Deixis!\n\n\nHere are some examples: ",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/me.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvbWUud2VibSIsImlhdCI6MTc0MzQyNTUwMywiZXhwIjoxNzc0OTYxNTAzfQ.Uqa05wcr-Kpr29lpKytcimDIi920QePzlQvpvn5QUw8',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "I am/Me/I",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%203/you%20are.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDMveW91IGFyZS53ZWJtIiwiaWF0IjoxNzQzNDMyMTU2LCJleHAiOjE3NzQ5NjgxNTZ9.KTjoA0qX662l2HWxVFSUaacizJ44gRG59rV-8x2DjFk',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "You are",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/he.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvaGUud2VibSIsImlhdCI6MTc0MzQyNTIzMSwiZXhwIjoxNzc0OTYxMjMxfQ.BKLLn6Zs86YukoFWM8MqmjMUvYQUbsMNPS0O01PPvZU',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "He/She/It is",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/us.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvdXMud2VibSIsImlhdCI6MTc0MzQyNjE4MywiZXhwIjoxNzc0OTYyMTgzfQ.H_D91302WNSO5lNhXKJ5KFYaGAPeSZEqTU-rvywS9oA',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "We are/Us",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/You%20are%20plural.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvWW91IGFyZSBwbHVyYWwud2VibSIsImlhdCI6MTc0MzQyNjIyMSwiZXhwIjoxNzc0OTYyMjIxfQ.PgLQLznnZjourbpYn4UG-kLAh_gbYwjmVQzanpFQt3U',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "You are plural",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/they%20are.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvdGhleSBhcmUud2VibSIsImlhdCI6MTc0MzQyNjA5NiwiZXhwIjoxNzc0OTYyMDk2fQ.QJdd5C2wjjIgj778b-sf-5YOo_5k0KGf0HdKlhWAm2M',
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "They are",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text: "Note: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "Remember, always maintain eye contact! It is considered rude if you fail to maintain eye contact during a conversation.",
                                        ),
                                      ],
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
                                              "High five! That’s the end of the lesson. Let’s do a quick review of what you’ve learned!",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );

                            case 'Exercise':
                              int selectedAnswer1 = -1;
                              int selectedAnswer2 = -1;
                              int selectedAnswer3 = -1;
                              int selectedAnswer4 = -1;
                              int selectedAnswer5 = -1;

                              int correctAnswer1 = 1;
                              int correctAnswer2 = 2;
                              int correctAnswer3 = 2;
                              int correctAnswer4 = 1;
                              int correctAnswer5 = 1;

                              double progress = totalScore / 100;

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
                                    } else if (questionNumber == 3 &&
                                        selectedAnswer3 == choice) {
                                      return selectedAnswer3 == correctAnswer3
                                          ? Colors.green
                                          : Colors.red;
                                    } else if (questionNumber == 4 &&
                                        selectedAnswer4 == choice) {
                                      return selectedAnswer4 == correctAnswer4
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
                                    } else if (questionNumber == 3 &&
                                        !answeredQuestion3) {
                                      selectedAnswer3 = selectedAnswer;
                                      isCorrect =
                                          selectedAnswer3 == correctAnswer3;
                                      answeredQuestion3 = true;
                                    } else if (questionNumber == 4 &&
                                        !answeredQuestion4) {
                                      selectedAnswer4 = selectedAnswer;
                                      isCorrect =
                                          selectedAnswer4 == correctAnswer4;
                                      answeredQuestion4 = true;
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
                                        '1. Which is the correct way to sign “See you later.”?',
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
                                            fontWeight: FontWeight.bold, color: Colors.grey),
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
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%203/see%20you%20later.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDMvc2VlIHlvdSBsYXRlci53ZWJtIiwiaWF0IjoxNzQzNDMyMTA3LCJleHAiOjE3NzQ5NjgxMDd9.drr9r1r0sB3UbABUZKArrQHBAORvmtYVSe-uMP6hITg',
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
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/take%20care.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvdGFrZSBjYXJlLndlYm0iLCJpYXQiOjE3NDM0MjYwNzgsImV4cCI6MTc3NDk2MjA3OH0.9aNkAZOwhphEd_0Px6TxKxBhBZXZUpA-wTKPftMiR8E',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),

                                      // Question 2
                                      Text(
                                        '2. What does the sign below mean?',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                          videoUrl:
                                              'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%203/See%20you%20tomorrow%20ver.%201.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDMvU2VlIHlvdSB0b21vcnJvdyB2ZXIuIDEud2VibSIsImlhdCI6MTc0MzQzMjEzMCwiZXhwIjoxNzc0OTY4MTMwfQ.hfWlqOIqLvGid9rAJ9BZP0NdP0GwSW_CbWOEjj_ZMU4'),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () => checkAnswer(2, 1),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(2, 1),
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                            ),
                                            child: Text(
                                              'See you later',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          ElevatedButton(
                                            onPressed: () => checkAnswer(2, 2),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(2, 2),
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                            ),
                                            child: Text(
                                              'See you tomorrow',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 30),

                                      // Question 3
                                      Text(
                                        '3. “Take care” is another way of greeting.',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () => checkAnswer(3, 1),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(3, 1),
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
                                            onPressed: () => checkAnswer(3, 2),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(3, 2),
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

                                      SizedBox(height: 30),

                                      // Question 4
                                      Text(
                                        '4. What is being signed in the video below?',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                          videoUrl:
                                              'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%203/Goodbye.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDMvR29vZGJ5ZS53ZWJtIiwiaWF0IjoxNzQzNDMxNzMyLCJleHAiOjE3NzQ5Njc3MzJ9.2RfM5qMqulkT474Id3A9IVujErIcpjQg31M6ZiGCuHQ'),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () => checkAnswer(4, 1),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(4, 1),
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                            ),
                                            child: Text(
                                              'Goodbye',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          ElevatedButton(
                                            onPressed: () => checkAnswer(4, 2),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(4, 2),
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                            ),
                                            child: Text(
                                              'See you',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 30),

                                      // Question 5
                                      Text(
                                        '5. Pointing using the index finger is called Deixis.',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
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
                              answeredQuestion3 &&
                              answeredQuestion4 &&
                              answeredQuestion5;
                          
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
                          final lessonCompletionManager = LessonCompletionManager();
                          await lessonCompletionManager.completeLesson(
                            lessonId: widget.lessonId,
                            score: totalScore,
                          );

                          lessonCompleted = true; 
                          if (context.mounted) {
                            Navigator.pop(context, true);
                          }
                          await lessonManager.resetLessonProgress(widget.lessonId);
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
