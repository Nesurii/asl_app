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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/all%20year.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2FsbCB5ZWFyLndlYm0iLCJpYXQiOjE3NDcyODk5ODAsImV4cCI6MTc3ODgyNTk4MH0.S9JyP5CSTP6WY5NClx0L0UV-BGonA8nEdyCnSJ-3HgM'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/during.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2R1cmluZy53ZWJtIiwiaWF0IjoxNzQ3MjkwMTAwLCJleHAiOjE3Nzg4MjYxMDB9.dzYv7GBsdkdV8VJfzoSA-PSxF8l9T_zZP0mo-7R8JKE'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20play.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHBsYXkud2VibSIsImlhdCI6MTc0NzI5MDIyMiwiZXhwIjoxNzc4ODI2MjIyfQ.H-ov2VZ7X7VYOgrZgb-df2Mq4F2XC3QQ8-9kaUQkaXE'),
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
                                          text: "Play",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/team.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RlYW0ud2VibSIsImlhdCI6MTc0NzI5MDI2NywiZXhwIjoxNzc4ODI2MjY3fQ.T0vlFaQAq-LKgTElQVHOaN1DH_fhfPKkdtWdeLARq90'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/tend%20to.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RlbmQgdG8ud2VibSIsImlhdCI6MTc0NzI5MDMzMiwiZXhwIjoxNzc4ODI2MzMyfQ.dpZaSEiSVKZOj1utH6eo4zfAeZ4AASeYeFVlPO35yoQ'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/baseball.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2Jhc2ViYWxsLndlYm0iLCJpYXQiOjE3NDcyOTAwNTUsImV4cCI6MTc3ODgyNjA1NX0.pdf9ABHoiUeO8KfwpkCSWFtz8NJY7o2OZ8W8xE3YHeI'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/basketball.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2Jhc2tldGJhbGwud2VibSIsImlhdCI6MTc0NzI5MDA2NCwiZXhwIjoxNzc4ODI2MDY0fQ.uDtSxpTfjQ_zN8fYSSlN3wBpZojfOTKd36tcauh1Gos'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20ride%20a%20bike.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHJpZGUgYSBiaWtlLndlYm0iLCJpYXQiOjE3NDcyOTA0MzcsImV4cCI6MTc3ODgyNjQzN30.xVqzhwfxhStOcN3X2Qj72E0TN2vKHyK56q9V0Qt8khs'),
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
                                          text: "Ride a bike",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/bowling.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2Jvd2xpbmcud2VibSIsImlhdCI6MTc0NzI5MDA3NSwiZXhwIjoxNzc4ODI2MDc1fQ.5SMnl5OAPrHDpbDMyNlRdmaNIil2R2N9Hd6QLBU2jCw'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/football.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2Zvb3RiYWxsLndlYm0iLCJpYXQiOjE3NDcyOTAxMTQsImV4cCI6MTc3ODgyNjExNH0.C95VXqaZTEqiPB0di9VMY9OplQ2rVPzaSftdDSy7Z1o'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/golf.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2dvbGYud2VibSIsImlhdCI6MTc0NzI5MDEyMiwiZXhwIjoxNzc4ODI2MTIyfQ.cYTmXu7BGp4smbiVmaglfVfh3Ej52fqkAal095Kp96I'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/gymnastics.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2d5bW5hc3RpY3Mud2VibSIsImlhdCI6MTc0NzI5MDEzMSwiZXhwIjoxNzc4ODI2MTMxfQ.XGRQfH2BrrlppxL4T7kEBfsHd1suQogZcO8OsLuxwEs'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20jog.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGpvZy53ZWJtIiwiaWF0IjoxNzQ3MjkwNTQ5LCJleHAiOjE3Nzg4MjY1NDl9.Xo5BegKTVKxjckmAR-MgCJ9IIkGZ56qvkbQXOwiaTuI'),
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
                                          text: "Jog",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/karate.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2thcmF0ZS53ZWJtIiwiaWF0IjoxNzQ3MjkwMjExLCJleHAiOjE3Nzg4MjYyMTF9.I0HmFBFnUu0QJrYCAycO7FIWAwtPI-4hHBuOWmI8w48'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20scuba%20dive.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHNjdWJhIGRpdmUud2VibSIsImlhdCI6MTc0NzI5MDU5NCwiZXhwIjoxNzc4ODI2NTk0fQ.k3LUWMT1zGqxPdowB5nZ-W-xrmtKVTSGyipghcVWuQ8'),
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
                                          text: "Scuba dive",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/soccer.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3NvY2Nlci53ZWJtIiwiaWF0IjoxNzQ3MjkwMzc4LCJleHAiOjE3Nzg4MjYzNzh9.nTeud0Ngu-GTju6liIJF2_mP0u8Okw6QSeFyUPdA6LA'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/softball.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3NvZnRiYWxsLndlYm0iLCJpYXQiOjE3NDcyOTAzODYsImV4cCI6MTc3ODgyNjM4Nn0.9ZSdbHLko81rBiCQv5VHZy127eaGCi-r3n5YjKuZF3U'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20surf.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHN1cmYud2VibSIsImlhdCI6MTc0NzI5MDYxNSwiZXhwIjoxNzc4ODI2NjE1fQ.X3_j0uUjk_TacHPsjXvcX73GuQ-28QQDonwvjI5uQGQ'),
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
                                          text: "Surf",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20swim.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHN3aW0ud2VibSIsImlhdCI6MTc0NzI5MDYyNCwiZXhwIjoxNzc4ODI2NjI0fQ.5vAjLb6cNiKtHZlqt04u1AvjXor5slOZXyUEVfFm2Fk'),
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
                                          text: "Swim",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/tennis.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3Rlbm5pcy53ZWJtIiwiaWF0IjoxNzQ3MjkwNDU5LCJleHAiOjE3Nzg4MjY0NTl9.zts4xk1QSRrjzhundKXg2h_g_A03w6OMRZaLytXbIuc'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/voleyball.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3ZvbGV5YmFsbC53ZWJtIiwiaWF0IjoxNzQ3MjkwNjY5LCJleHAiOjE3Nzg4MjY2Njl9.5GvXbvl5m5Arm5Ask86fyMLj_g4auMSkaWnigBoHUUQ'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/volleyball%20ver%202.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3ZvbGxleWJhbGwgdmVyIDIud2VibSIsImlhdCI6MTc0NzI5MDY3OSwiZXhwIjoxNzc4ODI2Njc5fQ.7XDHIesud0fVrDrzqBgGdH2oriylPlFPzkpTp1kkjxE'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/wrestling.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3dyZXN0bGluZy53ZWJtIiwiaWF0IjoxNzQ3MjkwNjk3LCJleHAiOjE3Nzg4MjY2OTd9.zZhXIVLsOsxcpMlrdJ5sBPEkJkPWohNdZl5YY9hUhCY'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20experience.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGV4cGVyaWVuY2Uud2VibSIsImlhdCI6MTc0NzI5MDQ5NSwiZXhwIjoxNzc4ODI2NDk1fQ.bTGcocT-QkyRrXjyyFTi9mNXi0KHIDLOaHNoaYTwsFA'),
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
                                          text: "Experience",
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/have%20you%20done%20scuba%20diving.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2hhdmUgeW91IGRvbmUgc2N1YmEgZGl2aW5nLndlYm0iLCJpYXQiOjE3NDcyOTAxNjcsImV4cCI6MTc3ODgyNjE2N30.MTusCzk8e25HJXVbq97s0yOqu-xyVNcCIgQoM4qkmD0'),
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
                                          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/yes,%20i've%20gone%20scuba%20diving.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3llcywgaSd2ZSBnb25lIHNjdWJhIGRpdmluZy53ZWJtIiwiaWF0IjoxNzQ3MjkwNzIxLCJleHAiOjE3Nzg4MjY3MjF9.GqaIFcFZbCLZ99W567lyM8aWEDxBWjlJlv9DBi-B-Qg"),
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
                                          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/yes,%20i've%20gone%20scuba%20diving.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3llcywgaSd2ZSBnb25lIHNjdWJhIGRpdmluZy53ZWJtIiwiaWF0IjoxNzQ3MjkwNzIxLCJleHAiOjE3Nzg4MjY3MjF9.GqaIFcFZbCLZ99W567lyM8aWEDxBWjlJlv9DBi-B-Qg"),
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
                                          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/no,%20i%20haven't%20gone%20scuba%20diving.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L25vLCBpIGhhdmVuJ3QgZ29uZSBzY3ViYSBkaXZpbmcud2VibSIsImlhdCI6MTc0NzI5MDM0NSwiZXhwIjoxNzc4ODI2MzQ1fQ.IJWiflUFaWmEGCy9I8MIlOvuNh1Yt3MHq05t4ZI3Ih8"),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20bungee%20jump.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGJ1bmdlZSBqdW1wLndlYm0iLCJpYXQiOjE3NDcyOTA0NjksImV4cCI6MTc3ODgyNjQ2OX0.9sEtud8H_xi73H4n3h19wRvx5utKuYTZPVqaQlubSGc'),
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
                                          text: "Bungee jump",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20camp.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGNhbXAud2VibSIsImlhdCI6MTc0NzI5MDQ3OCwiZXhwIjoxNzc4ODI2NDc4fQ.w-8f4f_9ZHWp3-MVlxf5iIXpsIY0YMAFs9XNsRwOHiA'),
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
                                          text: "Camp",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20exercise.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGV4ZXJjaXNlLndlYm0iLCJpYXQiOjE3NDcyOTA0ODYsImV4cCI6MTc3ODgyNjQ4Nn0.JpOKpwILtQF_UJRj9apfOOTTDPOhaYeI9Jy6X95cni0'),
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
                                          text: "Exercise/Lift weights",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20fish.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGZpc2gud2VibSIsImlhdCI6MTc0NzI5MDUxMiwiZXhwIjoxNzc4ODI2NTEyfQ.3Cwz9VCSoTMZ6BNddAwPRTJTk7xTPnLtOoSJMrFScBc'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20hike.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIGhpa2Uud2VibSIsImlhdCI6MTc0NzI5MDU0MiwiZXhwIjoxNzc4ODI2NTQyfQ.dkNvd-bb0TgITexlV8Tzw8brdUgITIOmbPbz176SLaQ'),
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
                                          text: "Hike",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20play%20cards.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHBsYXkgY2FyZHMud2VibSIsImlhdCI6MTc0NzI5MDU2NiwiZXhwIjoxNzc4ODI2NTY2fQ.nkipLZ4XO7B8doxORprN9MdQQIVde8XK-aJqzPO8OWQ'),
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
                                          text: "Play cards",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/to%20skateboard.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3RvIHNrYXRlYm9hcmQud2VibSIsImlhdCI6MTc0NzI5MDYwNSwiZXhwIjoxNzc4ODI2NjA1fQ.oAuR5us5zyqAzM7U7BBLrkzquh0COk1_23PItQ847ns'),
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
                                          text: "Skateboard",
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/asl%20poetry.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2FzbCBwb2V0cnkud2VibSIsImlhdCI6MTc0NzI5MDA0NywiZXhwIjoxNzc4ODI2MDQ3fQ.ymvn8iFD6XsN5_LF5-JBV3BexjTbgL9YGhEU_ZwYLOc'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/handshape.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2hhbmRzaGFwZS53ZWJtIiwiaWF0IjoxNzQ3MjkwMTQyLCJleHAiOjE3Nzg4MjYxNDJ9.UeQvWMsgihHauDg46ASpzVjIJbwf8-NTQM0ZbxiEmo8'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/poetry.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3BvZXRyeS53ZWJtIiwiaWF0IjoxNzQ3MjkwMzU3LCJleHAiOjE3Nzg4MjYzNTd9.PlLR6rY_s1zPhi-oqSCWp1wm1lQKIGbAlBkCwbfnJ00'),
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
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/story.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3N0b3J5LndlYm0iLCJpYXQiOjE3NDcyOTAzOTYsImV4cCI6MTc3ODgyNjM5Nn0.1DyhaBnUiKQi0DG9IQScxu1h0hknLbijlpuILsuYh2c'),
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
                                          text: "Story/Tell a story",
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
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/jade%20is%20on%20the%20softball%20team.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2phZGUgaXMgb24gdGhlIHNvZnRiYWxsIHRlYW0ud2VibSIsImlhdCI6MTc0NzI5MDIwMCwiZXhwIjoxNzc4ODI2MjAwfQ.UKg9KhplmZnQBPruQ-q9UFw_tsjzmrtv1NWQMxJJvqA",
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
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/have%20you%20gone%20bowling.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2hhdmUgeW91IGdvbmUgYm93bGluZy53ZWJtIiwiaWF0IjoxNzQ3MjkwMTc0LCJleHAiOjE3Nzg4MjYxNzR9.I4qqUWxHYBS4gfs661hQAjipLyrdsqwiUXFAXdXniDQ",
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
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/lyka%20is%20good%20at%20soccer.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2x5a2EgaXMgZ29vZCBhdCBzb2NjZXIud2VibSIsImlhdCI6MTc0NzI5MDIyMSwiZXhwIjoxNzc4ODI2MjIxfQ.Ak4xKudnWvczhR0A-8A4P2rueuI0iHWBynTd8WnTh1I",
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
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/we%20are%20going%20to%20watch%20basketball.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L3dlIGFyZSBnb2luZyB0byB3YXRjaCBiYXNrZXRiYWxsLndlYm0iLCJpYXQiOjE3NDcyOTA2ODgsImV4cCI6MTc3ODgyNjY4OH0.iXxhlgPvBOeTJbzNNXqi1pbVr1faPwrstzJMpLuhMqw",
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
