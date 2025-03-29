import 'package:flutter/material.dart';

class Lesson1Screen extends StatefulWidget {
  const Lesson1Screen({super.key});

  @override
  State<Lesson1Screen> createState() => _Lesson1ScreenState();
}

class _Lesson1ScreenState extends State<Lesson1Screen> {
  int currentIndex = 0;
  int totalScore = 0;

  final Map<int, bool> _isZoomed = {};

  final List<Map<String, dynamic>> lessonSections = [
    {
      'title': 'Introduction',
    },
    {
      'title': 'Sign Space',
      'image':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/ASL%20Sign%20Space.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0FTTCBTaWduIFNwYWNlLnBuZyIsImlhdCI6MTc0MjQ1MzUzNSwiZXhwIjoxOTAwMTMzNTM1fQ.aTDiOOmJYA9nYr30nMAgmr7f5fI47Mi_KjTyXbudrEM' // Replace with your Supabase image URL
    },
    {
      'title': 'Alphabet Overview',
    },
    {
      'title': 'Vowels',
      'content': "These are the 5 Vowels:",
      'images': [
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/A.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/E.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/I.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/O_sideview.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/U.jpg',
      ],
    },
    {
      'title': 'Consonants',
      'content': "These are the 21 Consonants:",
      'images': [
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/B.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/C.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/D.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/F.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/G.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/H.jpg',
        'https://github.com/Nesurii/try/releases/download/alphabet/J-gif.1.gif',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/K.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/L.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/M.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/N.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/P_sideview.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/Q_sideview.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/R.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/S.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/T.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/V.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/W.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/X.jpg',
        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/Y.jpg',
        'https://github.com/Nesurii/try/releases/download/alphabet/Z-gif.1.gif',
      ]
    },
    {
      'title': 'Dynamic and Static Signs',
    },
    {
      'title': 'Lesson Completed!',
      'content':
          "Awesome! You've made it to the end of this lesson. Let's see how much you've learned!",
    },
    {
      'title': 'Activity 1',
    },
    {
      'title': 'Activity 2',
    },
  ];

