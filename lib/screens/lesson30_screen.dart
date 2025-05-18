import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../services/completed_lessons_progress.dart';
import '../services/state_progress.dart';
import 'video_player_widget.dart';

class Lesson30Screen extends StatefulWidget {
  final String lessonId;

  const Lesson30Screen({super.key, required this.lessonId});

  @override
  State<Lesson30Screen> createState() => _Lesson30ScreenState();
}

class _Lesson30ScreenState extends State<Lesson30Screen> {
  int currentIndex = 0;
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();
  final lessonManager = LessonManager();

  bool lessonCompleted = false;
  bool answeredQuestion1 = false;
  bool answeredQuestion2 = false;
  bool answeredQuestion4 = false;
  bool answered1 = false;
  bool answered2 = false;

  final List<Map<String, dynamic>> lessonSections = [
    {
      'title': 'Daily Routines and Activities',
    },
    {
      'title': 'Vocabulary: Signing Every',
    },
    {
      'title': 'Vocabulary: Morning Routines',
    },
    {
      'title': 'Vocabulary: More Routines',
    },
    {
      'title': 'Spatial Organization',
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
          'Lesson 30 - ${section['title']}',
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
                            case 'Daily Routines and Activities':
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
                                              "Describing what you do every day is an important language skill. In this section, you will learn how to explain recurring activities and routines.\n\n",
                                        ),
                                        TextSpan(
                                          text: "Every ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              'signs are part of the when group of signs, so they come first in sentences. Every signs can be interpreted as "every" or as "on" interchangeably, but don’t use the sign during with them. ',
                                        ),
                                        TextSpan(
                                          text: "Every ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "signs are made using the hand shape for the day of the week, moving it down as if through each week on a calendar.",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );

                            case 'Vocabulary: Signing Every':
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
                                            text: "Vocabulary: Signing Every",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/every.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2V2ZXJ5LndlYm0iLCJpYXQiOjE3NDcyOTA5NzcsImV4cCI6MTc3ODgyNjk3N30.uhg-VfClh4exObuk7JiSmzv4LlHvksqjyiZTAF6oQ7k'),
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
                                          text: "Every",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/morning.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvbW9ybmluZy53ZWJtIiwiaWF0IjoxNzQ3MjkwODQ3LCJleHAiOjE3Nzg4MjY4NDd9.pizrdERRLeXz2cci3AcSaQFQb-7Rhpl11gWSfD5eQDw'),
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
                                          text: "Morning",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/afternoon.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvYWZ0ZXJub29uLndlYm0iLCJpYXQiOjE3NDcyODc4MzMsImV4cCI6MTc3ODgyMzgzM30.iIEzisT-odc081JhAtW959ZmxuTh3H8aPlZS6lmJ7vw'),
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
                                          text: "Afternoon",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/evening,%20night.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvZXZlbmluZywgbmlnaHQud2VibSIsImlhdCI6MTc0NzI5MDg3MiwiZXhwIjoxNzc4ODI2ODcyfQ.fcrN8LSle4yOzmJ2F-Etw00L_yv7OM-BzLkS4iYcbbk'),
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
                                          text: "Night",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/every%20afternoon.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2V2ZXJ5IGFmdGVybm9vbi53ZWJtIiwiaWF0IjoxNzQ3MjkwOTMyLCJleHAiOjE3Nzg4MjY5MzJ9.aPKb3J4WUWmbFEHyBXBgZklFcLpAJM20I6lIt0NN7qg'),
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
                                          text: "Every afternoon",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/every%20morning.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2V2ZXJ5IG1vcm5pbmcud2VibSIsImlhdCI6MTc0NzI5MDk2NywiZXhwIjoxNzc4ODI2OTY3fQ.lpzmzZ_WpXDI_Sx5q6PEhu5SV4MLJ41RyfBatlTKtAg'),
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
                                          text: "Every morning",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/every%20night.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2V2ZXJ5IG5pZ2h0LndlYm0iLCJpYXQiOjE3NDcyODk3MjUsImV4cCI6MTc3ODgyNTcyNX0.fykQeoKs-dcifD5tr7H7jkAiKxaoL91rrv97Zu1Va4A'),
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
                                          text: "Every night",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/every%20week.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2V2ZXJ5IHdlZWsud2VibSIsImlhdCI6MTc0NzI5MTAyNSwiZXhwIjoxNzc4ODI3MDI1fQ.zwzyT3GJdY1tj9uf7D92TkO47UA8_DK-NWazoc9kky8'),
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
                                          text: "Every week",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/every%20week.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2V2ZXJ5IHdlZWsud2VibSIsImlhdCI6MTc0NzI5MTAyNSwiZXhwIjoxNzc4ODI3MDI1fQ.zwzyT3GJdY1tj9uf7D92TkO47UA8_DK-NWazoc9kky8'),
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
                                          text: "Every year",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: Morning Routines':
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
                                                "Vocabulary: Morning Routines",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20take%20a%20bath.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIHRha2UgYSBiYXRoLndlYm0iLCJpYXQiOjE3NDcyOTEzNzIsImV4cCI6MTc3ODgyNzM3Mn0.zHJkXHQKGI046iS3xhZRIvsGG5QKas6rdo-ngDlQTFI'),
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
                                          text: "Take a bath",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20do%20chores.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGRvIGNob3Jlcy53ZWJtIiwiaWF0IjoxNzQ3MjkxMTY2LCJleHAiOjE3Nzg4MjcxNjZ9.mIKNzl3mBu25DOIVv32phC_DsiwCLXN7RL8gtaY7Fbs'),
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
                                          text: "Eat breakfast",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20brush%20one's%20hair.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGJydXNoIG9uZSdzIGhhaXIud2VibSIsImlhdCI6MTc0NzI5MTEzMiwiZXhwIjoxNzc4ODI3MTMyfQ.2x8UeX1oPgu1LO0kRcmzztSLpi6au5SmrxcWqUZGEhk"),
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
                                          text: "Brush one’s hair",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20brush%20one's%20hair.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGJydXNoIG9uZSdzIGhhaXIud2VibSIsImlhdCI6MTc0NzI5MTEzMiwiZXhwIjoxNzc4ODI3MTMyfQ.2x8UeX1oPgu1LO0kRcmzztSLpi6au5SmrxcWqUZGEhk"),
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
                                          text: "Brush one’s teeth",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20comb%20one's%20hair.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGNvbWIgb25lJ3MgaGFpci53ZWJtIiwiaWF0IjoxNzQ3MjkxMTU2LCJleHAiOjE3Nzg4MjcxNTZ9.RBUbADft0cQ4rA3m_9THZzCCDObB5vNwu56S23w6do0"),
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
                                          text: "Comb one’s hair",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20get%20dressed.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGdldCBkcmVzc2VkLndlYm0iLCJpYXQiOjE3NDcyOTEyMzcsImV4cCI6MTc3ODgyNzIzN30.m33BRaJgbhPhzSB2kQvNnGwGHOKSRYO500eM2wPkODI'),
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
                                          text: "Get dressed",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20get%20ready.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGdldCByZWFkeS53ZWJtIiwiaWF0IjoxNzQ3MjkxMjY3LCJleHAiOjE3Nzg4MjcyNjd9.rZqGNOnZfhdUrVxEC2o3Yx_YgqrMqfTXUpksJsJ2-1I'),
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
                                          text: "Get ready (Version 1)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20get%20ready%20ver%202.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGdldCByZWFkeSB2ZXIgMi53ZWJtIiwiaWF0IjoxNzQ3MjkxMjU5LCJleHAiOjE3Nzg4MjcyNTl9.9pHn6wcWDEJ8B4PnQkuHsoHtLe5X4WVtIYTBMKKg3kw'),
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
                                          text: "Get ready (Version 2)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20get%20up.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGdldCB1cC53ZWJtIiwiaWF0IjoxNzQ3MjkxMjc0LCJleHAiOjE3Nzg4MjcyNzR9.7HpbJrbmCBf89Wf4G7FFusa8UorHrYpQxpzltUJ7ctE'),
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
                                          text: "Get up",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20put%20on%20makeup.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIHB1dCBvbiBtYWtldXAud2VibSIsImlhdCI6MTc0NzI5MTMwMSwiZXhwIjoxNzc4ODI3MzAxfQ.LN3xRtdxS8hXNN8KgTfnr7Pc_YNOK-tNMXfXCqz1biI'),
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
                                          text: "Put on makeup",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20oversleep.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIG92ZXJzbGVlcC53ZWJtIiwiaWF0IjoxNzQ3MjkxMjkzLCJleHAiOjE3Nzg4MjcyOTN9.-Sji1KFRhjagJ9UncK576qGo4titKNS_Vu97X--Lwf0'),
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
                                          text: "Oversleep",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20shave%20.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIHNoYXZlIC53ZWJtIiwiaWF0IjoxNzQ3MjkxMzU4LCJleHAiOjE3Nzg4MjczNTh9.aUIZj-K1OcyEfNWKakhz5TPk4IcXy027DSJnrYVCbUE'),
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
                                          text: "Shave (Version 1)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20shave%20ver%202.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIHNoYXZlIHZlciAyLndlYm0iLCJpYXQiOjE3NDcyOTEzMzUsImV4cCI6MTc3ODgyNzMzNX0.uBoQmzKQXK-D5M88vnfnp5tIAistOdegXKKV2d8mnDI'),
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
                                          text: "Shave (Version 2)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20shower.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIHNob3dlci53ZWJtIiwiaWF0IjoxNzQ3MjkxMzY1LCJleHAiOjE3Nzg4MjczNjV9.xyvdLwr8whr5Gz-O41KreEZ7Ky-HcJrL-v7IQ8gNqFs'),
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
                                          text: "Shower",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20wake%20up.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIHdha2UgdXAud2VibSIsImlhdCI6MTc0NzI5MTM3OSwiZXhwIjoxNzc4ODI3Mzc5fQ.Fr5qWN5n1PHgtmW3m2YewxR7M3MpuWVc7jHWZhVmysY'),
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
                                          text: "Wake up",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: More Routines':
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
                                            text: "Vocabulary: More Routines",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20brush%20one's%20hair.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGJydXNoIG9uZSdzIGhhaXIud2VibSIsImlhdCI6MTc0NzI5MTEzMiwiZXhwIjoxNzc4ODI3MTMyfQ.2x8UeX1oPgu1LO0kRcmzztSLpi6au5SmrxcWqUZGEhk"),
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
                                          text: "Change (clothes)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20do%20chores.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGRvIGNob3Jlcy53ZWJtIiwiaWF0IjoxNzQ3MjkxMTY2LCJleHAiOjE3Nzg4MjcxNjZ9.mIKNzl3mBu25DOIVv32phC_DsiwCLXN7RL8gtaY7Fbs'),
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
                                          text: "Do chores/Duties ",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20eat%20dinner.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGVhdCBkaW5uZXIud2VibSIsImlhdCI6MTc0NzI5MTIwOSwiZXhwIjoxNzc4ODI3MjA5fQ.aiAMuhiL_VIDyZyl27xHY5i92b1NGD-SKZXk3PVO5eY'),
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
                                          text: "Eat dinner/Supper",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/early.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2Vhcmx5LndlYm0iLCJpYXQiOjE3NDcyOTA5MjEsImV4cCI6MTc3ODgyNjkyMX0.Xy7CdxuEOX7af_dtYwXbSOmVKKHYppzz3xsQiCiuypY'),
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
                                          text: "Early",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20fall%20asleep.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGZhbGwgYXNsZWVwLndlYm0iLCJpYXQiOjE3NDcyOTEyMjgsImV4cCI6MTc3ODgyNzIyOH0.YeL65bBbcZ4WA_bEXPMKfUha7DN9GlqAx7hqH0IF8LE'),
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
                                          text: "Fall asleep",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20go%20to%20bed.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGdvIHRvIGJlZC53ZWJtIiwiaWF0IjoxNzQ3MjkxMjg2LCJleHAiOjE3Nzg4MjcyODZ9.7UoPV31xfK8LKl6ZsDed_shBw4xzUeTTHeilWa5sQu8'),
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
                                          text: "Go to bed",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20eat%20lunch.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGVhdCBsdW5jaC53ZWJtIiwiaWF0IjoxNzQ3MjkxMjIwLCJleHAiOjE3Nzg4MjcyMjB9.Dg6vhT0RMTyWzZIFHk9uyGe7J15BmXfOFykuItthR_U'),
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
                                          text: "Eat lunch",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20rest.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIHJlc3Qud2VibSIsImlhdCI6MTc0NzI5MTMxNywiZXhwIjoxNzc4ODI3MzE3fQ.qLRz9ojrO-9KTFuvr_rYGnOFUXEYFdNcPrlb-Kw4fKY'),
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
                                          text: "Rest/Relax",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20rest.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIHJlc3Qud2VibSIsImlhdCI6MTc0NzI5MTMxNywiZXhwIjoxNzc4ODI3MzE3fQ.qLRz9ojrO-9KTFuvr_rYGnOFUXEYFdNcPrlb-Kw4fKY'),
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
                                          text: "Set an alarm",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/around.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L2Fyb3VuZC53ZWJtIiwiaWF0IjoxNzQ0MjI5NzgxLCJleHAiOjE3NzU3NjU3ODF9.CK4FS8Pci15WGnTVFNIw5788fbSScH1xb0s1rYCRM_w'),
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
                                          text: "Around",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/betwee.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2JldHdlZS53ZWJtIiwiaWF0IjoxNzQ3MjkwODkzLCJleHAiOjE3Nzg4MjY4OTN9.nRFHoq_5RTrOww1IdmKFg8HiI2hSbLH_VNoJqu5G0eg'),
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
                                          text: "Between",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Spatial Organization':
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
                                          text: "Spatial Organization",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              'The English word "then" is often used to describe a series of events, as in this sentence: "I woke up at nine, then I went to class, then I went to work, and then I went home. "American Sign Language has a visual way of organizing information into groups of related thoughts, actions, or details. This grouping is called ',
                                        ),
                                        TextSpan(
                                          text: "spatial organization.\n\n",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "Spatial organization uses Shoulder-Shifting and the ‘group’ sign to separate details into related groups. Add a new group and shoulder-shift for each additional series of details. Use spatial organization when signing about several details.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/group%201.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2dyb3VwIDEud2VibSIsImlhdCI6MTc0NzI5MTA3MiwiZXhwIjoxNzc4ODI3MDcyfQ.8VkBBSLXw1OnVUybU-vEDFtfBtcGdZXNiWASNmLDHTE'),
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
                                          text: "Group 1",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/group%202.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2dyb3VwIDIud2VibSIsImlhdCI6MTc0NzI5MTA4MCwiZXhwIjoxNzc4ODI3MDgwfQ.T6MjQstlPI7O3CVHwtj-JEyv_l6aMzDSRe2U1BrQQ08'),
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
                                          text: "Group 2",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/group%203.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2dyb3VwIDMud2VibSIsImlhdCI6MTc0NzI5MTA4NywiZXhwIjoxNzc4ODI3MDg3fQ.r7o98Sl2Wlegw5IQkogV5eyNOOj8ng4STl9Nd_dPEHk'),
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
                                          text: "Group 3",
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
                                              "Look at the example below to understand how spatial organization is used to sign this sentence: Every morning I get up and brush my teeth. Then in the afternoons, I have class and work. At night, I hang out with friends.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/every%20morning%20i%20get%20up%20and%20brush%20my%20teeth.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2V2ZXJ5IG1vcm5pbmcgaSBnZXQgdXAgYW5kIGJydXNoIG15IHRlZXRoLndlYm0iLCJpYXQiOjE3NDcyOTA5NTAsImV4cCI6MTc3ODgyNjk1MH0.J0AlLskMQYM7v2NSQGJRxPkXXi2drZyCFOgpaTj9D7A'),
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
                                              "Every morning I get up and brush my teeth",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/then%20in%20the%20afternoons,%20i%20have%20class%20and%20work.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RoZW4gaW4gdGhlIGFmdGVybm9vbnMsIGkgaGF2ZSBjbGFzcyBhbmQgd29yay53ZWJtIiwiaWF0IjoxNzQ3MjkxMTI1LCJleHAiOjE3Nzg4MjcxMjV9.oG3fONhv60l9G30r1hJ4hSjYrR2gTI_T_YuDWDo_Mvs'),
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
                                              "Then in the afternoons, I have class and work.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/at%20night,%20i%20hangout%20with%20friends.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2F0IG5pZ2h0LCBpIGhhbmdvdXQgd2l0aCBmcmllbmRzLndlYm0iLCJpYXQiOjE3NDcyOTA4ODUsImV4cCI6MTc3ODgyNjg4NX0.BV1Bh6gppuD7VXZ5LK-SkJEzpC7R0wJPWxFnVOgmmQo'),
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
                                              "At night, I hang out with friends",
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
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "Use spatial organization to group related information together.",
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
                                              "Well done! You’ve reached the finish line. Let’s take a quick check on what you’ve learned!",
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
                              int selectedAnswer4 = -1;

                              int correctAnswer1 = 3;
                              int correctAnswer2 = 2;
                              int correctAnswer4 = 2;

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
                                      'to eat lunch';

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
                                      'i go to bed at 11:00';

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
                                    } else if (questionNumber == 2 &&
                                        !answeredQuestion2) {
                                      selectedAnswer2 = selectedAnswer;
                                      isCorrect =
                                          selectedAnswer2 == correctAnswer2;
                                      answeredQuestion2 = true;
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
                                        "1. Based on the video below, what does the person do at 7:30?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/i%20wake%20up%20at%207_30.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2kgd2FrZSB1cCBhdCA3XzMwLndlYm0iLCJpYXQiOjE3NDcyOTExMDAsImV4cCI6MTc3ODgyNzEwMH0.Eew-r7x7DayM8r-xOM0b9ov1fjQ5ZZI9bQr9XMCi2Yk",
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
                                              'Eat breakfast',
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
                                              'Brush her teeth',
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
                                              'Wake up',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),

                                      // Question 2
                                      Text(
                                        '2. “Every” signs are part of the when group of signs, so it’s okay if they don’t come first in sentences.',
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
                                        "3. What is the person signing in the video shown below?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20eat%20lunch.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGVhdCBsdW5jaC53ZWJtIiwiaWF0IjoxNzQ3MjkxMjIwLCJleHAiOjE3Nzg4MjcyMjB9.Dg6vhT0RMTyWzZIFHk9uyGe7J15BmXfOFykuItthR_U",
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
                                        '4. American Sign Language has a visual way of organizing information into groups of related thoughts, actions, or details which is called shoulder shifting.',
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
                                        "5. What does the video below mean?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20go%20to%20bed.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5Xzg2MzZhOWI0LTU2ZDgtNGM1Zi04MzM4LWEzZmI4ZjkzN2I2MSJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIGdvIHRvIGJlZC53ZWJtIiwiaWF0IjoxNzQ3MjkxMjg2LCJleHAiOjE3Nzg4MjcyODZ9.7UoPV31xfK8LKl6ZsDed_shBw4xzUeTTHeilWa5sQu8",
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
                if (currentIndex != 0 && currentIndex != 6)
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
                  onPressed: (currentIndex == 6)
                      ? () async {
                          
                          bool allQuestionsAnsweredQuiz = answeredQuestion1 &&
                              answeredQuestion2 &&
                              answered1 &&
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
                    (currentIndex == 6) ? 'Finish' : 'Next',
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
