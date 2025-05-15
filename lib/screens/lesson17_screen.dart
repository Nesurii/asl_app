import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../services/completed_lessons_progress.dart';
import '../services/state_progress.dart';
import 'video_player_widget.dart';

class Lesson17Screen extends StatefulWidget {
final String lessonId;

  const Lesson17Screen({super.key, required this.lessonId});

  @override
  State<Lesson17Screen> createState() => _Lesson17ScreenState();
}

class _Lesson17ScreenState extends State<Lesson17Screen> {
  int currentIndex = 0;
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();
  final lessonManager = LessonManager();

  bool answeredQuestion1 = false;
  bool answeredQuestion3 = false;
  bool answeredQuestion5 = false;
  bool answered1 = false;
  bool answered2 = false;
  bool lessonCompleted = false;

  final List<Map<String, dynamic>> lessonSections = [
    {
      'title': 'Signing about Time',
    },
    {
      'title': 'Clock Hands',
    },
    {
      'title': 'Time Signs',
    },
    {
      'title': 'Vocabulary: Time',
    },
    {
      'title': 'Vocabulary: Time ',
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
          'Lesson 17 - ${section['title']}',
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
                            case 'Signing about Time':
                              return Column(
                                children: [
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text: "Signing time combines the ",
                                        ),
                                        TextSpan(
                                          text: "Time Spot ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "with a number sign to communicate the hour or a number sign paired with the minute sign.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/time%20spot.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3RpbWUgc3BvdC53ZWJtIiwiaWF0IjoxNzQ0MjI5Njc3LCJleHAiOjE3NzU3NjU2Nzd9.InYrKEklX9oW49D97-d2l_hAjRXmDP0fptz7QbKn6jw'),
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
                                          text: "The Time Spot ",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
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
                                              "The area where most people wear a watch is known as the Time Spot, and it is used to sign time in ASL. Hold your non-dominant hand to create a base for the number sign made by your dominant hand, with the number sign touching the Time Spot.",
                                        ),
                                        TextSpan(
                                          text: "\n\nNote:\n",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: "Time signs ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: "are also ",
                                        ),
                                        TextSpan(
                                          text: "When signs, ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "so they come first in a sentence. All time signs face outward, including numbers 1-5.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Clock Hands':
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
                                          text: "Clock Hands",
                                        ),
                                      ],
                                    ),
                                  ),
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
                                              "You will use your palm from the non-dominant hand to sign seconds, minutes, and hours.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/seconds.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3NlY29uZHMud2VibSIsImlhdCI6MTc0NDIyOTcwMCwiZXhwIjoxNzc1NzY1NzAwfQ.dAV506HwalaM9aRNMSexzQHS7pYrFSBx3H39oJkO6LY'),
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
                                          text: "Seconds",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/minutes.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L21pbnV0ZXMud2VibSIsImlhdCI6MTc0NDIyOTczMCwiZXhwIjoxNzc1NzY1NzMwfQ.qkw8xknsazRKQos6hOZLgZxzvFqbuP11Cif_6NgbQY8'),
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
                                          text: "Minutes",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/hours.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L2hvdXJzLndlYm0iLCJpYXQiOjE3NDQyMjk3NDcsImV4cCI6MTc3NTc2NTc0N30.-6BNg-wLWMtmvGLCaPdZ3yaiRS9tlgoF_ymjmmODgJc'),
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
                                          text: "Hours",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/3%20seconds.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3LzMgc2Vjb25kcy53ZWJtIiwiaWF0IjoxNzQ0MjI5ODU3LCJleHAiOjE3NzU3NjU4NTd9.q-805yzyuCBnxBVgFMdbsrUSNslM8QdyRSeYxyzg0Ck'),
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
                                          text: "3 seconds",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/3%20minutes.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3LzMgbWludXRlcy53ZWJtIiwiaWF0IjoxNzQ0MjI5ODY0LCJleHAiOjE3NzU3NjU4NjR9.g6U1oQdB08B8M-qsnOndR8ie31ex-W-g7HqkR-01q0c'),
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
                                          text: "3 minutes",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/3%20hours.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3LzMgaG91cnMud2VibSIsImlhdCI6MTc0NDIyOTg3MywiZXhwIjoxNzc1NzY1ODczfQ.-MIjSg4mYAfSX7le4bVGMEZSrbFn5hfaK8YWXY1UKsI'),
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
                                          text: "3 hours",
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
                                          text: "Note: ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "Do not confuse seconds with minutes. Although they may look the same, minutes is spread wider when pointing. Both of them resemble how seconds and minutes strike the clock.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Time Signs':
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
                                          text: "Time Signs",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/1_30.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3LzFfMzAud2VibSIsImlhdCI6MTc0NDI4MjQxNCwiZXhwIjoxNzc1ODE4NDE0fQ.ffsk9h2y0EtnHT5zBOzuJSnYH5FKl3aN8vhR2_oR8mQ'),
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
                                          text: "1:30",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/7_15.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3LzdfMTUud2VibSIsImlhdCI6MTc0NDI4Mjc0MCwiZXhwIjoxNzc1ODE4NzQwfQ.2ZnU4_vgSenk1PuSgv_W251lii_FNyFoy-tOAPFuqLQ'),
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
                                          text: "7:15",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/5_45.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3LzVfNDUud2VibSIsImlhdCI6MTc0NDI4MjcyNywiZXhwIjoxNzc1ODE4NzI3fQ.8Ycl17VTH4PIrEgnCJWcpenGyHzWyyxDEQ81YtY1mvA'),
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
                                          text: "5:45",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/9_30.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3LzlfMzAud2VibSIsImlhdCI6MTc0NDI4Mjc4NSwiZXhwIjoxNzc1ODE4Nzg1fQ.VkPvNKIP7T0eJKiQXDIycS_9PcVM5aS2jT7tAfsh5uk'),
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
                                          text: "9:30",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 35),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "The same format will be followed for all time signs.",
                                        ),
                                        TextSpan(
                                          text: "\n\n\nNote: ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "If am and pm are indicated you can just use the sign for morning as am and afternoon as pm.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: Time':
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
                                              "Let’s get you familiarized with vocabulary related to time.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/around.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L2Fyb3VuZC53ZWJtIiwiaWF0IjoxNzQ0MjI5NzgxLCJleHAiOjE3NzU3NjU3ODF9.CK4FS8Pci15WGnTVFNIw5788fbSScH1xb0s1rYCRM_w"),
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
                                          text: "Around (time)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/noon.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L25vb24ud2VibSIsImlhdCI6MTc0NDIyOTcxMywiZXhwIjoxNzc1NzY1NzEzfQ.RQ_nXDuixpO1SIK42-U3yEzb5tsWgCj8L_iBPgR4Wyw"),
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
                                          text: "Noon",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/hours.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L2hvdXJzLndlYm0iLCJpYXQiOjE3NDQyMjk3NDcsImV4cCI6MTc3NTc2NTc0N30.-6BNg-wLWMtmvGLCaPdZ3yaiRS9tlgoF_ymjmmODgJc"),
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
                                          text: "Hour",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/midnight.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L21pZG5pZ2h0LndlYm0iLCJpYXQiOjE3NDQyMjk3MzksImV4cCI6MTc3NTc2NTczOX0.6ETg3hRDeur-7tGNyoePS4BtUzEoDoYzxq4XcTUwYA4"),
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
                                          text: "Midnight",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/time.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3RpbWUud2VibSIsImlhdCI6MTc0NDIyOTY2OSwiZXhwIjoxNzc1NzY1NjY5fQ.syXdiw1Z6kwQwDfgAMjgoTvMb6qEmMXfrSdmoG-7eeQ"),
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
                                          text: "Time",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/what%20time%20is%20it.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3doYXQgdGltZSBpcyBpdC53ZWJtIiwiaWF0IjoxNzQ0MjI5NTc1LCJleHAiOjE3NzU3NjU1NzV9.P-7R7v8ZV0bIWpQkxzRLPea1Kk24BnVDXu2-QC2cnic"),
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
                                          text: "What time is it?",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/alarm.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L2FsYXJtLndlYm0iLCJpYXQiOjE3NDQyMjk4MTgsImV4cCI6MTc3NTc2NTgxOH0.xiYZVWpzhvOrDmWYBxMQS9OCS7bSkt96Xr_wK-jIZ5E"),
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
                                          text: "Alarm/Bell ",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/to%20arrive%20(person).webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3RvIGFycml2ZSAocGVyc29uKS53ZWJtIiwiaWF0IjoxNzQ0MjI5NjUyLCJleHAiOjE3NzU3NjU2NTJ9.9pSyBqkt_9pZtKXITCBpPbHeczujdLB1Jo5ItMdGZe8"),
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
                                          text: "Arrive (person)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/to%20arrive%20(plane).webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3RvIGFycml2ZSAocGxhbmUpLndlYm0iLCJpYXQiOjE3NDQyMjk2NDUsImV4cCI6MTc3NTc2NTY0NX0.HihgB1IUiPQsNTxqgVYuPxghByxy7yypJGJ5ed5CpWI"),
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
                                          text: "Arrive (plane)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/to%20depart%20(plane).webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3RvIGRlcGFydCAocGxhbmUpLndlYm0iLCJpYXQiOjE3NDQyMjk2MTksImV4cCI6MTc3NTc2NTYxOX0.Lkzs3WAOLye4reFaqQ93RVvGVn2O3Bt2x6x7m9mIxA8"),
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
                                          text: "Depart (plane)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Vocabulary: Time ':
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/begin.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L2JlZ2luLndlYm0iLCJpYXQiOjE3NDQyMjk3NzIsImV4cCI6MTc3NTc2NTc3Mn0.-KUQRLLoWfozUZWM-3FXsnms1QhHnv63botc3rsbW20"),
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
                                          text: "Start/Begin",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/to%20take%20off(person).webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3RvIHRha2Ugb2ZmKHBlcnNvbikud2VibSIsImlhdCI6MTc0NDIyOTU5MywiZXhwIjoxNzc1NzY1NTkzfQ.ZzhY9zYikkDpXDPBJ05tQkhLgCM8DrptZL7V9OLxChw"),
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
                                          text: "Take off (person)",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/to%20finish.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3RvIGZpbmlzaC53ZWJtIiwiaWF0IjoxNzQ0MjI5NjExLCJleHAiOjE3NzU3NjU2MTF9.Js_kjb6URv1eKzPdQJVgrHBHA5uggiHSzcl8OHll4iA"),
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
                                          text: "Finish/Done",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/to%20be%20late.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3RvIGJlIGxhdGUud2VibSIsImlhdCI6MTc0NDIyOTYzMCwiZXhwIjoxNzc1NzY1NjMwfQ.-zqMJedSi0-MQWeVLovD3O4zgwjoKXTVtZMqKYz4lOw"),
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
                                          text: "Late",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/train.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3RyYWluLndlYm0iLCJpYXQiOjE3NDQyMjk1ODQsImV4cCI6MTc3NTc2NTU4NH0.soRcPdk5nB_UYx3JMwE2ndXjsBUzuCNy2r0uaZ7Vncg"),
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
                                          text: "Train",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/never.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L25ldmVyLndlYm0iLCJpYXQiOjE3NDQyMjk3MjAsImV4cCI6MTc3NTc2NTcyMH0.2MV6GsNNMs1L9qI7rDy9QD6fbmu522H6k0CRdsHPxFY"),
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
                                          text: "Never",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/sometimes.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3NvbWV0aW1lcy53ZWJtIiwiaWF0IjoxNzQ0MjI5Njg0LCJleHAiOjE3NzU3NjU2ODR9.FnlI4RHZAKAW5Im_cOrHn3nNm-6exZqCT6C_hHSXQpg"),
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
                                          text: "Sometimes",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/every%20once%20in%20a%20while.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L2V2ZXJ5IG9uY2UgaW4gYSB3aGlsZS53ZWJtIiwiaWF0IjoxNzQ0MjI5NzU2LCJleHAiOjE3NzU3NjU3NTZ9.J0BE8i4aMOaYe8338xB7csYiUtABExMsW3Z_9VVub7A"),
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
                                          text: "Every once in a while",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/always.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L2Fsd2F5cy53ZWJtIiwiaWF0IjoxNzQ0MjI5ODEwLCJleHAiOjE3NzU3NjU4MTB9.SpUOj-HpHoyOi4Rr1C9Wgrypnf56vVDJ_zZlLXYveNI"),
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
                                          text: "Always",
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
                                              "Yay! You’ve completed this lesson. Let’s test your knowledge!",
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
                              int correctAnswer5 = 3;

                              bool isCorrect1 = false;
                              bool isCorrect2 = false;

                              TextEditingController answerController1 =
                                  TextEditingController();
                              TextEditingController answerController2 =
                                  TextEditingController();

                              List<String> correctAnswers1 = [
                                '2:00',
                                '2 o\'clock'
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
                                  // Check answer (case-insensitive, trimmed)
                                  isCorrect2 = answerController2.text
                                          .trim()
                                          .toLowerCase() ==
                                      'what time is it?';

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
                                        '1. Time signs are also When signs so they come first in a sentence.',
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
                                        '2. What time is being signed in the video below?',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/2_00.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3LzJfMDAud2VibSIsImlhdCI6MTc0NDI4MjY2OSwiZXhwIjoxNzc1ODE4NjY5fQ.s_nOl2_3NtYWnW1UuABDI8pdSDEZEvxsLItjY4ef49k',
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
                                        '3. Time spot is using your palm from the non-dominant hand to sign seconds, minutes, and hours.',
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
                                        "4. What is being signed in the video below?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      CustomVideoPlayer(
                                        videoUrl:
                                            'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/what%20time%20is%20it.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L3doYXQgdGltZSBpcyBpdC53ZWJtIiwiaWF0IjoxNzQ0MjI5NTc1LCJleHAiOjE3NzU3NjU1NzV9.P-7R7v8ZV0bIWpQkxzRLPea1Kk24BnVDXu2-QC2cnic',
                                      ),
                                      SizedBox(height: 10),
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
                                        '5. Which of the following is the sign for “3 minutes”?',
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
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/hours.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3L2hvdXJzLndlYm0iLCJpYXQiOjE3NDQyMjk3NDcsImV4cCI6MTc3NTc2NTc0N30.-6BNg-wLWMtmvGLCaPdZ3yaiRS9tlgoF_ymjmmODgJc',
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
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/3%20seconds.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3LzMgc2Vjb25kcy53ZWJtIiwiaWF0IjoxNzQ0MjI5ODU3LCJleHAiOjE3NzU3NjU4NTd9.q-805yzyuCBnxBVgFMdbsrUSNslM8QdyRSeYxyzg0Ck',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: getButtonColor(5,
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
                                                  checkAnswer(5, 3);
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: CustomVideoPlayer(
                                                  videoUrl:
                                                      'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%205/Lesson%2017/3%20minutes.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDUvTGVzc29uIDE3LzMgbWludXRlcy53ZWJtIiwiaWF0IjoxNzQ0MjI5ODY0LCJleHAiOjE3NzU3NjU4NjR9.g6U1oQdB08B8M-qsnOndR8ie31ex-W-g7HqkR-01q0c',
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
                              answered1 &&
                              answeredQuestion3 &&
                              answered2 &&
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
