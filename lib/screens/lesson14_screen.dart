import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../services/completed_lessons_progress.dart';
import '../services/state_progress.dart';
import 'video_player_widget.dart';

class Lesson14Screen extends StatefulWidget {
final String lessonId;

  const Lesson14Screen({super.key, required this.lessonId});

  @override
  State<Lesson14Screen> createState() => _Lesson14ScreenState();
}

class _Lesson14ScreenState extends State<Lesson14Screen> {
  int currentIndex = 0;
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();
  final lessonManager = LessonManager();

  bool answeredQuestion2 = false;
  bool answeredQuestion3 = false;
  bool answered1 = false;
  bool answered2 = false;
  bool answered3 = false;
  bool lessonCompleted = false;

  final List<Map<String, dynamic>> lessonSections = [
    {
      'title': 'Days of the Week',
    },
    {
      'title': 'Vocabulary',
    },
    {
      'title': 'Vocabulary ',
    },
    {
      'title': 'Lesson Completed!',
    },
    {
      'title': 'Activity',
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
      final savedPageTitle = lessonPages[widget.lessonId]; 

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
          'Lesson 14 - ${section['title']}',
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
                            case 'Days of the Week':
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
                                              "Here are the corresponding signs for the days of the week.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/monday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L21vbmRheS53ZWJtIiwiaWF0IjoxNzQ0MTE2OTAzLCJleHAiOjE3NzU2NTI5MDN9.58Ei5cFBZ4JFBT_P2HmYeCFZE3DqlfkNdeT_0__bPyA'),
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
                                          text: "Monday",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/tuesday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3R1ZXNkYXkud2VibSIsImlhdCI6MTc0NDE3MTQzNywiZXhwIjoxNzc1NzA3NDM3fQ.SC1MBJvGwf_64367wPS2sVUrVFW7fY61ANnQjfxq20w'),
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
                                          text: "Tuesday",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/wednesday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3dlZG5lc2RheS53ZWJtIiwiaWF0IjoxNzQ0MTcxNTA3LCJleHAiOjE3NzU3MDc1MDd9.gSxP8iyBluiSOTL1uwvu23gqPwJdK20Fn84v7Hdm1aE'),
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
                                          text: "Wednesday",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/thursday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3RodXJzZGF5LndlYm0iLCJpYXQiOjE3NDQxMTY5ODcsImV4cCI6MTc3NTY1Mjk4N30.-TJIC52uSEGTk3kBw-9GwiANfOkRr6FkB5dLvhj4lAU'),
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
                                          text: "Thursday Verson 1",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/thursday%20ver.%202.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3RodXJzZGF5IHZlci4gMi53ZWJtIiwiaWF0IjoxNzQ0MTE2OTc1LCJleHAiOjE3NzU2NTI5NzV9.GxklIGxFB3nz1g1mNzHkKvEK8EYIDQpPha0Jjh-Z6X0'),
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
                                          text: "Thursday Verson 2",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/friday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L2ZyaWRheS53ZWJtIiwiaWF0IjoxNzQ0MTE2ODQzLCJleHAiOjE3NzU2NTI4NDN9.gUlpTAA6x4KJpE0ngAzJtUt_RLOkHF3e-NJKwHsqiTY'),
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
                                          text: "Friday",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/saturday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3NhdHVyZGF5LndlYm0iLCJpYXQiOjE3NDQxMTY5MjUsImV4cCI6MTc3NTY1MjkyNX0.JhCTwDUUM7Nf-28kcHk4HzyXmDTnBVz7NlSdKlHiFMQ'),
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
                                          text: "Saturday",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/sunday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3N1bmRheS53ZWJtIiwiaWF0IjoxNzQ0MTE2OTQ3LCJleHAiOjE3NzU2NTI5NDd9._K4nb25KxjgdR5R94rq9NVBn8nfxHqvZdA0XmTZ8Fis'),
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
                                          text: "Sunday Version 1",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/sunday%20ver.%202.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3N1bmRheSB2ZXIuIDIud2VibSIsImlhdCI6MTc0NDExNjkzNSwiZXhwIjoxNzc1NjUyOTM1fQ.HJJPFCQ5oIelvbixUSvvC6aA1-xkUiJXntuiIFjiO7o'),
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
                                          text: "Sunday Version 2",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              "You will notice that the signs are just the initial letters for each day. It also faces your audience or who you are talking to backward while moving in a circular motion.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary':
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              "Here are some vocabulary that will be helpful in conversing using the days of the week.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/day.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L2RheS53ZWJtIiwiaWF0IjoxNzQ0MTE2ODA0LCJleHAiOjE3NzU2NTI4MDR9.-FLua8TlxXuqxUbJH9oT1bE1URP2IjaRQp-anOZMPek'),
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
                                          text: "Day",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/everyday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L2V2ZXJ5ZGF5LndlYm0iLCJpYXQiOjE3NDQxNzQ3NzIsImV4cCI6MTc3NTcxMDc3Mn0.tfCj5CfHEQelpVBa0ylMKa-wOkfeDkiQtmPjtNlmrUQ'),
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
                                          text: "Everyday",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/week.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3dlZWsud2VibSIsImlhdCI6MTc0NDExNzEyMCwiZXhwIjoxNzc1NjUzMTIwfQ.J-PxBJ5OBH5_woCIKFt0-m7kybFZQINfEyynmQ-lRZ0'),
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
                                          text: "Week",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/to%20be%20thirsty.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3RvIGJlIHRoaXJzdHkud2VibSIsImlhdCI6MTc0NDEzNTM0MCwiZXhwIjoxNzc1NjcxMzQwfQ.tXX3EHB1GFqHG9y3xjdD5uqVV1qWZugzG0uiiGSXhTg'),
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
                                          text: "Thirsty",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/weekend.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3dlZWtlbmQud2VibSIsImlhdCI6MTc0NDExNzEwOCwiZXhwIjoxNzc1NjUzMTA4fQ.8KBLvmuIG9fMtfK8Z1xCOc-Fe3-3xeAV8TJX4gqN-VM'),
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
                                          text: "Weekend",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/do-do.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L2RvLWRvLndlYm0iLCJpYXQiOjE3NDQxMTY4MTYsImV4cCI6MTc3NTY1MjgxNn0.7QYaitBjmgVM54hCZ4JT3fNFbK1YbRjqrzsLiylodrw'),
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
                                          text: "Do-do",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/to%20work.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3RvIHdvcmsud2VibSIsImlhdCI6MTc0NDE3MTU1OSwiZXhwIjoxNzc1NzA3NTU5fQ.Sl8kbWiVG9EnPpcnLBz0ilvOfMZJHkcbvykX2Myh9sM'),
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
                                          text: "Work/Job",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/to%20eat.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3RvIGVhdC53ZWJtIiwiaWF0IjoxNzQ0MTE3MDE5LCJleHAiOjE3NzU2NTMwMTl9.WulkMnMWL0Cy6oFxvR2TfGdEuGWgtl-EZg35EGpsISA'),
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
                                          text: "Eat/Food",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/to%20be%20hungry.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3RvIGJlIGh1bmdyeS53ZWJtIiwiaWF0IjoxNzQ0MTM1MzI4LCJleHAiOjE3NzU2NzEzMjh9.MdUN5m9f6IrL4wKV9hyJptJRq9nO35dJo-I5v8Vrq2U'),
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
                                          text: "Hungry",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/to%20be%20ready.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3RvIGJlIHJlYWR5LndlYm0iLCJpYXQiOjE3NDQxMzUzNTAsImV4cCI6MTc3NTY3MTM1MH0.h1_-zlqFUUktCKvk0E68w2vsneXPQ6zLHijEmhqyuno'),
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
                                          text: "Ready",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary ':
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/restaurant.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3Jlc3RhdXJhbnQud2VibSIsImlhdCI6MTc0NDExNjkxNSwiZXhwIjoxNzc1NjUyOTE1fQ.lsCR-1AoXn8rchbzsESSGjMPr7eM30yAQUZZnWYWH8c'),
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
                                          text: "Restaurant",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/tomorrow.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvdG9tb3Jyb3cud2VibSIsImlhdCI6MTc0NjYzNDU0OSwiZXhwIjoxNzc4MTcwNTQ5fQ.qR1EBcZFsnddqvwrh3bCwD4jPxiHs6kDo3X7DA1sAdQ'),
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
                                          text: "Tomorrow",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/with.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3dpdGgud2VibSIsImlhdCI6MTc0NDExNzE0NCwiZXhwIjoxNzc1NjUzMTQ0fQ.cWNkYAeMExdENyJ9bKepl32COR-mZD0KJqNCTM7g4lw'),
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
                                          text: "With",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/to%20chat.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3RvIGNoYXQud2VibSIsImlhdCI6MTc0NDExNzAxMCwiZXhwIjoxNzc1NjUzMDEwfQ.qjQ_bM_798EBQcV-a0B2sGDcrZbN2-ONUTrJbhReQ84'),
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
                                          text: "Chat/Hangout",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/church.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L2NodXJjaC53ZWJtIiwiaWF0IjoxNzQ0MTE2Nzg3LCJleHAiOjE3NzU2NTI3ODd9.mHbO1Do5MWRxc28Cu2WnTnh78emusgU62NNpceW0fb8'),
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
                                          text: "Church",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/to%20enjoy.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3RvIGVuam95LndlYm0iLCJpYXQiOjE3NDQxMTcwMzAsImV4cCI6MTc3NTY1MzAzMH0.FTFaU8KtdMG-CVWF8TSWRYSHB_hy1FCAXTE5CZ0Yj0U'),
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
                                          text: "Enjoy/Have fun",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/to%20kick%20back.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3RvIGtpY2sgYmFjay53ZWJtIiwiaWF0IjoxNzQ0MTE3MDM4LCJleHAiOjE3NzU2NTMwMzh9.TJrVLBxkXMVtfvwxc-I3Q5hNcHmsycVAyo7ui6smQOc'),
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
                                          text: "Kick back/Take it easy",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/to%20play%20sports.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3RvIHBsYXkgc3BvcnRzLndlYm0iLCJpYXQiOjE3NDQxMTcwNjMsImV4cCI6MTc3NTY1MzA2M30.YGcRcIRA3y4IKRhs6pbV7JspYHUJzsqrVUVm3ffxNXk'),
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
                                          text: "Play sports",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/yesterday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3llc3RlcmRheS53ZWJtIiwiaWF0IjoxNzQ0MTE3MTg3LCJleHAiOjE3NzU2NTMxODd9.tduDnuVco_xgotGnTqXBtPM-sj6qXpzI5gRSTZIJS7g'),
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
                                          text: "Yesterday",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              "By now I’m sure you have noticed that some signs are slightly different although they mean the same thing. These are called variations, you would be able to encounter them frequently when you are already conversing with the deaf community.",
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
                                              "You did it! We've covered everything in this lesson. Now, let’s check what you know!",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );

                            case 'Activity':
                              double progress = totalScore / 100;

                              int selectedAnswer2 = -1;
                              int selectedAnswer3 = -1;

                              int correctAnswer2 = 2;
                              int correctAnswer3 = 3;

                              bool isCorrect1 = false;
                              bool isCorrect2 = false;
                              bool isCorrect3 = false;

                              TextEditingController answerController1 =
                                  TextEditingController();
                              TextEditingController answerController2 =
                                  TextEditingController();
                              TextEditingController answerController3 =
                                  TextEditingController();

                              void checkAnswer1(StateSetter setState) async {
                                if (!answered1) {
                                  // Check answer (case-insensitive, trimmed)
                                  isCorrect1 = answerController1.text
                                          .trim()
                                          .toLowerCase() ==
                                      'wednesday';

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
                                  // Check answer (case-insensitive, trimmed)
                                  isCorrect2 = answerController2.text
                                          .trim()
                                          .toLowerCase() ==
                                      'tuesday';

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

                              void checkAnswer3(StateSetter setState) async {
                                if (!answered3) {
                                  // Check answer (case-insensitive, trimmed)
                                  isCorrect3 = answerController3.text
                                          .trim()
                                          .toLowerCase() ==
                                      'saturday';

                                  if (isCorrect3) {
                                    totalScore += 10;
                                    progress = totalScore / 100;
                                    await player.play(
                                        AssetSource('sounds/correct.mp3'));
                                  } else {
                                    await player
                                        .play(AssetSource('sounds/wrong.mp3'));
                                  }

                                  answered3 = true;
                                  setState(() {}); // Update UI
                                }
                              }

                              return StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  Color getButtonColor(
                                      int questionNumber, int choice) {
                                    if (questionNumber == 2 &&
                                        selectedAnswer2 == choice) {
                                      return selectedAnswer2 == correctAnswer2
                                          ? Colors.green
                                          : Colors.red;
                                    } else if (questionNumber == 3 &&
                                        selectedAnswer3 == choice) {
                                      return selectedAnswer3 == correctAnswer3
                                          ? Colors.green
                                          : Colors.red;
                                    }
                                    return Colors.white; // Default button color
                                  }

                                  void checkAnswer(int questionNumber,
                                      int selectedAnswer) async {
                                    bool isCorrect = false;

                                    if (questionNumber == 2 &&
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
                                        '1. What day is being signed in the video below?',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                          videoUrl:
                                              'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/wednesday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3dlZG5lc2RheS53ZWJtIiwiaWF0IjoxNzQ0MTcxNTA3LCJleHAiOjE3NzU3MDc1MDd9.gSxP8iyBluiSOTL1uwvu23gqPwJdK20Fn84v7Hdm1aE'),
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
                                      SizedBox(height: 30),

                                      // Question 2
                                      Text(
                                        '2. When signing the days of the week your hands should face your audience.',
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
                                              'True',
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
                                              'False',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),

                                      Text(
                                        '3. Which of the following is the corresponding sign for Sunday?',
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
                                              color: getButtonColor(3,
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
                                                  checkAnswer(3, 1);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/friday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L2ZyaWRheS53ZWJtIiwiaWF0IjoxNzQ0MTE2ODQzLCJleHAiOjE3NzU2NTI4NDN9.gUlpTAA6x4KJpE0ngAzJtUt_RLOkHF3e-NJKwHsqiTY',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: getButtonColor(3,
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
                                                  checkAnswer(3, 2);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/monday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L21vbmRheS53ZWJtIiwiaWF0IjoxNzQ0MTE2OTAzLCJleHAiOjE3NzU2NTI5MDN9.58Ei5cFBZ4JFBT_P2HmYeCFZE3DqlfkNdeT_0__bPyA',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: getButtonColor(3,
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
                                                  checkAnswer(3, 3);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/sunday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3N1bmRheS53ZWJtIiwiaWF0IjoxNzQ0MTE2OTQ3LCJleHAiOjE3NzU2NTI5NDd9._K4nb25KxjgdR5R94rq9NVBn8nfxHqvZdA0XmTZ8Fis',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),

                                      // Question 4
                                      Text(
                                        "4. What day is being signed in the video below?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/tuesday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3R1ZXNkYXkud2VibSIsImlhdCI6MTc0NDE3MTQzNywiZXhwIjoxNzc1NzA3NDM3fQ.SC1MBJvGwf_64367wPS2sVUrVFW7fY61ANnQjfxq20w',
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
                                        '5. According to the video below, what day was it yesterday?',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                          videoUrl:
                                              'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%204/Lesson%2014/yesterday%20was%20saturday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDQvTGVzc29uIDE0L3llc3RlcmRheSB3YXMgc2F0dXJkYXkud2VibSIsImlhdCI6MTc0NDExNzE2MSwiZXhwIjoxNzc1NjUzMTYxfQ.8Xoe4ojEfpqkRSwNGoFGWKQOwFhn9Jp--6mfNaBempE'),
                                      SizedBox(height: 10),
                                      // Answer Input
                                      SizedBox(
                                        width: 250,
                                        child: TextField(
                                          controller: answerController3,
                                          enabled: !answered3,
                                          decoration: InputDecoration(
                                            hintText: 'Enter your answer here',
                                            border: OutlineInputBorder(),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.send,
                                                color: answered3
                                                    ? Colors.grey
                                                    : Colors.blue,
                                              ),
                                              onPressed: () {
                                                checkAnswer3(setState);
                                              },
                                            ),
                                            filled: true,
                                            fillColor: answered3
                                                ? (isCorrect3
                                                    ? Colors.green[100]
                                                    : Colors.red[100])
                                                : Colors.white,
                                          ),
                                        ),
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
                if (currentIndex != 0 && currentIndex != 4)
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
                  onPressed: (currentIndex == 4)
                      ? () async {

                          bool allQuestionsAnsweredQuiz = answered1 &&
                              answeredQuestion2 &&
                              answeredQuestion3 &&
                              answered2 &&
                              answered3;

                          if(context.mounted){
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
                        }
                      : nextSection,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  child: Text(
                    (currentIndex == 4) ? 'Finish' : 'Next',
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
