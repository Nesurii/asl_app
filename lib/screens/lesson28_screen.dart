// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../services/completed_lessons_progress.dart';
import '../services/state_progress.dart';
import 'video_player_widget.dart';

class Lesson28Screen extends StatefulWidget {
  final String lessonId;

  const Lesson28Screen({super.key, required this.lessonId});

  @override
  State<Lesson28Screen> createState() => _Lesson28ScreenState();
}

class _Lesson28ScreenState extends State<Lesson28Screen> {
  int currentIndex = 0;
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();
  final lessonManager = LessonManager();

  bool lessonCompleted = false;
  bool answeredQuestion1 = false;
  bool answeredQuestion2 = false;
  bool answeredQuestion4 = false;
  bool answeredQuestion5 = false;
  bool answered1 = false;

  final List<Map<String, dynamic>> lessonSections = [
    {
      'title': 'Classifiers',
    },
    {
      'title': 'Different uses of CL: B',
    },
    {
      'title': 'Vocabulary: Classifiers',
    },
    {
      'title': 'CL: 1 An Individual',
    },
    {
      'title': 'CL: \/\\ A person’s leg or eyes',
    },
    {
      'title': 'CL: 3 Vehicles',
    },
    {
      'title': 'CL: 5 Many people',
    },
    {
      'title': 'CL: Bent V Seated Position',
    },
    {
      'title': 'CL: B & Base B Flat Objects',
    },
    {
      'title': 'Vocabulary: Classifiers ',
    },
    {
      'title': 'CL: C Cylindrical, hand-held objects',
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
          'Lesson 28 - ${section['title']}',
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
                            case 'Classifiers':
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
                                          text: "Classifiers",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "One of the more challenging aspects of ASL is the concept of the classifier (CL), a handshape that reflects particular characteristics. This concept is perhaps the most visual element that is both iconic and abstract in nature, which often confuses ASL students.\n\n",
                                        ),
                                        TextSpan(
                                          text:
                                              "In its most basic form, a classifier is a handshape that conveys details contributing to the overall concept of a sign, in addition to the sign's meaning. For those fluent in ASL, using and understanding classifiers is nearly instinctual. As an ASL student, begin developing your classifier skills by closely observing why specific handshapes are used for signs and the meanings those handshapes suggest. Below are some signs that should be familiar, along with one that is unfamiliar.",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );

                            case 'Different uses of CL: B':
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
                                          text: "Different uses of CL: B",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/gif%201.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2dpZiAxLndlYm0iLCJpYXQiOjE3NDQ2NTQ4OTIsImV4cCI6MTc3NjE5MDg5Mn0.wNohytuRnnTG2_HhVOIiyRPyufKH9OBJL0obkYtd5Yk'),
                                  SizedBox(height: 15),
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
                                                "• Concept: Wide, flat surfaces on my body moving back and forth\n",
                                          ),
                                          TextSpan(
                                            text: "• Meaning: I walk",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/gif%202.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2dpZiAyLndlYm0iLCJpYXQiOjE3NDQ2NTQ5MDUsImV4cCI6MTc3NjE5MDkwNX0.jYBQRCGyjbmwI85XcTfdZS2E_lqZbK2iAtfx9MH1kgM'),
                                  SizedBox(height: 15),
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
                                                "• Concept: Four wide, flat surfaces in a rectangular shape\n",
                                          ),
                                          TextSpan(
                                            text: "• Meaning: Walls / room",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/gif%203.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2dpZiAzLndlYm0iLCJpYXQiOjE3NDQ2NTQ5MjAsImV4cCI6MTc3NjE5MDkyMH0.LE32PYkbgSeKZMJvrvIdNsbBjdfX9iuN79PDujyyaZQ'),
                                  SizedBox(height: 15),
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
                                                "• Concept: Wide, flat, vertical surface that swings open\n",
                                          ),
                                          TextSpan(
                                            text: "• Meaning: Door / open ",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/gif%204.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2dpZiA0LndlYm0iLCJpYXQiOjE3NDQ2NTQ5MzIsImV4cCI6MTc3NjE5MDkzMn0.4hCZvXO-hZnEdozG6DNuB609tY391cyn5Qr39cBefJo'),
                                  SizedBox(height: 15),
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
                                                "•  Concept: Wide, flat, horizontal surface that moves in a wave-like fashion \n",
                                          ),
                                          TextSpan(
                                            text: "• Meaning: ?",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: Classifiers':
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
                                            text: "Vocabulary: Classifiers",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/accident.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2FjY2lkZW50LndlYm0iLCJpYXQiOjE3NDQ2NTQ2MDIsImV4cCI6MTc3NjE5MDYwMn0.eNAkPoC66_mNi3U5BI6NiRuvgq2W1zhu6Cfr8i_wT1s'),
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
                                          text: "Accident",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/bus.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2J1cy53ZWJtIiwiaWF0IjoxNzQ0NjU0NjQ2LCJleHAiOjE3NzYxOTA2NDZ9.TrEYP8OzKvLVD-mrby1zGG_QwkMhwSvx3WMyxJuzJp0'),
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
                                          text: "Bus",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/classifier.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2NsYXNzaWZpZXIud2VibSIsImlhdCI6MTc0NDY1NDY2OSwiZXhwIjoxNzc2MTkwNjY5fQ.hTC4455kuLk4g2GARqGUm0LR6rXZjA3sjFBrisOG9XE'),
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
                                          text: "Classifier",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/to%20dance.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3RvIGRhbmNlLndlYm0iLCJpYXQiOjE3NDQ2NTUxNzYsImV4cCI6MTc3NjE5MTE3Nn0.V8p_9t55K6z-cJiCRRurvDQfGvUMZrETezYiKqr3Z1c'),
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
                                          text: "Dance",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/to%20line%20up.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3RvIGxpbmUgdXAud2VibSIsImlhdCI6MTc0NDY1NTI0MSwiZXhwIjoxNzc2MTkxMjQxfQ.0NXN4O1P1X-ob7vbUuNQ93-IRrvH3lwTNjbVk_4NngM'),
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
                                          text: "Line up",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/to%20look%20at.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3RvIGxvb2sgYXQud2VibSIsImlhdCI6MTc0NDY1NTI1MSwiZXhwIjoxNzc2MTkxMjUxfQ.GDjUsOU8uwKNdgq6mCoz49GPlPsIZRXC4rrSAWmumSo'),
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
                                          text: "Look at",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/motorcycle.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L21vdG9yY3ljbGUud2VibSIsImlhdCI6MTc0NDY1NTA3NywiZXhwIjoxNzc2MTkxMDc3fQ.G2m4Tuj_4PqvCy2Zfd3rZ6AHTFhEjUqYwJ2U27bbhJg'),
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
                                          text: "Motorcycle",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/to%20ride%20a%20horse.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3RvIHJpZGUgYSBob3JzZS53ZWJtIiwiaWF0IjoxNzQ0NjU1MjY2LCJleHAiOjE3NzYxOTEyNjZ9.qckh_cIlSwXdpqnR9LzGNla6RTTSiVpauh_bU_4BB1Y'),
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
                                          text: "Ride a horse",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'CL: 1 An Individual':
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
                                            text: "CL: 1 An Individual",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Image.network(
                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/CL_1.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L0NMXzEucG5nIiwiaWF0IjoxNzQ0NjgxNjc1LCJleHAiOjE3NzYyMTc2NzV9.TqiJm7whn-NFIXhlcLDJALJUD4lu_gOlNorv4Lfs2fA'),
                                  SizedBox(height: 30),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "CL: 1 generally represents an individual and its location, action, and manner. Manipulate the sign to reflect details such as walking slowly, hunched over, moving quickly, falling down, or other characteristics. CL: 1 depicts up to five individuals engaged in the same action simultaneously; for larger crowds, CL: 5 must be used. CL: 1 also refers to cylindrical objects as well, including logs or poles.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/example%201.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2V4YW1wbGUgMS53ZWJtIiwiaWF0IjoxNzQ0NjU0ODQ0LCJleHAiOjE3NzYxOTA4NDR9.0bpWBffOcy7IF8b6Z2GQFqZpx8kTLVBs8WXQFLcX8ZA'),
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
                                          text: "Example 1",
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
                                          text:
                                              "The meaning of Example 1 can vary depending on the characteristics incorporated into the classifier. In this example, it is clear someone is going to the office in a hurry because the classifier is signed quickly. Compare this meaning with Example 2.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/example%202.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2V4YW1wbGUgMi53ZWJtIiwiaWF0IjoxNzQ0NjU0ODU2LCJleHAiOjE3NzYxOTA4NTZ9.bf559Kq-Gg0h3n1y3r9qvZT1fXnNzWR9dIZHOEVT1-4'),
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
                                          text: "Example 2",
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
                                          text:
                                              "By signing the classifier slowly, a different meaning is conveyed. In Example 2, it is clear someone is going to the office slowly, or not in a rush",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'CL: \/\\ A person’s leg or eyes':
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
                                                "CL: \/\\ A person’s leg or eyes",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Image.network(
                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/CL_upside%20down%20V.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L0NMX3Vwc2lkZSBkb3duIFYucG5nIiwiaWF0IjoxNzQ0NjgxODE4LCJleHAiOjE3NzYyMTc4MTh9.KAnrchjpIkWJXDjEKjvvIZJnaYqFgpXXTA9w1_r2Nck'),
                                  SizedBox(height: 30),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "CL: \/\\ represents the actions of one individual's legs or eyes. Non-manual signals are especially important when using the classifier to depict the eyes, because facial expressions distinguish between a dirty look, curiosity, and other meanings. CL: \/\\ should be used when describing the body as a whole, as in laying down. Use this classifier to show others walking, but not yourself- use the sign I walk.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/i%20love%20floating%20in%20the%20ocean.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2kgbG92ZSBmbG9hdGluZyBpbiB0aGUgb2NlYW4ud2VibSIsImlhdCI6MTc0NDY1NDk4NSwiZXhwIjoxNzc2MTkwOTg1fQ.yEIf0FrKfdgTikolomMo31OEmZ9v-k1Rq7l8aEvUF-8'),
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
                                          text: "I love floating in the ocean",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'CL: 3 Vehicles':
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
                                            text: "CL: 3 Vehicles",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Image.network(
                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/CL_3.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L0NMXzMucG5nIiwiaWF0IjoxNzQ0Njk3MjA1LCJleHAiOjE3NzYyMzMyMDV9.jHjjIB0hZcUvFcJLcUpTafm9pfAyoQikFDnEIHUtBPY'),
                                  SizedBox(height: 30),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "CL: 3 represents the actions of wheeled vehicles such as bicycles, cars, and motorcycles, after the vehicle has been identified. Manipulate the classifier to reflect important details including direction of travel and I or speed, and include facial expressions and other non-manual signals as needed. CL: 3 is an example of a classifier that is not iconic.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/the%20motorcycle%20went%20over%20a%20bumpy%20road.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3RoZSBtb3RvcmN5Y2xlIHdlbnQgb3ZlciBhIGJ1bXB5IHJvYWQud2VibSIsImlhdCI6MTc0NDY1NTE1MCwiZXhwIjoxNzc2MTkxMTUwfQ.C1i1SsWWwkcIPNQuFRwPre6trhBY8n8-ITDr_hNqBBg'),
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
                                              "The motorcycle went over a bumpy road",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'CL: 5 Many people':
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
                                            text: "CL: 5 Many people",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Image.network(
                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/CL_5.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L0NMXzUucG5nIiwiaWF0IjoxNzQ0NjgxNzQ0LCJleHAiOjE3NzYyMTc3NDR9.9I8eVgysfrh27mpDccZHupxfLq1OLCEh7NvUE_kgujM'),
                                  SizedBox(height: 30),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "CL: 5 is related to CL: 1 and represents at least five or more people engaged in an activity such as walking. The concept of CL: 5 is more people than can be easily counted unless you're talking about a certain group of five individuals. CL: 5 can be preceded by a number sign, as shown in the example.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/35%20people%20are%20going%20to%20the%20party.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4LzM1IHBlb3BsZSBhcmUgZ29pbmcgdG8gdGhlIHBhcnR5LndlYm0iLCJpYXQiOjE3NDQ2NTQ1ODYsImV4cCI6MTc3NjE5MDU4Nn0.w9l02L_PCBgkdgau1USSblbCTp4PaThm3XFAi5sKKhs'),
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
                                              "Thirty-five people are going to the party",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 45),
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
                                            text: "Related Vocabulary:",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/crowded.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2Nyb3dkZWQud2VibSIsImlhdCI6MTc0NDY1NDY4OCwiZXhwIjoxNzc2MTkwNjg4fQ.DIpwTpzT2CJ2ezkL05-rbIUCzw1U4Ofym_v3_P9Y0vc'),
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
                                          text: "Crowded",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/to%20flock%20to.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3RvIGZsb2NrIHRvLndlYm0iLCJpYXQiOjE3NDQ2NTUyMDQsImV4cCI6MTc3NjE5MTIwNH0.Z_fazLYiNuZbA5ICUSd33dEJd5X9B400zi8ecx6CFE4'),
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
                                          text: "Flock to",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/popular.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3BvcHVsYXIud2VibSIsImlhdCI6MTc0NDY1NTExOSwiZXhwIjoxNzc2MTkxMTE5fQ.4yrZ-PecfHV462vhG6R3KjYoCnq1Czyr2kEz29bmaC4'),
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
                                          text: "Popular",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'CL: Bent V Seated Position':
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
                                            text: "CL: Bent V Seated Position",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Image.network(
                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/CL_Bent%20v.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L0NMX0JlbnQgdi5wbmciLCJpYXQiOjE3NDQ2ODE3NjAsImV4cCI6MTc3NjIxNzc2MH0.PeS78P0fBHPL-TTroJo0y_07y4y84Hpis6qO2PlOCmo'),
                                  SizedBox(height: 30),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "CL: Bent V represents a pair of human legs in a seated position, animals, and insects. When using CL: Bent V it is essential to remember that the classifier doesn't distinguish between sizes of animals or insects. You will encounter animal signs in Unit 10.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/my%20dog%20tends%20to%20jump%20on%20people.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L215IGRvZyB0ZW5kcyB0byBqdW1wIG9uIHBlb3BsZS53ZWJtIiwiaWF0IjoxNzQ0NjU1MDk1LCJleHAiOjE3NzYxOTEwOTV9.8dvQiNhORRn4J5wO2Um66l-mMVv2HFe8p9cexynAFlE'),
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
                                              "My dog tends to jump on me. / My dog tends to jump on people",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'CL: B & Base B Flat Objects':
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
                                            text: "CL: B & Base B Flat Objects",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Image.network(
                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/CL_B.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L0NMX0IucG5nIiwiaWF0IjoxNzQ0NjgxNzIxLCJleHAiOjE3NzYyMTc3MjF9.gsnQJ6C235PacGotSX2MSS-fr9xgTWWlgeGeMzCO2B8'),
                                  SizedBox(height: 30),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "CL: B represents large, flat objects (see Page 193). When CL: B is used as a flat surface and another classifier placed on top, it becomes CL: Base B. In addition to flat objects, CL: B provides a bird's eye view of objects normally shown with CL: 3. Use CL: 3 when describing a vehicle in which you are not involved, but use CL: B if you were a passenger or driving the vehicle. ",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/i%20saw%20a%20bug%20crawling%20on%20the%20table.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2kgc2F3IGEgYnVnIGNyYXdsaW5nIG9uIHRoZSB0YWJsZS53ZWJtIiwiaWF0IjoxNzQ0NjU1MDM5LCJleHAiOjE3NzYxOTEwMzl9.NJrF7qqM5IF-CHs5LPLOEgc31JvlAIaaWcWI7x-2BEc'),
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
                                              "I saw a bug crawling on the table",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/i%20don't%20like%20driving%20on%20winding%20roads.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2kgZG9uJ3QgbGlrZSBkcml2aW5nIG9uIHdpbmRpbmcgcm9hZHMud2VibSIsImlhdCI6MTc0NDY1NDk2MywiZXhwIjoxNzc2MTkwOTYzfQ.Nukyds79MpRXyIi-EbLRU2xRRB9mLsl-Lpmjf7ZP7us"),
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
                                              "I don't like driving on winding roads",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: Classifiers ':
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
                                            text: "Vocabulary: Classifiers",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/bug.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2J1Zy53ZWJtIiwiaWF0IjoxNzQ0NjU0NjMwLCJleHAiOjE3NzYxOTA2MzB9.zCrsRJwq3f6vrSKMLVE9ursIrGbeVaV6vtPkR47WqTU'),
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
                                          text: "Bug/Ant",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/ears%20(animal).webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2VhcnMgKGFuaW1hbCkud2VibSIsImlhdCI6MTc0NDY1NDgyNiwiZXhwIjoxNzc2MTkwODI2fQ.622laU_HWs37KZPMeF8upDZkT-aNGlvjudw0kLJeik0'),
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
                                          text: "Ears (animal)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/to%20jump%20(animal).webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3RvIGp1bXAgKGFuaW1hbCkud2VibSIsImlhdCI6MTc0NDY1NTIyMiwiZXhwIjoxNzc2MTkxMjIyfQ.KQ7PvVIvBVpt6BKL71dMi0VnMlPhnEkXzUTdGCd1yes'),
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
                                          text: "Jump (animal)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/to%20sit%20next%20to.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3RvIHNpdCBuZXh0IHRvLndlYm0iLCJpYXQiOjE3NDQ2NTUyODEsImV4cCI6MTc3NjE5MTI4MX0.TEmGpbPbY21RaULQGV61HQBMTs3PJXFzMq3lCItZGfM'),
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
                                          text: "Sit next to",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/winding%20road.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3dpbmRpbmcgcm9hZC53ZWJtIiwiaWF0IjoxNzQ0NjU1MzE3LCJleHAiOjE3NzYxOTEzMTd9.o_zd7cXafmGZiapxYpnJVy_5uSPeK4XBSVV7-kolOqQ'),
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
                                          text: "Winding road",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'CL: C Cylindrical, hand-held objects':
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
                                                "CL: C Cylindrical, hand-held objects",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Image.network(
                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/CL_C.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L0NMX0MucG5nIiwiaWF0IjoxNzQ0NjgxNzkyLCJleHAiOjE3NzYyMTc3OTJ9.VFSmknKpS1QFnaitwgvY3ycZrIWpIlMORcKbcpEXL6Y'),
                                  SizedBox(height: 30),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "The CL: C classifier is used with cylindrical objects that fit into the handshape, as shown in the illustration.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/don't%20put%20the%20glass%20on%20the%20table.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2Rvbid0IHB1dCB0aGUgZ2xhc3Mgb24gdGhlIHRhYmxlLndlYm0iLCJpYXQiOjE3NDQ2NTQ4MTMsImV4cCI6MTc3NjE5MDgxM30.J-3EmklI6T9jorEuQbddkTL47X4TLHL7s8L8B_3uECw"),
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
                                              "Don’t put the glass on the table",
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
                                          text:
                                              "The concept of table, or any flat surface, is provided by CL: B. As you can see, there is no need for a separate sign for on since the two classifiers convey the meaning automatically. Because many signs and classifiers function as visual prepositions, ASL does not have many signs dedicated to that purpose.",
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
                                                "Vocabulary: Related Classifiers",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/cup.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2N1cC53ZWJtIiwiaWF0IjoxNzQ0NjU0NzUzLCJleHAiOjE3NzYxOTA3NTN9.wCSvKLyIRECdbgqjewosG1BO9kfOz_OmUi-K8vVeKD0"),
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
                                          text: "Cup/Glass",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/to%20drink.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3RvIGRyaW5rLndlYm0iLCJpYXQiOjE3NDQ2NTUxOTAsImV4cCI6MTc3NjE5MTE5MH0.qZEys8yI1SUoVjXaYERRsEKSnjpJdj8cXqHgMBtTAec"),
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
                                          text: "Drink",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/key.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L2tleS53ZWJtIiwiaWF0IjoxNzQ0NjU1MDY2LCJleHAiOjE3NzYxOTEwNjZ9.25p9Uty5f3OzKF_wUpdTg8-x1vPjc0Ovf3R_GFueEwI"),
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
                                          text: "Key",
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
                                              "Whew! That was longer than I thought. Shall we check what you learned?",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );

                            case 'Activity':
                              double progress = totalScore / 100;

                              int selectedAnswer1 = -1;
                              int selectedAnswer2 = -1;
                              int selectedAnswer4 = -1;
                              int selectedAnswer5 = -1;

                              int correctAnswer1 = 2;
                              int correctAnswer2 = 3;
                              int correctAnswer4 = 1;
                              int correctAnswer5 = 2;

                              bool isCorrect1 = false;

                              TextEditingController answerController1 =
                                  TextEditingController();

                              void checkAnswer1(StateSetter setState) async {
                                if (!answered1) {
                                  isCorrect1 = answerController1.text
                                          .trim()
                                          .toLowerCase() ==
                                      'classifier';

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
                                        "1. CL: 1 depicts up to seven individuals engaged in the same action simultaneously.",
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
                                        '2. What classifier was used in the video shown below?',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%207/Lesson%2028/the%20cafeteria%20is%20crowded.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDcvTGVzc29uIDI4L3RoZSBjYWZldGVyaWEgaXMgY3Jvd2RlZC53ZWJtIiwiaWF0IjoxNzQ0NjU1MTMxLCJleHAiOjE3NzYxOTExMzF9.1t6wNWOQz-rbD6bLuNhNT1uK4quQbp-ZJW2sHFEuE74",
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        // Changed Row to Column
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
                                              'CL: B',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // Space between buttons
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
                                              'CL: 3',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // Space between buttons
                                          ElevatedButton(
                                            onPressed: () => checkAnswer(2, 3),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(2, 3),
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                            ),
                                            child: Text(
                                              'CL: 5',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),

                                      Text(
                                        "3. What is a handshape that conveys details contributing to the overall concept of a sign, in addition to the sign's meaning?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
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
                                        "4. You can use CL: 3 when describing a vehicle in which you are not involved, but use CL: B if you were a passenger or driving the vehicle",
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
                                        "5. CL: \/\\ represents the actions of one individual's legs or _________.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
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
                                              'Hands',
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
                                              'Eyes',
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
                                              'Ears',
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
                if (currentIndex != 0 && currentIndex != 12)
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
                  onPressed: (currentIndex == 12)
                      ? () async {
                          
                          bool allQuestionsAnsweredQuiz = answeredQuestion1 &&
                              answeredQuestion2 &&
                              answered1 &&
                              answeredQuestion4 &&
                              answeredQuestion5;

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
                    (currentIndex == 12) ? 'Finish' : 'Next',
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
