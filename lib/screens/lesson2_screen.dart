import 'package:flutter/material.dart';
import 'package:mypod_flutter/widgets/video_player.dart';
// Import the video player widget

class Lesson2Screen extends StatefulWidget {
  const Lesson2Screen({super.key});

  @override
  State<Lesson2Screen> createState() => _Lesson2ScreenState();
}

class _Lesson2ScreenState extends State<Lesson2Screen> {
  int currentIndex = 0;
  int totalScore = 0;

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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Builder(
                      builder: (context) {
                        switch (section['title']) {
                          case 'Greetings':
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
                                            "Greetings are usually a part of a conversation. Let me introduce you to some of the basic signs that are helpful in a conversation.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/hi.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/hello.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/what_s.up.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/how.are.you.mp4',
                                ),
                                SizedBox(height: 15),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/how.are.you.ver.2.mp4',
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
                                        text: "as a response to 'How are you'.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/i_m.fine.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/good.morning.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/good.afternoon.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/good.evening.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/busy.mp4',
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
                                        text: "To be happy",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/sleepy.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/confused.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/nothing.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/so-so.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/fine.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/well.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/same.old.mp4',
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
                                      'https://github.com/Nesurii/try/releases/download/new/tired.mp4',
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
                                SizedBox(height: 335),
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

                            bool answeredQuestion1 = false;
                            bool answeredQuestion2 = false;
                            bool answeredQuestion3 = false;
                            bool answeredQuestion4 = false;
                            bool answeredQuestion5 = false;

                            double progress = totalScore /
                                1000; // Update progress with previous score

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
                                      '1. Which is the correct way to sign “Good evening”?',
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
                                                    'https://github.com/Nesurii/try/releases/download/new/good.evening.mp4',
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
                                                    'https://github.com/Nesurii/try/releases/download/new/good.afternoon.mp4',
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
                                            'Good afternoon',
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
                                            'Good morning',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 30),

                                    // Question 3
                                    Text(
                                      '3. “I’m fine” is another way of greeting.',
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
                                      '4. You are talking to your friend, how will you greet him?',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Column(
                                      children: [
                                        Container(
                                          color: getButtonColor(4, 1),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                checkAnswer(4, 1);
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              child: CustomVideoPlayer(
                                                videoUrl:
                                                    'https://github.com/Nesurii/try/releases/download/new/what_s.up.mp4',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          color: getButtonColor(4, 2),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                checkAnswer(4, 2);
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              child: CustomVideoPlayer(
                                                videoUrl:
                                                    'https://github.com/Nesurii/try/releases/download/new/how.are.you.mp4',
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
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Column(
                                      children: [
                                        Container(
                                          color: getButtonColor(5, 1),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                checkAnswer(5, 1);
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              child: CustomVideoPlayer(
                                                videoUrl:
                                                    'https://github.com/Nesurii/try/releases/download/new/same.old.mp4',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          color: getButtonColor(5, 2),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                checkAnswer(5, 2);
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              child: CustomVideoPlayer(
                                                videoUrl:
                                                    'https://github.com/Nesurii/try/releases/download/new/i_m.fine.mp4',
                                              ),
                                            ),
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
