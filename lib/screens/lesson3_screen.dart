import 'package:flutter/material.dart';
import 'package:mypod_flutter/widgets/video_player.dart';
// Import the video player widget

class Lesson3Screen extends StatefulWidget {
  const Lesson3Screen({super.key});

  @override
  State<Lesson3Screen> createState() => _Lesson3ScreenState();
}

class _Lesson3ScreenState extends State<Lesson3Screen> {
  int currentIndex = 0;
  int totalScore = 0;

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

  void nextSection() {
    if (currentIndex < lessonSections.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void previousSection() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
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
                                      'https://github.com/Nesurii/try/releases/download/new/Goodbye.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/take.care.mp4',
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
                                SizedBox(height: 55),
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
                                      'https://github.com/Nesurii/try/releases/download/new/i_m.happy.to.meet.you.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/See.you.tomorrow.ver.1.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/Goodbye.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/later.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/me.too.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/see.you.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/see.you.later.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/tomorrow.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/me.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/you.are.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/he.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/us.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/You.are.plural.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/they.are.mp4',
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
                                SizedBox(height: 330),
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

                            bool answeredQuestion1 = false;
                            bool answeredQuestion2 = false;
                            bool answeredQuestion3 = false;
                            bool answeredQuestion4 = false;
                            bool answeredQuestion5 = false;

                            double progress = totalScore / 1000;

                            return StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
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

                                void checkAnswer(
                                    int questionNumber, int selectedAnswer) {
                                  if (questionNumber == 1 &&
                                      !answeredQuestion1) {
                                    selectedAnswer1 = selectedAnswer;
                                    if (selectedAnswer1 == correctAnswer1) {
                                      totalScore += 10;
                                    }
                                    answeredQuestion1 = true;
                                  } else if (questionNumber == 2 &&
                                      !answeredQuestion2) {
                                    selectedAnswer2 = selectedAnswer;
                                    if (selectedAnswer2 == correctAnswer2) {
                                      totalScore += 10;
                                    }
                                    answeredQuestion2 = true;
                                  } else if (questionNumber == 3 &&
                                      !answeredQuestion3) {
                                    selectedAnswer3 = selectedAnswer;
                                    if (selectedAnswer3 == correctAnswer3) {
                                      totalScore += 10;
                                    }
                                    answeredQuestion3 = true;
                                  } else if (questionNumber == 4 &&
                                      !answeredQuestion4) {
                                    selectedAnswer4 = selectedAnswer;
                                    if (selectedAnswer4 == correctAnswer4) {
                                      totalScore += 10;
                                    }
                                    answeredQuestion4 = true;
                                  } else if (questionNumber == 5 &&
                                      !answeredQuestion5) {
                                    selectedAnswer5 = selectedAnswer;
                                    if (selectedAnswer5 == correctAnswer5) {
                                      totalScore += 10;
                                    }
                                    answeredQuestion5 = true;
                                  }

                                  progress = totalScore / 1000;
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
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Column(
                                      children: [
                                        Container(
                                          color: getButtonColor(1, 1),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                checkAnswer(1, 1);
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              child: CustomVideoPlayer(
                                                videoUrl:
                                                    'https://github.com/Nesurii/try/releases/download/new/see.you.later.mp4',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          color: getButtonColor(1, 2),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                checkAnswer(1, 2);
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              child: CustomVideoPlayer(
                                                videoUrl:
                                                    'https://github.com/Nesurii/try/releases/download/new/take.care.mp4',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30),

                                    // Question 2
                                    Text(
                                      '2.What does the sign below mean?',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    CustomVideoPlayer(
                                        videoUrl:
                                            'https://github.com/Nesurii/try/releases/download/new/See.you.tomorrow.ver.1.mp4'),
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
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'See you later',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ElevatedButton(
                                          onPressed: () => checkAnswer(2, 2),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                getButtonColor(2, 2),
                                            side: BorderSide(
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'See you tomorrow',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 30),

                                    // Question 3
                                    Text(
                                      '3. “Take care” is another way of greeting.',
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
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'True',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ElevatedButton(
                                          onPressed: () => checkAnswer(3, 2),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                getButtonColor(3, 2),
                                            side: BorderSide(
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'False',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 30),

                                    // Question 4
                                    Text(
                                      '4. What is being signed in the video below?',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    CustomVideoPlayer(
                                        videoUrl:
                                            'https://github.com/Nesurii/try/releases/download/new/good.morning.mp4'),
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
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'Goodbye',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ElevatedButton(
                                          onPressed: () => checkAnswer(4, 2),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                getButtonColor(4, 2),
                                            side: BorderSide(
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'See you',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 30),

                                    // Question 5
                                    Text(
                                      '5. Pointing using the index finger is called Deixis.',
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
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'True',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ElevatedButton(
                                          onPressed: () => checkAnswer(5, 2),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                getButtonColor(5, 2),
                                            side: BorderSide(
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'False',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: previousSection,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  child:
                      Text('Previous', style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: (currentIndex == 5)
                      ? () =>
                          Navigator.pop(context) // Pop the screen on last page
                      : nextSection,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    side: BorderSide(color: Colors.black, width: 1),
                  ), // Otherwise, go to next section
                  child: Text(
                    (currentIndex == 5) ? 'Finish' : 'Next',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
