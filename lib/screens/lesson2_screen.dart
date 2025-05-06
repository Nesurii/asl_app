import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../services/completed_lessons_progress.dart';
import '../services/state_progress.dart';
import 'video_player_widget.dart';

class Lesson2Screen extends StatefulWidget {
  final String lessonId;
  const Lesson2Screen({super.key, required this.lessonId});

  @override
  State<Lesson2Screen> createState() => _Lesson2ScreenState();
}

class _Lesson2ScreenState extends State<Lesson2Screen> {
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
      'title': 'Greetings',
    },
    {
      'title': 'Casual Conversations',
    },
    {
      'title': 'Basic Greetings',
    },
    {
      'title': 'Greetings Vocabulary',
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

  Future<void> nextSection() async {
    if (currentIndex < lessonSections.length - 1) {
      
      setState(() {
        currentIndex++;
      });
      _saveCurrentPage();
    }
  }

  Future<void> previousSection() async {
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
          'Lesson 2 - ${section['title']}',
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
                            case 'Greetings':
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
                                              "Greetings are usually a part of a conversation. Let me introduce you to some of the basic signs that are helpful in a conversation.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/hi_android.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9oaV9hbmRyb2lkLndlYm0iLCJpYXQiOjE3NDUzMzEwMTUsImV4cCI6MTc3Njg2NzAxNX0.LK9vKUydZLIO3DrxZhGtfdKsAjAeYl660Ro-LIMrzR4',
                                  ),
                                  SizedBox(height: 18),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text: "You can use ",
                                        ),
                                        TextSpan(
                                          text: "'Hi' ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "if you’re having a friendly conversation.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 18),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/hello.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvaGVsbG8ud2VibSIsImlhdCI6MTc0MzQyNTE3MiwiZXhwIjoxNzc0OTYxMTcyfQ.L6KBXlQYq6vf4l5bLa3Mc3wH_GrEKp83Rzq9dcumvdc',
                                  ),
                                  SizedBox(height: 18),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text: "'Hello' ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "if it is formal.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 25),
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
                                              "Don’t forget to smile. Facial expressions are also important as well as the accuracy of your hand movements!",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Casual Conversations':
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
                                              "You can use this while talking casually to a family member or friend.\n",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/what_s%20up.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvd2hhdF9zIHVwLndlYm0iLCJpYXQiOjE3NDM0MjYyNzUsImV4cCI6MTc3NDk2MjI3NX0.DnI1IIwjgh4bFD-1AEkW91GzVc1hN0Dk8PZAue3oC50',
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
                                          text: "What's up",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 35),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text: "There are two ways to say ",
                                        ),
                                        TextSpan(
                                          text: "'How are you'",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              ", you use this while talking formally.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/how%20are%20you.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvaG93IGFyZSB5b3Uud2VibSIsImlhdCI6MTc0MzQyNTI5NCwiZXhwIjoxNzc0OTYxMjk0fQ.XS_bLL48TzyX9qAueCjIy4WEfvFiHguAQ4ycYyuevd4',
                                  ),
                                  SizedBox(height: 15),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/how%20are%20you%20ver.%202.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvaG93IGFyZSB5b3UgdmVyLiAyLndlYm0iLCJpYXQiOjE3NDQ3MzgyMjEsImV4cCI6MTc3NjI3NDIyMX0.P7yNTKgqujNTZWj2dIPl4Yw95hi0kI4PdnkBH7dq4lw',
                                  ),
                                  SizedBox(height: 35),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text: "You can use ",
                                        ),
                                        TextSpan(
                                          text: "'I’m fine' ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "as a response to 'How are you'.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/i_m%20fine.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvaV9tIGZpbmUud2VibSIsImlhdCI6MTc0MzQyNTM1NSwiZXhwIjoxNzc0OTYxMzU1fQ.Umn3XD_69oi9u5wJYqA87ptchXkePGofiQeNgs5PJWs',
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Basic Greetings':
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
                                              "These are other basic greetings you can use in daily life.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/good%20morning.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvZ29vZCBtb3JuaW5nLndlYm0iLCJpYXQiOjE3NDM0MjUxMTYsImV4cCI6MTc3NDk2MTExNn0.-NfETvMk4PQnKouP2FALrKbQDGQTSuCneUoj8Xkx6UI',
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
                                          text: "Good Morning 🌞",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/good%20afternoon.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvZ29vZCBhZnRlcm5vb24ud2VibSIsImlhdCI6MTc0MzQyNTA5OSwiZXhwIjoxNzc0OTYxMDk5fQ.-KeaJUErAyU4ixCpZF9FyeDmb-6hhlMutqr3e33uQGE',
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
                                          text: "Good Afternoon 🌅",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/good%20evening.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvZ29vZCBldmVuaW5nLndlYm0iLCJpYXQiOjE3NDM0MjUxMDcsImV4cCI6MTc3NDk2MTEwN30.mOdu-1--zbs_NAaUbmD8NljeLVHwwd7F1GUiS96uGdA',
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
                                          text: "Good Evening/Good Night 🌙",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Greetings Vocabulary':
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
                                              "Now let’s get you familiarized with the vocabulary related to greetings.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/busy.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvYnVzeS53ZWJtIiwiaWF0IjoxNzQzNDI1MDA0LCJleHAiOjE3NzQ5NjEwMDR9.nrQgtLFBxTRTRTrgjFqPd7dMWweHF5UrXOs_6nUUfkc',
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
                                          text: "To be busy",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%205/I_m%20happy.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDUvSV9tIGhhcHB5LndlYm0iLCJpYXQiOjE3NDM1NjU2NDAsImV4cCI6MTc3NTEwMTY0MH0.xyABkqSGZWEVP04h7JJsVB0Zmx7zAm2S9R0rju2zTlo',
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
                                          text: "To be happy",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/sleepy%20ver.%202.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvc2xlZXB5IHZlci4gMi53ZWJtIiwiaWF0IjoxNzQzNDI2MDU0LCJleHAiOjE3NzQ5NjIwNTR9.OV5hAknqSdFpS08hMwUty7xT7mepXWFolrIuBGfo6Cg',
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
                                          text: "Sleepy",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/confused.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvY29uZnVzZWQud2VibSIsImlhdCI6MTc0MzQyNTAyNSwiZXhwIjoxNzc0OTYxMDI1fQ.Z9hePv5E4lG1KBvCnsJ6L_MfLFbCNeDhfK5OPHCa97E',
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
                                          text: "Confused",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/nothing.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvbm90aGluZy53ZWJtIiwiaWF0IjoxNzQzNDI1NTI2LCJleHAiOjE3NzQ5NjE1MjZ9.Qt6goo4hdEbahSIcc_7_1PShtub_0TdeWPTYGD7B-OY',
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
                                          text: "Nothing/Not much",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/so-so.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvc28tc28ud2VibSIsImlhdCI6MTc0MzQyNjA3MSwiZXhwIjoxNzc0OTYyMDcxfQ.gs4qBBfe0hcreLTokoOuqKw8zFVVsY7yDVsB-QgV1G4',
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
                                          text: "So So/Not too bad ",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/fine.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvZmluZS53ZWJtIiwiaWF0IjoxNzQzNDI1MDcwLCJleHAiOjE3NzQ5NjEwNzB9.1i-n5W2kUWQDha9s_tFRU92gnTpN5eMouSvhBoWzSaw',
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
                                          text: "Fine",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/well.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvd2VsbC53ZWJtIiwiaWF0IjoxNzQzNDI2MTkxLCJleHAiOjE3NzQ5NjIxOTF9.YYVmhWRK5LhAIWo11JR3WiOonw2SLtJ49w-_D_B_FQY',
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
                                          text: "To be good/Well",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/same%20old.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvc2FtZSBvbGQud2VibSIsImlhdCI6MTc0MzQyNTU1NywiZXhwIjoxNzc0OTYxNTU3fQ.nuxkAoULU0XLDyuiXEaHlgP6DeHeLjH7jyvlTiQs5fg',
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
                                          text: "Same old/The usual",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                    videoUrl:
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/tired.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvdGlyZWQud2VibSIsImlhdCI6MTc0MzQyNjEwNCwiZXhwIjoxNzc0OTYyMTA0fQ.HJAINbkHMtHSRFS4evydL331DfBYzpsXMxvgAApIx_Q',
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
                                          text: "To be tired",
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
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "ASL is different from English, especially in the structure of phrases and sentences. The verb “to be” may or may not be included in the sentence but the sign will still be the same.",
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
                                              "Nice work! We've wrapped up this lesson. Ready to check what you've learned?",
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
                              int correctAnswer5 = 2;

                              double progress = totalScore /
                                  100; // Update progress with previous score

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
                                        '1. Which is the correct way to sign “Good evening”?',
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
                                                  1), // dynamic background color
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
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/good%20evening.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvZ29vZCBldmVuaW5nLndlYm0iLCJpYXQiOjE3NDM0MjUxMDcsImV4cCI6MTc3NDk2MTEwN30.mOdu-1--zbs_NAaUbmD8NljeLVHwwd7F1GUiS96uGdA',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: getButtonColor(1,
                                                  2), // dynamic background color
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
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/good%20afternoon.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvZ29vZCBhZnRlcm5vb24ud2VibSIsImlhdCI6MTc0MzQyNTA5OSwiZXhwIjoxNzc0OTYxMDk5fQ.-KeaJUErAyU4ixCpZF9FyeDmb-6hhlMutqr3e33uQGE',
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
                                              'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/good%20morning.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvZ29vZCBtb3JuaW5nLndlYm0iLCJpYXQiOjE3NDM0MjUxMTYsImV4cCI6MTc3NDk2MTExNn0.-NfETvMk4PQnKouP2FALrKbQDGQTSuCneUoj8Xkx6UI'),
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
                                              'Good afternoon',
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
                                              'Good morning',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 30),

                                      // Question 3
                                      Text(
                                        '3. “I’m fine” is another way of greeting.',
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
                                        '4. You are talking to your friend, how will you greet him?',
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
                                              color: getButtonColor(4,
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
                                                  checkAnswer(4, 1);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/what_s%20up.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvd2hhdF9zIHVwLndlYm0iLCJpYXQiOjE3NDM0MjYyNzUsImV4cCI6MTc3NDk2MjI3NX0.DnI1IIwjgh4bFD-1AEkW91GzVc1hN0Dk8PZAue3oC50',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: getButtonColor(4,
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
                                                  checkAnswer(4, 2);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/how%20are%20you.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvaG93IGFyZSB5b3Uud2VibSIsImlhdCI6MTc0MzQyNTI5NCwiZXhwIjoxNzc0OTYxMjk0fQ.XS_bLL48TzyX9qAueCjIy4WEfvFiHguAQ4ycYyuevd4',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),

                                      // Question 5
                                      Text(
                                        '5. How would you respond if your teacher asked, “How are You?”?',
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
                                              color: getButtonColor(5,
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
                                                  checkAnswer(5, 1);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/same%20old.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvc2FtZSBvbGQud2VibSIsImlhdCI6MTc0MzQyNTU1NywiZXhwIjoxNzc0OTYxNTU3fQ.nuxkAoULU0XLDyuiXEaHlgP6DeHeLjH7jyvlTiQs5fg',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: getButtonColor(5,
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
                                                  checkAnswer(5, 2);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/i_m%20fine.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvaV9tIGZpbmUud2VibSIsImlhdCI6MTc0MzQyNTM1NSwiZXhwIjoxNzc0OTYxMzU1fQ.Umn3XD_69oi9u5wJYqA87ptchXkePGofiQeNgs5PJWs',
                                                ),
                                              ),
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
                              const SnackBar(
                                content: Text('Please answer all quiz questions before finishing.'),
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
