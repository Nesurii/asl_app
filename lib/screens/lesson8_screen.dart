import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../services/completed_lessons_progress.dart';
import '../services/state_progress.dart';
import 'video_player_widget.dart';

class Lesson8Screen extends StatefulWidget {
final String lessonId;

  const Lesson8Screen({super.key, required this.lessonId});

  @override
  State<Lesson8Screen> createState() => _Lesson8ScreenState();
}

class _Lesson8ScreenState extends State<Lesson8Screen> {
  int currentIndex = 0;
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();
  final lessonManager = LessonManager();

  bool answeredQuestion1 = false;
  bool answeredQuestion2 = false;
  bool answeredQuestion4 = false;
  bool answeredQuestion5 = false;
  bool answered1 = false;
  bool lessonCompleted = false;

  final List<Map<String, dynamic>> lessonSections = [
    {
      'title': 'Deaf Culture Note: Labels and Identity',
    },
    {
      'title': 'Deafness',
    },
    {
      'title': 'The Two Perspectives on Deafness',
    },
    {
      'title': 'Hearing Impaired vs. Deaf',
    },
    {
      'title': 'Understanding Hard-of-Hearing and Deaf Culture',
    },
    {
      'title': 'Vocabulary',
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
          'Lesson 8 - ${section['title']}',
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
                            case 'Deaf Culture Note: Labels and Identity':
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
                                              "Before we start, how do we get the attention of a Deaf person? Here are ways to do that:",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text:
                                              "• You can use handwave\n• Shoulder tap\n• Tapping the table\n• Turn on and off the lights (only used when there is a crowd or in a room)",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );

                            case 'Deafness':
                              return Column(
                                children: [
                                  SizedBox(height: 10),
                                  Image.asset(
                                    'assets/images/International_Symbol_for _Deafness.png',
                                    width: 300,
                                    height: 300,
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
                                              "International Symbol of Deafness",
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
                                          text: "What is deafness?\n",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "The American Heritage Dictionary has two major definitions for the word deaf. One refers to the sense of hearing, and the other focuses on a group of people and their culture.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'The Two Perspectives on Deafness':
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
                                              "The first perspective is called the ",
                                        ),
                                        TextSpan(
                                          text:
                                              "pathological or medical model, ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "meaning the focus of attention is on the 'broken' ear that affects how much one hears or does not hear.\n\n",
                                        ),
                                        TextSpan(
                                          text:
                                              "The second perspective of the word deaf is the ",
                                        ),
                                        TextSpan(
                                          text: "cultural model, ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "deafness is not considered to be an overwhelming handicap or disability but instead is part of one's identity.\n\n",
                                        ),
                                        TextSpan(
                                          text: "Note: ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "Deaf is capitalized to distinguish those persons who are deaf and use American Sign Language from the medical model.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );

                            case 'Hearing Impaired vs. Deaf':
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
                                          text: "You may have seen the term ",
                                        ),
                                        TextSpan(
                                          text: "hearing impaired ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "on TV or other media referring to deafness. Many people in the Deaf community prefer to sign deaf instead of hearing-impaired due to the negative connotations of 'impaired' and 'broken.'",
                                        ),
                                        TextSpan(
                                          text:
                                              "\n\nStrangely, hearing people consider this term more polite than saying 'Deaf.' But the truth is, Deaf people are proud to be Deaf, and they prefer to be called Deaf!",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                ],
                              );
                            case 'Understanding Hard-of-Hearing and Deaf Culture':
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
                                          text: "Hard-of-hearing ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "are those individuals who have some degree of deafness and can use a spoken language, though hearing and speech skills vary from person to person.\n\n",
                                        ),
                                        TextSpan(
                                          text:
                                              "Deaf people form a cultural and linguistic minority whose language and experiences are unique, when a group of people who share a language come together to offer mutual support in pursuit of common goals and interests, a ",
                                        ),
                                        TextSpan(
                                          text: "community ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: "is formed.\n\n",
                                        ),
                                        TextSpan(
                                          text: "Deaf culture ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              "is the shared experience of deaf people that has its own values, social norms (ways of doing things), a unique history, and a rich tradition of storytelling and poetry passed from generation to generation.",
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
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Check this vocabulary:",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%208/deaf%20ver.%201.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDgvZGVhZiB2ZXIuIDEud2VibSIsImlhdCI6MTc0Mzg2MDIzMSwiZXhwIjoxNzc1Mzk2MjMxfQ.Xh-Z_J9EftpKlQ3TBE4WMaD46fM0_0rAcwQsJugQt2E'),
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
                                          text: "Deaf",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%208/hearing.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDgvaGVhcmluZy53ZWJtIiwiaWF0IjoxNzQzODYwMjQyLCJleHAiOjE3NzUzOTYyNDJ9.h-gAw4JNaq-Yj4SkksgJh8-Flc0QgkOtSacje-fp9nE'),
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
                                          text: "Hearing",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%208/are%20you%20deaf.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDgvYXJlIHlvdSBkZWFmLndlYm0iLCJpYXQiOjE3NDM4NjAxNDEsImV4cCI6MTc3NTM5NjE0MX0.tOunmP0lvtK0qxfIoDESrtKa7vC-H-sKRj7QGQ9j5wY'),
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
                                          text: "Are you deaf?",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%208/are%20you%20hearing.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDgvYXJlIHlvdSBoZWFyaW5nLndlYm0iLCJpYXQiOjE3NDM4NjAyMjEsImV4cCI6MTc3NTM5NjIyMX0.8jgCzex0ufvs8JEuJJEa21Jf5_tml1Av-7vxGNqtwxY'),
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
                                          text: "Are you hearing?",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%208/yes,%20i_m%20deaf.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDgveWVzLCBpX20gZGVhZi53ZWJtIiwiaWF0IjoxNzQzODYwMjY1LCJleHAiOjE3NzUzOTYyNjV9.ApGJyQJXbS7NmfcXWR0xhi9CH2tlXPKx3cXwPrOHpz0'),
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
                                          text: "Yes, I am deaf.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%208/no,%20i_m%20not%20deaf.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDgvbm8sIGlfbSBub3QgZGVhZi53ZWJtIiwiaWF0IjoxNzQzODYwMjYwLCJleHAiOjE3NzUzOTYyNjB9.TiYnNtmnbzd5WIBxOOC6Y8rq-no7XSX2FKUQcMYbydI'),
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
                                          text: "No, I am not deaf.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomVideoPlayer(
                                      videoUrl:
                                          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Lesson%208/no,%20i_m%20hearing.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvTGVzc29uIDgvbm8sIGlfbSBoZWFyaW5nLndlYm0iLCJpYXQiOjE3NDM4NjAyNTMsImV4cCI6MTc3NTM5NjI1M30.NU182QaVo4u0blg_QWILpEAzGJhjykZOVmIdyzhq9RU'),
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
                                          text: "No, I am not hearing.",
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
                                              "Great job! That’s a wrap for this lesson. Let’s put your learning to the test!",
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
                              int correctAnswer2 = 2;
                              int correctAnswer4 = 1;
                              int correctAnswer5 = 1;

                              bool isCorrect1 = false;

                              TextEditingController answerController1 =
                                  TextEditingController();

                              void checkAnswer1(StateSetter setState) async {
                                if (!answered1) {
                                  // Check answer (case-insensitive, trimmed)
                                  isCorrect1 = answerController1.text
                                          .trim()
                                          .toLowerCase() ==
                                      'deaf';

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
                                        '1. The people in the deaf community prefer to be called hearing impaired.',
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
                                        '2. The American Heritage Dictionary has only one major definition for the word deaf, which refers to a disability in the sense of hearing.',
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
                                        '3. What do people in the deaf community prefer to be called?',
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
                                      SizedBox(height: 30),

                                      // Question 4
                                      Text(
                                        "4. The hearing people consider this term more polite than saying 'Deaf.'",
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
                                              'Hearing-impaired',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // Space between buttons
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
                                              'Deaf Culture',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // Space between buttons
                                          ElevatedButton(
                                            onPressed: () => checkAnswer(4, 3),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  getButtonColor(4, 3),
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                            ),
                                            child: Text(
                                              'Deaf',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),
                                      // Question
                                      Text(
                                        '5. Deaf is capitalized to distinguish those persons who are deaf and use American Sign Language from the medical model.',
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
