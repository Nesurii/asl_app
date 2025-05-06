import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../services/completed_lessons_progress.dart';
import '../services/state_progress.dart';
import 'video_player_widget.dart';

class Lesson29Screen extends StatefulWidget {
  final String lessonId;

  const Lesson29Screen({super.key, required this.lessonId});

  @override
  State<Lesson29Screen> createState() => _Lesson29ScreenState();
}

class _Lesson29ScreenState extends State<Lesson29Screen> {
  int currentIndex = 0;
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();
  final lessonManager = LessonManager();

  bool lessonCompleted = false;
  bool answeredQuestion1 = false;
  bool answeredQuestion3 = false;
  bool answeredQuestion4 = false;
  bool answered1 = false;
  bool answered2 = false;

  final List<Map<String, dynamic>> lessonSections = [
    {
      'title': 'Sports and Activities',
    },
    {
      'title': 'Vocabulary: Sports',
    },
    {
      'title': 'Vocabulary: Sports ',
    },
    {
      'title': 'Asking Have you ...',
    },
    {
      'title': 'Vocabulary: Signing about Activities',
    },
    {
      'title': 'Vocabulary: ASL Storytelling',
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
          'Lesson 29 - ${section['title']}',
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
                            case 'Sports and Activities':
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
                                              "Participating in sports or attending sporting events is a popular activity in the Deaf community, which organizes many athletic events and tournaments. In this section, you will learn vocabulary to help you sign about sports and other activities.",
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
                                            text:
                                                "Vocabulary: Signing about Sports",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/all%20year.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2FsbCB5ZWFyLndlYm0iLCJpYXQiOjE3NDQ3ODMxMzMsImV4cCI6MTc3NjMxOTEzM30.HOiaLJrZh1UsLpvabjU40t7Sf363lSCfl9UJpgSrHLM'),
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
                                          text: "All year/Year round",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/during.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2R1cmluZy53ZWJtIiwiaWF0IjoxNzQ0NzgzMzEzLCJleHAiOjE3NzYzMTkzMTN9.F017k2YEqos4VlyMKh8d6gphTxg-hAWdbUFNtivUh68'),
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
                                          text: "During/In/On (time)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20play.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHBsYXkud2VibSIsImlhdCI6MTc0NDc4NTYxOSwiZXhwIjoxNzc2MzIxNjE5fQ.50lpEmgH72MElmlI6c9m994w9ebUhzk_YU2ejQBU68E'),
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
                                          text: "To play",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/team.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RlYW0ud2VibSIsImlhdCI6MTc0NDc4NTMzNiwiZXhwIjoxNzc2MzIxMzM2fQ.lqW_BrDEbcgRYQW22l96CBUCO4F2jas32mpRI-v695Q'),
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
                                          text: "Team",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/tend%20to.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RlbmQgdG8ud2VibSIsImlhdCI6MTc0NDc4NTM0NywiZXhwIjoxNzc2MzIxMzQ3fQ.Ca1nNwkQokf6E0iJQvelhur-A7nO71AaIE6SeQd_5_M'),
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
                                          text: "Tend to/Usually",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text: "Note: ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              'Use “during” to talk about a non-specific time when something occurs. During is used much the same way as "in" and "on" are used in English to talk about events.',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: Sports':
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
                                            text: "Vocabulary: Sports",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/baseball.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2Jhc2ViYWxsLndlYm0iLCJpYXQiOjE3NDQ3ODMxOTksImV4cCI6MTc3NjMxOTE5OX0.QiKWWQIuqkgjyVYxpo-Wnamxk5uWjMU2x7dhsUEwtx4'),
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
                                          text: "Baseball",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/basketball.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2Jhc2tldGJhbGwud2VibSIsImlhdCI6MTc0NDc4MzIxNywiZXhwIjoxNzc2MzE5MjE3fQ.dzO--IjYU3EV17zf1sXdyqt7K3lSIRM9xzziLoBtL_w'),
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
                                          text: "Basketball",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20ride%20a%20bike.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHJpZGUgYSBiaWtlLndlYm0iLCJpYXQiOjE3NDQ3ODU2MzksImV4cCI6MTc3NjMyMTYzOX0.y-1X25FTPUktlT-J_5be1JYJ0W27n4fNN2RRGatgYzc'),
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
                                          text: "To ride a bike",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/bowling.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2Jvd2xpbmcud2VibSIsImlhdCI6MTc0NDc4MzI0OSwiZXhwIjoxNzc2MzE5MjQ5fQ.o575LVKX4lD-d0tkndABOj9hovYfB7uKMy2lVL_0oKQ'),
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
                                          text: "Bowling",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/football.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2Zvb3RiYWxsLndlYm0iLCJpYXQiOjE3NDQ3ODMzMzMsImV4cCI6MTc3NjMxOTMzM30.zifThAcgPYzPnu9mwpZ4ogLW6SyGdkGxakeiMz8p5c8'),
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
                                          text: "Football",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/golf.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2dvbGYud2VibSIsImlhdCI6MTc0NDc4MzM0OCwiZXhwIjoxNzc2MzE5MzQ4fQ.FTbDAuX5E-licKcSUmvzWHp7A0w2pSZP4GpYxy7j30s'),
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
                                          text: "Golf",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/gymnastics.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2d5bW5hc3RpY3Mud2VibSIsImlhdCI6MTc0NDc4MzM1OSwiZXhwIjoxNzc2MzE5MzU5fQ._k9yM3TW-c9UOwpkD5Ax80vvo133jrDsLKUNPAJqnuw'),
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
                                          text: "Gymnastics",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/hockey.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2hvY2tleS53ZWJtIiwiaWF0IjoxNzQ0NzgzNDM4LCJleHAiOjE3NzYzMTk0Mzh9.gKSPesCPwlLTB4nP2PnJq7rC3-DhbsaoMA2oRV-1Nb8'),
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
                                          text: "Hockey",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20ice%20skate.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGljZSBza2F0ZS53ZWJtIiwiaWF0IjoxNzQ0Nzg1NTQ2LCJleHAiOjE3NzYzMjE1NDZ9.Q26YG1LZmTku5fNvkm9TMDY7t7e-qjlmdetrEjznQNU'),
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
                                          text: "To ice skate",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20jog.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGpvZy53ZWJtIiwiaWF0IjoxNzQ0Nzg1NTY2LCJleHAiOjE3NzYzMjE1NjZ9.R6V9qpmH-Vbzqc3uLYPgbJzqo70ijcZh0S1umI9Rfo8'),
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
                                          text: "To jog",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/karate.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2thcmF0ZS53ZWJtIiwiaWF0IjoxNzQ0NzgzNDY4LCJleHAiOjE3NzYzMTk0Njh9.7Tgz8xgobM1TLpbG56RnBK2HZQeYiYa0cyfLL9tSxh8'),
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
                                          text: "Karate/Martial Arts",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: Sports ':
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20scuba%20dive.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHNjdWJhIGRpdmUud2VibSIsImlhdCI6MTc0NDc4NTY2MywiZXhwIjoxNzc2MzIxNjYzfQ.sWqxUDJxQ2-Mst7Nk4MpVBPgWkY8yPmGlTo5LqilQRQ'),
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
                                          text: "To scuba dive",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20snowboard.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHNub3dib2FyZC53ZWJtIiwiaWF0IjoxNzQ0Nzg1NzE3LCJleHAiOjE3NzYzMjE3MTd9.oytfmPARmJ4JhOx7uP74eiZ8j9vw8ikP5eEZwmQUkNo'),
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
                                          text: "To snowboard",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/soccer.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3NvY2Nlci53ZWJtIiwiaWF0IjoxNzQ0Nzg1Mjc3LCJleHAiOjE3NzYzMjEyNzd9.3majxiVzIUUuZAKLXTeIST-5hMbS9vqJg3ZLh-MxgLg'),
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
                                          text: "Soccer",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/softball.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3NvZnRiYWxsLndlYm0iLCJpYXQiOjE3NDQ3ODUyOTksImV4cCI6MTc3NjMyMTI5OX0.2daGfQN4U1NvRbNk0C52GYQAKcBC9mDX_iHxv0i_Ewc'),
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
                                          text: "Softball",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20surf.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHN1cmYud2VibSIsImlhdCI6MTc0NDc4NTczNSwiZXhwIjoxNzc2MzIxNzM1fQ.sIWwp-koWL7IsHc-owenM0u6E3kf5e31so7juFUuhiM'),
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
                                          text: "To surf",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20swim.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHN3aW0ud2VibSIsImlhdCI6MTc0NDc4NTc1MiwiZXhwIjoxNzc2MzIxNzUyfQ.4VJhMtsCDEOJ2vMVQqZ07RZThiv4O4Ha_EjhQzGcQco'),
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
                                          text: "To swim",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/tennis.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3Rlbm5pcy53ZWJtIiwiaWF0IjoxNzQ0Nzg1MzYwLCJleHAiOjE3NzYzMjEzNjB9.QjkKEYMKuR-lD12y3NyIGkGVzVDMuHj6wHFATVK2-Gg'),
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
                                          text: "Tennis",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/voleyball.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3ZvbGV5YmFsbC53ZWJtIiwiaWF0IjoxNzQ0Nzg1ODA3LCJleHAiOjE3NzYzMjE4MDd9.uegQh3bkDBrzL9J0My9BrW8QE77fCaJPvPoXeKKM5Ng'),
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
                                          text: "Volleyball (Version 1)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/volleyball%20ver%202.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3ZvbGxleWJhbGwgdmVyIDIud2VibSIsImlhdCI6MTc0NDc4NTgyMCwiZXhwIjoxNzc2MzIxODIwfQ.Pb_HVHvTc38NyPDP_I9jOAF83Bqy1_QphVoKmRu3iUA'),
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
                                          text: "Volleyball (Version 2)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/wrestling.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3dyZXN0bGluZy53ZWJtIiwiaWF0IjoxNzQ0Nzg1ODcxLCJleHAiOjE3NzYzMjE4NzF9.c4xaVsIMXAKc8MAQR5n6xPwrmZYlxy4hplEt_RFYCcM'),
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
                                          text: "Wrestling",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Asking Have you ...':
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
                                            text: "Asking Have you ...",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
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
                                              'American Sign Language uses the signs ‘to experience’ and ‘finish’ to ask questions about whether someone has or has not done something. These types of questions often begin with "Have you ... " in English, but in ASL the question is asked without using the sign have.\n\n',
                                        ),
                                        TextSpan(
                                          text:
                                              'Recall that the sign to have is literal and indicates possession of something, so using it to ask "Have you gone bowling?" is incorrect. Instead, the concept of the sign ‘to experience’ asks "Do you have any experience with bowling?"',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20experience.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGV4cGVyaWVuY2Uud2VibSIsImlhdCI6MTc0NDc4NTQ1NywiZXhwIjoxNzc2MzIxNDU3fQ.Ry_huMGNE1PFyDCYuchCroMYG09tdM1tmC2qLc0-cdU'),
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
                                          text: "To experience",
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
                                              "In the examples below, look carefully to see how ‘to experience’ and ‘finish’ are used in conversation.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/have%20you%20done%20scuba%20diving.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2hhdmUgeW91IGRvbmUgc2N1YmEgZGl2aW5nLndlYm0iLCJpYXQiOjE3NDQ3ODMzODgsImV4cCI6MTc3NjMxOTM4OH0.fXaQjCIDFIgHx8pxoHw56zW450fjPlJ7wfjioc9T1DE'),
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
                                              "Have you gone scuba diving? / Do you know how to scuba dive?",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/yes,%20i've%20gone%20scuba%20diving.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3llcywgaSd2ZSBnb25lIHNjdWJhIGRpdmluZy53ZWJtIiwiaWF0IjoxNzQ0Nzg1OTI0LCJleHAiOjE3NzYzMjE5MjR9.htoUuHm0Wurzw7xssOAlDxOGt0f3HyyU0xXiYwNaNo4"),
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
                                              "Yes, I've gone scuba diving. / Yes, I know how to scuba dive",
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
                                              'Another way to respond to a "Have you ... " question is to use finish, to show you’ve already experienced what was asked.',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/yes,%20i've%20gone%20scuba%20diving.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3llcywgaSd2ZSBnb25lIHNjdWJhIGRpdmluZy53ZWJtIiwiaWF0IjoxNzQ0Nzg1OTI0LCJleHAiOjE3NzYzMjE5MjR9.htoUuHm0Wurzw7xssOAlDxOGt0f3HyyU0xXiYwNaNo4"),
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
                                          text: "Yes, I've gone scuba diving",
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
                                              'To respond negatively to a "Have you ... " question, use the late sign and the non-manual signal of slightly sticking your tongue out. This combination means not yet or I haven’t. ',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/no,%20i%20haven't%20gone%20scuba%20diving.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L25vLCBpIGhhdmVuJ3QgZ29uZSBzY3ViYSBkaXZpbmcud2VibSIsImlhdCI6MTc0NDgxNjc5NCwiZXhwIjoxNzc2MzUyNzk0fQ.w4jWkPRhiitmMcny7p2BWTTJy0HjmlmTAmn49ExlMYI"),
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
                                              "No, I haven't gone scuba diving",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: Signing about Activities':
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
                                                "Vocabulary: Signing about Activities",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20bungee%20jump.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGJ1bmdlZSBqdW1wLndlYm0iLCJpYXQiOjE3NDQ3ODUzOTcsImV4cCI6MTc3NjMyMTM5N30.Z7dsJ16GE2zOhgj4J2u97YWjCJi0Ot_3td4W00rE3S0'),
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
                                          text: "To bungee jump",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20camp.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGNhbXAud2VibSIsImlhdCI6MTc0NDc4NTQxMSwiZXhwIjoxNzc2MzIxNDExfQ.OgVUVGdmKRzmmomgHKkQFvV8nb3J-5vyjEn6_kK5aB0'),
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
                                          text: "To camp",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20exercise.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGV4ZXJjaXNlLndlYm0iLCJpYXQiOjE3NDQ3ODU0MzIsImV4cCI6MTc3NjMyMTQzMn0.otRESV3Wc9TixF7DOMIRCxIgZwI-Q9JairkptABll7g'),
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
                                          text: "To exercise/Lift weights",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20fish.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGZpc2gud2VibSIsImlhdCI6MTc0NDc4NTUwNSwiZXhwIjoxNzc2MzIxNTA1fQ.lvLXjhLlMsI9mRxbuYcWtGSGeULnCPop5aARnLPaw3A'),
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
                                          text: "To fish",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20hike.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGhpa2Uud2VibSIsImlhdCI6MTc0NDc4NTUyMiwiZXhwIjoxNzc2MzIxNTIyfQ.NlwcggAtlpcD1-qsB00bCQWFpMWxa3cy5uf3HJKYRJc'),
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
                                          text: "To hike",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20play%20cards.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHBsYXkgY2FyZHMud2VibSIsImlhdCI6MTc0NDc4NTU5OSwiZXhwIjoxNzc2MzIxNTk5fQ.mB8UxJ4nS0-oFgqjBudVo1ed9pBaXt1KqPRJnNBBviQ'),
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
                                          text: "To play cards",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20skateborad.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHNrYXRlYm9yYWQud2VibSIsImlhdCI6MTc0NDc4NTY3OCwiZXhwIjoxNzc2MzIxNjc4fQ.AIhsEbd1vzG4SrbBVZriavpDB5cIpAOlT1BfKaxa5_A'),
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
                                          text: "To skateboard",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20skydive.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHNreWRpdmUud2VibSIsImlhdCI6MTc0NDc4NTY5NSwiZXhwIjoxNzc2MzIxNjk1fQ.fglYEIaY7UKFAEB0Awvn99jhS6-VJST2GT8PpCkKHaM'),
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
                                          text: "To skydive",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: ASL Storytelling':
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
                                                "Vocabulary: ASL Storytelling",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/asl%20poetry.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2FzbCBwb2V0cnkud2VibSIsImlhdCI6MTc0NDc4MzE4NCwiZXhwIjoxNzc2MzE5MTg0fQ.f1NtJ4t_GRAdtdYuP5RXzJ-PrT3boXK0JShdlvhHkSs'),
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
                                          text: "ASL poetry",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/handshape.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2hhbmRzaGFwZS53ZWJtIiwiaWF0IjoxNzQ0NzgzMzc1LCJleHAiOjE3NzYzMTkzNzV9.BtZV_61RSYK34iUtUZSnEVNzM5DHd11-Vx773Y7a_lE'),
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
                                          text: "Handshape",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/poetry.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3BvZXRyeS53ZWJtIiwiaWF0IjoxNzQ0Nzg1MjQ2LCJleHAiOjE3NzYzMjEyNDZ9.NDYTlXrryXk7zn5MAvTAFaixDgDellbrMGB3DJM2JrY'),
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
                                          text: "Poetry",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/story.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3N0b3J5LndlYm0iLCJpYXQiOjE3NDQ3ODUzMTYsImV4cCI6MTc3NjMyMTMxNn0.DiiDS2gaTO_jP7_K8LLP64A1oISZSn-okLgwTl1C7NU'),
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
                                          text: "Story/To tell a story",
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
                                              "Fantastic! That’s the end of this lesson. Let’s see what you remember!",
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
                              int selectedAnswer4 = -1;

                              int correctAnswer1 = 2;
                              int correctAnswer3 = 3;
                              int correctAnswer4 = 1;

                              bool isCorrect1 = false;
                              bool isCorrect2 = false;

                              TextEditingController answerController1 =
                                  TextEditingController();
                              TextEditingController answerController2 =
                                  TextEditingController();

                              void checkAnswer1(StateSetter setState) async {
                                if (!answered1) {
                                  isCorrect1 = answerController1.text
                                          .trim()
                                          .toLowerCase() ==
                                      'have you gone bowling?';

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
                                      'basketball';

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
                                    } else if (questionNumber == 4 &&
                                        selectedAnswer4 == choice) {
                                      return selectedAnswer4 == correctAnswer4
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
                                    } else if (questionNumber == 4 &&
                                        !answeredQuestion4) {
                                      selectedAnswer4 = selectedAnswer;
                                      isCorrect =
                                          selectedAnswer4 == correctAnswer4;
                                      answeredQuestion4 = true;
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
                                        "1. What team is Jade based on the video shown below?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/jade%20is%20on%20the%20softball%20team.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2phZGUgaXMgb24gdGhlIHNvZnRiYWxsIHRlYW0ud2VibSIsImlhdCI6MTc0NDc4MzQ0OSwiZXhwIjoxNzc2MzE5NDQ5fQ.v9zD9dXX986yuccDyD4ii4zU_-aAmrduwkjs5VXbT_Y",
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        // Changed Row to Column
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
                                              'Volleyball',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // Space between buttons
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
                                              'Softball',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // Space between buttons
                                          ElevatedButton(
                                            onPressed: () => checkAnswer(1, 3),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(1, 3),
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                            ),
                                            child: Text(
                                              'Tennis',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),

                                      // Question 2
                                      Text(
                                        '2. What does the video below mean?',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/have%20you%20gone%20bowling.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2hhdmUgeW91IGdvbmUgYm93bGluZy53ZWJtIiwiaWF0IjoxNzQ0NzgzNDIzLCJleHAiOjE3NzYzMTk0MjN9.Ivt_TQKpSYYHeZb1NQkCZtMn6RzohmSo7kJgVft7irc",
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
                                        "3. What sport is Lyka good at based on the video shown below?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/lyka%20is%20good%20at%20soccer.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2x5a2EgaXMgZ29vZCBhdCBzb2NjZXIud2VibSIsImlhdCI6MTc0NDc4MzQ5OCwiZXhwIjoxNzc2MzE5NDk4fQ.ITroYybM3R2QEC4P1-1KewlPJ6F2q0tQKb47yT97Jq8",
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        // Changed Row to Column
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
                                              'Basketball',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // Space between buttons
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
                                              'Gymnastics',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // Space between buttons
                                          ElevatedButton(
                                            onPressed: () => checkAnswer(3, 3),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(3, 3),
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                            ),
                                            child: Text(
                                              'Soccer',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 40),

                                      // Question 4
                                      Text(
                                        '4. The “Have you" question is asked without using the sign ‘have’.',
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
                                              'True',
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
                                              'False',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 30),
                                      // Question
                                      Text(
                                        "5. Based on the video shown below, what are they going to watch later?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/we%20are%20going%20to%20watch%20basketball.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5X2Y1MmJmNDU5LWQzZDMtNDI0NS1iOWRlLTZkNTQxOGFhY2FiMyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3dlIGFyZSBnb2luZyB0byB3YXRjaCBiYXNrZXRiYWxsLndlYm0iLCJpYXQiOjE3NDQ3ODU4MzYsImV4cCI6MTc3NjMyMTgzNn0.6NGSWy67vPTsreTIzsfKK5C0qGGbosOJN0UimSG7LFE",
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
                if (currentIndex != 0 && currentIndex != 7)
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
                  onPressed: (currentIndex == 7)
                      ? () async {
                          
                          bool allQuestionsAnsweredQuiz = answeredQuestion1 &&
                              answered1 &&
                              answeredQuestion3 &&
                              answeredQuestion4 &&
                              answered2;

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
                    (currentIndex == 7) ? 'Finish' : 'Next',
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