  void nextPage() {
    if (currentIndex < lessonSections.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void previousPage() {
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
          'Lesson 1 - ${section['title']}',
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
                  child: Column(children: [
                    Builder(
                      builder: (context) {
                        switch (section['title']) {
                          case 'Introduction':
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
                                            "You are new to American Sign Language right? You’re probably wondering which hand to use.\nTo answer your question, it depends on which is your dominant hand.\nThe dominant hand is the hand that feels most comfortable and natural for you, which tends to be the hand with which you write.",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );

                          case 'Sign Space':
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
                                            "Before we begin with the alphabet, let me introduce you to the Sign Space.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Image.network(
                                  section['image'],
                                  width: 300,
                                  height: 300,
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
                                            "This refers to the area in which most signs are made in normal conversation, usually centered to the right or left of your middle torso.",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );

                          case 'Alphabet Overview':
                            return Column(
                              children: [
                                SizedBox(height: 20),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "Now that it is cleared, let’s start with the Alphabet. Like the regular alphabet, ASL also contains 5 vowels and 21 consonants. Among these letters, there are 2 that are considered ", // Regular text
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "dynamic ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "and the 24 others are ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "static.\n\n\n",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "Dynamic signs include movement or motion when signing. Static signs, on the other hand, stay in place without movement.", // Regular text
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            );

                          case 'Vowels':
                            return Column(
                              children: [
                                Text(
                                  section['content'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(height: 20),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 20,
                                  runSpacing: 20,
                                  children: [
                                    for (int i = 0;
                                        i < section['images'].length;
                                        i++)
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _isZoomed[i] = !(_isZoomed[i] ??
                                                    false); // Toggle zoom state for specific image
                                              });
                                            },
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 100),
                                              width: _isZoomed[i] == true
                                                  ? 200
                                                  : 80,
                                              height: _isZoomed[i] == true
                                                  ? 200
                                                  : 80,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Image.network(
                                                section['images'][i],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            ['A', 'E', 'I', 'O', 'U'][i],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ],
                            );

                          case 'Consonants':
                            final consonants = [
                              'B',
                              'C',
                              'D',
                              'F',
                              'G',
                              'H',
                              'J',
                              'K',
                              'L',
                              'M',
                              'N',
                              'P',
                              'Q',
                              'R',
                              'S',
                              'T',
                              'V',
                              'W',
                              'X',
                              'Y',
                              'Z'
                            ];

                            return Column(
                              children: [
                                SizedBox(height: 15),
                                Text(
                                  section['content'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(height: 20),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 20,
                                  runSpacing: 20,
                                  children: [
                                    for (int i = 0;
                                        i < section['images'].length;
                                        i++)
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _isZoomed[i] =
                                                    !(_isZoomed[i] ?? false);
                                              });
                                            },
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 100),
                                              width: _isZoomed[i] == true
                                                  ? 200
                                                  : 80,
                                              height: _isZoomed[i] == true
                                                  ? 200
                                                  : 80,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Image.network(
                                                section['images'][i],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            consonants[
                                                i], // Correctly mapping the label to each image
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ],
                            );

                          case 'Dynamic and Static Signs':
                            return Column(
                              children: [
                                SizedBox(height: 20),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "J and Z are dynamic because the sign has a movement. All other letters are static since they stay in place and there is no movement involved.\n\n", // Regular text
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "The signing for letters is called ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Fingerspelling.\n\n",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Note: ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "Remember that this is only used to spell out names and sign letters or specific words.", // Regular text
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            );
                          case 'Lesson Completed!':
                            return Column(
                              children: [
                                Text(
                                  section['content'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          case 'Activity 1':
                            int selectedAnswer1 = -1;
                            int selectedAnswer2 = -1;
                            int selectedAnswer3 = -1;

                            int correctAnswer1 = 1; // Static ang tamang sagot
                            int correctAnswer2 = 3; // Z ang tamang sagot
                            int correctAnswer3 = 2; // M ang tamang sagot

                            bool answeredQuestion1 = false;
                            bool answeredQuestion2 = false;
                            bool answeredQuestion3 = false;

                            double progress = 0.0;
                            int maxPoints = 1000; // Maximum score possible

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
                                      progress = totalScore /
                                          maxPoints; // Update progress bar calculation
                                    }
                                    answeredQuestion1 = true;
                                  } else if (questionNumber == 2 &&
                                      !answeredQuestion2) {
                                    selectedAnswer2 = selectedAnswer;
                                    if (selectedAnswer2 == correctAnswer2) {
                                      totalScore += 10;
                                      progress = totalScore / maxPoints;
                                    }
                                    answeredQuestion2 = true;
                                  } else if (questionNumber == 3 &&
                                      !answeredQuestion3) {
                                    selectedAnswer3 = selectedAnswer;
                                    if (selectedAnswer3 == correctAnswer3) {
                                      totalScore += 10;
                                      progress = totalScore / maxPoints;
                                    }
                                    answeredQuestion3 = true;
                                  }
                                  setState(() {});
                                }

                                return Column(
                                  children: [
                                    // Progress Bar
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          LinearProgressIndicator(
                                            value: progress.clamp(0.0,
                                                1.0), // Ensures it stays between 0 and 1
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
                                        '1. Identify if the letter is static or dynamic',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.network(
                                        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/N.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 15),
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
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'Static',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ElevatedButton(
                                          onPressed: () => checkAnswer(1, 2),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                getButtonColor(1, 2),
                                            side: BorderSide(
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'Dynamic',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),

                                    // Question 2
                                    Text(
                                        '2. What letter is shown in the image below?',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.network(
                                        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/dynamic_signs/Z-gif.gif',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 15),
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
                                            'J',
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
                                            'M',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ElevatedButton(
                                          onPressed: () => checkAnswer(2, 3),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                getButtonColor(2, 3),
                                            side: BorderSide(
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'Z',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),

                                    // Question 3
                                    Text(
                                        '3. What letter is shown in the image below?',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.network(
                                        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/M.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 15),
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
                                            'J',
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
                                            'M',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ElevatedButton(
                                          onPressed: () => checkAnswer(3, 3),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                getButtonColor(3, 3),
                                            side: BorderSide(
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'Z',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 40),
                                  ],
                                );
                              },
                            );
                          case 'Activity 2':
                            double progress =
                                totalScore / 1000; // Update progress

                            bool answered1 = false;
                            bool answered2 = false;
                            bool isCorrect1 = false;
                            bool isCorrect2 = false;

                            TextEditingController answerController1 =
                                TextEditingController();
                            TextEditingController answerController2 =
                                TextEditingController();

                            void checkAnswer1(StateSetter setState) {
                              if (!answered1) {
                                isCorrect1 = answerController1.text
                                        .trim()
                                        .toLowerCase() ==
                                    'y';

                                if (isCorrect1) {
                                  totalScore +=
                                      10; // Add 10 points if the answer is correct
                                  progress =
                                      totalScore / 1000; // Update progress bar
                                }

                                answered1 = true;
                                setState(() {}); // Update UI
                              }
                            }

                            void checkAnswer2(StateSetter setState) {
                              if (!answered2) {
                                isCorrect2 = answerController2.text
                                        .trim()
                                        .toLowerCase() ==
                                    'd';

                                if (isCorrect2) {
                                  totalScore +=
                                      10; // Add 10 points if the answer is correct
                                  progress =
                                      totalScore / 1000; // Update progress bar
                                }

                                answered2 = true;
                                setState(() {}); // Update UI
                              }
                            }

                            return StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return Column(
                                  children: [
                                    // Progress Bar
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          LinearProgressIndicator(
                                            value: progress.clamp(0.0,
                                                1.0), // Keeps it within 0 and 1
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
                                      'Fill in the blanks:',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'This is letter ____.',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.network(
                                        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/Y.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      width: 250,
                                      child: TextField(
                                        controller: answerController1,
                                        enabled: !answered1,
                                        decoration: InputDecoration(
                                          hintText: 'Enter your answer here',
                                          border: OutlineInputBorder(),
                                          suffixIcon: IconButton(
                                            icon: Icon(Icons.send,
                                                color: answered1
                                                    ? Colors.grey
                                                    : Colors.blue),
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
                                    SizedBox(height: 20),

                                    // Question 2
                                    Text(
                                      'This is letter ____.',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.network(
                                        'https://huggingface.co/datasets/nesuri/app_asl_data/resolve/main/asl-data/static_signs/D.jpg',
                                        fit: BoxFit.cover,
                                      ),
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
                                            icon: Icon(Icons.send,
                                                color: answered2
                                                    ? Colors.grey
                                                    : Colors.blue),
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
                              section['content'],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.justify,
                            );
                        }
                      },
                    ),
                  ]),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous Button
                ElevatedButton(
                  onPressed: currentIndex > 0
                      ? previousPage
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    side: BorderSide(color: Colors.black, width: 1),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ), // Disabled if at the first section
                  child: Text(
                    'Previous',
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                // Next Button
                ElevatedButton(
                  onPressed: () {
                    if (currentIndex < lessonSections.length - 1) {
                      // Proceed to next activity if it's not the last one
                      setState(() {
                        currentIndex++;
                      });
                    } else {
                      // If it's the last activity (Activity 2), return to Main Screen
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    side: BorderSide(color: Colors.black, width: 1),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  ),
                  child: Text(
                    currentIndex < lessonSections.length - 1
                        ? 'Next'
                        : 'Finish',
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
