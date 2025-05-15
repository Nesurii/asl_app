import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../services/completed_lessons_progress.dart';
import '../services/state_progress.dart';
import 'video_player_widget.dart';

class Lesson23Screen extends StatefulWidget {
  final String lessonId;

  const Lesson23Screen({super.key, required this.lessonId});

  @override
  State<Lesson23Screen> createState() => _Lesson23ScreenState();
}

class _Lesson23ScreenState extends State<Lesson23Screen> {
  int currentIndex = 0;
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();
  final lessonManager = LessonManager();

  bool lessonCompleted = false;
  bool answeredQuestion1 = false;
  bool answeredQuestion3 = false;
  bool answeredQuestion5 = false;
  bool answered1 = false;
  bool answered2 = false;

  final List<Map<String, dynamic>> lessonSections = [
    {
      'title': 'Friends and Relationships',
    },
    {
      'title': 'Deaf Culture Note',
    },
    {
      'title': 'Conjugating Verbs: To Go',
    },
    {
      'title': 'Singular and Plural',
    },
    {
      'title': 'Vocabulary: Relationships',
    },
    {
      'title': 'How do I fix mistakes?',
    },
    {
      'title': 'The sign um',
    },
    {
      'title': 'Examples',
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
          'Lesson 23 - ${section['title']}',
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
                            case 'Friends and Relationships':
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
                                              "Let’s familiarize you with some common vocabulary related to this lesson.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
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
                                            text: "Vocabulary: Friendship",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/best%20friend.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL2Jlc3QgZnJpZW5kLndlYm0iLCJpYXQiOjE3NDQyNjY1NDQsImV4cCI6MTc3NTgwMjU0NH0.wlSp_LS0K2b-RnqIsznSSv7EZ5V5xq0E3TcN3qwxQ-Y'),
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
                                          text: "Best Friend",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/boyfriend.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL2JveWZyaWVuZC53ZWJtIiwiaWF0IjoxNzQ0MjY2NTEwLCJleHAiOjE3NzU4MDI1MTB9.ujkOt56rv90YIz2o9AxYkilIysAxhJgAkTbHwLVDu_c'),
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
                                          text: "Boyfriend",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/girlfriend.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL2dpcmxmcmllbmQud2VibSIsImlhdCI6MTc0NDI2NjQ4MywiZXhwIjoxNzc1ODAyNDgzfQ.ieTYEp1MHJel-1v4Rq6oMV23x5UVuBRizlzg2rvNApM'),
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
                                          text: "Girlfriend",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/to%20get%20together.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3RvIGdldCB0b2dldGhlci53ZWJtIiwiaWF0IjoxNzQ0MjY2MTc2LCJleHAiOjE3NzU4MDIxNzZ9.5n2bswtUnenfabkRPKNA0RDZXmkbTZUrMnL4GA1xBuw'),
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
                                          text: "Get together",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/to%20go%20out.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3RvIGdvIG91dC53ZWJtIiwiaWF0IjoxNzQ0MjY2MTY4LCJleHAiOjE3NzU4MDIxNjh9.E7G1Lx9wYhI_61KIvZaLWAxsW69bTGMsoholkgYbcNg'),
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
                                          text: "Go out/Leave",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/good%20friend.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL2dvb2QgZnJpZW5kLndlYm0iLCJpYXQiOjE3NDQyNjY0NzMsImV4cCI6MTc3NTgwMjQ3M30.AAFQQW49k9SxAYI75NchlVe7S9oljYb3RAcKpWmfY88'),
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
                                          text: "Good friend",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/for.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL2Zvci53ZWJtIiwiaWF0IjoxNzQ0MjY2NDg4LCJleHAiOjE3NzU4MDI0ODh9.9Fl7xWbX7W9ipPKZnWhYOnFZL33VeWV9XHkFw6RfuDo'),
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
                                          text: "Since/For ",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/to%20be%20single.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3RvIGJlIHNpbmdsZS53ZWJtIiwiaWF0IjoxNzQ0MjY2MjM2LCJleHAiOjE3NzU4MDIyMzZ9.2aEM9W_Qe3Ee6Xc4rYooghDvQi8IK-y_ayS4oVDVwwc'),
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
                                          text: "Single",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/sweetheart.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3N3ZWV0aGVhcnQud2VibSIsImlhdCI6MTc0NDI2NjI3NCwiZXhwIjoxNzc1ODAyMjc0fQ.kmEDOudh9S-i9E6AXmi_7fRc757-Na2Won0shaXtXpg'),
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
                                          text: "Sweetheart/Honey",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/dating.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL2RhdGluZy53ZWJtIiwiaWF0IjoxNzQ0MjY2NDk1LCJleHAiOjE3NzU4MDI0OTV9.-qkv2d1bLsZ_pm23eOTkEb7d6qZ1-G-ncuQBg7Mdg1o'),
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
                                          text: "Dating",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Deaf Culture Note':
                              return Column(
                                children: [
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
                                          text: "Deaf Culture Note",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "Friendship Patterns in the Deaf Community Many life-long friendships are a common experience for people who belong to small, tight-knit communities. Long-lasting friendships between Deaf people often begin at schools for the Deaf and continue through college, marriage, and old age. ",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Conjugating Verbs: To Go':
                              return Column(
                                children: [
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
                                                "Conjugating Verbs: To Go\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "The basic form of the verb to go to is modified when used in the plural form.",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/to%20go%20to.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3RvIGdvIHRvLndlYm0iLCJpYXQiOjE3NDQyNjYxNjEsImV4cCI6MTc3NTgwMjE2MX0.ujZ73mGmdPZTgXXXCH87FR8UeutxzwQFn9lDADyTLZg'),
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
                                          text: "Go to",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/they're%20going%20home.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3RoZXkncmUgZ29pbmcgaG9tZS53ZWJtIiwiaWF0IjoxNzQ0MjY2MjU3LCJleHAiOjE3NzU4MDIyNTd9.uDJK6Jcybkad1MunvL0hasUI6KhXO3g3MAq4SMfYm2U"),
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
                                          text: "They’re going home",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Singular and Plural':
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
                                            text: "Singular:",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/i%20go.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL2kgZ28ud2VibSIsImlhdCI6MTc0NDI2NjQ0OCwiZXhwIjoxNzc1ODAyNDQ4fQ.SSMU7OyALtq3h5mgjB7xWCPZQlp91dvksbKZFO0OOmA'),
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
                                          text: "I go ",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/you%20go.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3lvdSBnby53ZWJtIiwiaWF0IjoxNzQ0MjY2MDgzLCJleHAiOjE3NzU4MDIwODN9.dxoHKyjNb1cO9wbKgguK6ujAZwrrSFrqVp9z7MyxKKM"),
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
                                          text: "You go",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/he.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvaGUud2VibSIsImlhdCI6MTc0MzQyNTIzMSwiZXhwIjoxNzc0OTYxMjMxfQ.BKLLn6Zs86YukoFWM8MqmjMUvYQUbsMNPS0O01PPvZU"),
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
                                          text: "He/She/It goes",
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
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Plural:",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/we%20go.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3dlIGdvLndlYm0iLCJpYXQiOjE3NDQyNjYxMTUsImV4cCI6MTc3NTgwMjExNX0.hyjiJIPs8QOnWI4OP89amAjfnxhN99nYUxbA90jHb6g"),
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
                                          text: "We go",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/you%20go%20(plural).webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3lvdSBnbyAocGx1cmFsKS53ZWJtIiwiaWF0IjoxNzQ0MjY2MTAwLCJleHAiOjE3NzU4MDIxMDB9.EBpzqRVKoc47rgbXCbkjVxpKRMfc5vcfZ5xoX54RD7M"),
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
                                          text: "You go (plural)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/they%20go.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3RoZXkgZ28ud2VibSIsImlhdCI6MTc0NDI2NjI2NywiZXhwIjoxNzc1ODAyMjY3fQ.gT6XeR1wVvdDBakU3irRE3gof8svwpZ-zd9kOfFYsHM"),
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
                                          text: "They go",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: Relationships':
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
                                            text: "Vocabulary: Relationships",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/to%20argue.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3RvIGFyZ3VlLndlYm0iLCJpYXQiOjE3NDQyNjYyNDMsImV4cCI6MTc3NTgwMjI0M30.ho6_dUqcHr4UbYTO1Njpeadvx3EBkL-CnZTYBFyKVoQ"),
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
                                          text: "Argue",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/to%20date.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3RvIGRhdGUud2VibSIsImlhdCI6MTc0NDI2NjIyOSwiZXhwIjoxNzc1ODAyMjI5fQ.muwS93wrlq5PtkKghwO_uWxyaozi4fMCdfUCQ9puXjQ"),
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
                                          text: "Date",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/to%20fall%20inlove.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3RvIGZhbGwgaW5sb3ZlLndlYm0iLCJpYXQiOjE3NDQyNjYyMDQsImV4cCI6MTc3NTgwMjIwNH0.AmPYYVQY3vi21Bk-AX5hoa6KoXyAWlP6hvOFGc8LySE"),
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
                                          text: "Fall inlove",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/to%20flirt.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3RvIGZsaXJ0LndlYm0iLCJpYXQiOjE3NDQyNjYxOTcsImV4cCI6MTc3NTgwMjE5N30.dvRp1dF3CeIfyM6YQXXG7XuKc_2cpDUnwgnsUgzzcwU"),
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
                                          text: "Flirt",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/to%20get%20along.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3RvIGdldCBhbG9uZy53ZWJtIiwiaWF0IjoxNzQ0MjY2MTkwLCJleHAiOjE3NzU4MDIxOTB9.Niu0z2hUXwrHnzll0P4Oy4be2rtC98AUS6QEtuaus1o"),
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
                                          text: "Get along",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/love.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL2xvdmUud2VibSIsImlhdCI6MTc0NDI2NjM4OSwiZXhwIjoxNzc1ODAyMzg5fQ.QyJ3ebRMRri-mvFAHgqGT90cucwujgOdRAjcKAu7Wbc"),
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
                                          text: "Love",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/relationship.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3JlbGF0aW9uc2hpcC53ZWJtIiwiaWF0IjoxNzQ0MjY2MzEyLCJleHAiOjE3NzU4MDIzMTJ9.dSl-ocR6_KCgxLzphg0--92gaJQa4dOGUt0z0cD5STs"),
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
                                          text: "Relationship",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/together.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3RvZ2V0aGVyLndlYm0iLCJpYXQiOjE3NDQyNjYxODIsImV4cCI6MTc3NTgwMjE4Mn0.b_OYGOtBTQ_fzh84IUE1Q7R6Qw8p3v1dg3jvY3uBss4"),
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
                                          text: "Together/Be together",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'How do I fix mistakes?':
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text: "How do I fix mistakes?",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "Mistakes are guaranteed to happen, whether you are fluent in a language or not. Knowing how to correct mistakes is an important part of using language well. ASL has several ways to help correct mistakes: The most common corrections are ",
                                        ),
                                        TextSpan(
                                          text: "oops ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: "and ",
                                        ),
                                        TextSpan(
                                          text: "wave no.",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
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
                                            text: "Vocabulary: Fixing mistakes",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/oops.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL29vcHMud2VibSIsImlhdCI6MTc0NDI2NjM0MiwiZXhwIjoxNzc1ODAyMzQyfQ.whUEsQg0JZDXk50jA6cc35NW_DTW0GYS5jWEalcY6qY"),
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
                                          text: "oops",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%206/Lesson%2023/wave%20no.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDYvTGVzc29uIDIzL3dhdmUgbm8ud2VibSIsImlhdCI6MTc0NTIzODM1OCwiZXhwIjoxNzc2Nzc0MzU4fQ.wkXYmTYqoI-sefQFsxodul0tdi38cKoHlCndReICDEk"),
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
                                          text: "Wave no",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/slip%20mind.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3NsaXAgbWluZC53ZWJtIiwiaWF0IjoxNzQ0MjY2MjgzLCJleHAiOjE3NzU4MDIyODN9.Lb3BSatHtv7uC0gCfYuBdmgV4JnAqG15n-NAMZ6Wlx4"),
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
                                          text: "Slip mind",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/um,%20uh.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3VtLCB1aC53ZWJtIiwiaWF0IjoxNzQ0MjY2MTM4LCJleHAiOjE3NzU4MDIxMzh9.K0cwWeiYmNEOnWSLAJz5_gdbCPP5mxQNys3mEcKtSus"),
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
                                          text: "Um/Uh",
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
                                              "When you make a mistake, use either sign and continue signing. You don't need to over-emphasize the signs or exaggerate facial expressions.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'The sign um':
                              return Column(
                                children: [
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text: "The sign ",
                                        ),
                                        TextSpan(
                                          text: "um ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "shows one is thinking of what to say or trying to remember something. It is also a visual cue to inform those watching the conversation that the signer isn't done.",
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
                                            text:
                                                "Wave-no has several uses in ASL: \n",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text:
                                                "• It draws attention to a mistake and also serves as a \"stronger\" no than the sign no.\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "• Use wave-no to correct information (\"No, I'm not from California\").\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "• To refuse something (\"No, I don't want that\").\n",
                                          ),
                                          TextSpan(
                                            text:
                                                "• To signal an objection (\"No, you're wrong\").",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );

                            case 'Examples':
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/her%20name%20is%20kelly,%20oops,%20i%20mean%20kris.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL2hlciBuYW1lIGlzIGtlbGx5LCBvb3BzLCBpIG1lYW4ga3Jpcy53ZWJtIiwiaWF0IjoxNzQ0NTQ1MzA0LCJleHAiOjE3NzYwODEzMDR9.U3KiHAY0C347JHPZ7w-ecuffMiKi98-YpYpe7rTnMek"),
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
                                          text:
                                              "Her name is Kelly - oops, I mean Kris",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/no%20no,%20let%20me%20sign%20it%20again.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL25vIG5vLCBsZXQgbWUgc2lnbiBpdCBhZ2Fpbi53ZWJtIiwiaWF0IjoxNzQ0MjY2MzQ5LCJleHAiOjE3NzU4MDIzNDl9.tWIK22vt8NQ1sHxp_xHLI8pB0z8ro8QM819FL8XqOxg"),
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
                                          text:
                                              "No, no - sign it again / Let me sign it again.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/what%20was%20i%20going%20to%20say,%20um%20i'm%20going%20to%20have%20repe.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3doYXQgd2FzIGkgZ29pbmcgdG8gc2F5LCB1bSBpJ20gZ29pbmcgdG8gaGF2ZSByZXBlLndlYm0iLCJpYXQiOjE3NDQyNjYxMDgsImV4cCI6MTc3NTgwMjEwOH0.HZkiai8rPTdsOpFOsARQb6ag69njR8cOLUuQIOWzo0Y"),
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
                                          text:
                                              "What was I going to say? Umm ••• I'm going to have to repeat it.",
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
                                              "Awesome effort! Now that we’re done, let’s check your understanding!",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );

                            case 'Activity':
                              double progress = totalScore / 100;

                              int selectedAnswer1 = -1;
                              int selectedAnswer3 = -1;
                              int selectedAnswer5 = -1;

                              int correctAnswer1 = 1;
                              int correctAnswer3 = 2;
                              int correctAnswer5 = 2;

                              bool isCorrect1 = false;
                              bool isCorrect2 = false;

                              TextEditingController answerController1 =
                                  TextEditingController();
                              TextEditingController answerController2 =
                                  TextEditingController();

                              void checkAnswer1(StateSetter setState) async {
                                if (!answered1) {
                                  // Check answer (case-insensitive, trimmed)
                                  isCorrect1 = answerController1.text
                                          .trim()
                                          .toLowerCase() ==
                                      'rea is single';

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
                                      'wave no';

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
                                    } else if (questionNumber == 3 &&
                                        selectedAnswer3 == choice) {
                                      return selectedAnswer3 == correctAnswer3
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
                                    } else if (questionNumber == 3 &&
                                        !answeredQuestion3) {
                                      selectedAnswer3 = selectedAnswer;
                                      isCorrect =
                                          selectedAnswer3 == correctAnswer3;
                                      answeredQuestion3 = true;
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
                                        "1. There is a specific sign for fixing a mistake while signing.",
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
                                            onPressed: () => checkAnswer(1, 1),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(1, 1),
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
                                            onPressed: () => checkAnswer(1, 2),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(1, 2),
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

                                      // Question 2
                                      Text(
                                        '2. What does the video below show?',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/rea%20is%20single.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3JlYSBpcyBzaW5nbGUud2VibSIsImlhdCI6MTc0NDI2NjMzNCwiZXhwIjoxNzc1ODAyMzM0fQ.yZDh2OxpTHr16lW6iWCqS4otKmeGihKwOuyioAVus2A',
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
                                      SizedBox(height: 30),

                                      Text(
                                        '3. Which of the following is in plural form using the verb to go?',
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
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/i%20go.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL2kgZ28ud2VibSIsImlhdCI6MTc0NDI2NjQ0OCwiZXhwIjoxNzc1ODAyNDQ4fQ.SSMU7OyALtq3h5mgjB7xWCPZQlp91dvksbKZFO0OOmA',
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
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/we%20go.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3dlIGdvLndlYm0iLCJpYXQiOjE3NDQyNjYxMTUsImV4cCI6MTc3NTgwMjExNX0.hyjiJIPs8QOnWI4OP89amAjfnxhN99nYUxbA90jHb6g',
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
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/since.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL3NpbmNlLndlYm0iLCJpYXQiOjE3NDQyNjYyOTQsImV4cCI6MTc3NTgwMjI5NH0.R4pdP3Hb-j244NDhhkcFyk2QyXVgIEbJP379m1mvgj4',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 40),

                                      // Question 4
                                      Text(
                                        "4. What ASL sign for fixing mistakes was used in the video shown below?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/no%20no,%20let%20me%20sign%20it%20again.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL25vIG5vLCBsZXQgbWUgc2lnbiBpdCBhZ2Fpbi53ZWJtIiwiaWF0IjoxNzQ0MjY2MzQ5LCJleHAiOjE3NzU4MDIzNDl9.tWIK22vt8NQ1sHxp_xHLI8pB0z8ro8QM819FL8XqOxg',
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
                                        '5. Based on the video below Mary and May are _________.',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%206/Lesson%2023/best%20friend.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDYvTGVzc29uIDIzL2Jlc3QgZnJpZW5kLndlYm0iLCJpYXQiOjE3NDQyNjY1NDQsImV4cCI6MTc3NTgwMjU0NH0.wlSp_LS0K2b-RnqIsznSSv7EZ5V5xq0E3TcN3qwxQ-Y",
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        // Changed Row to Column
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
                                              'Friends',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // Space between buttons
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
                                              'Best Friends',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // Space between buttons
                                          ElevatedButton(
                                            onPressed: () => checkAnswer(5, 3),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(5, 3),
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                            ),
                                            child: Text(
                                              'Siblings',
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
                if (currentIndex != 0 && currentIndex != 9)
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
                  onPressed: (currentIndex == 9)
                      ? () async {
                          
                          bool allQuestionsAnsweredQuiz = answeredQuestion1 &&
                              answered1 &&
                              answeredQuestion3 &&
                              answered2 &&
                              answeredQuestion5;

                          if(context.mounted){
                          if (!allQuestionsAnsweredQuiz) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Please answer all questions before finishing.'),
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
                    (currentIndex == 9) ? 'Finish' : 'Next',
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
