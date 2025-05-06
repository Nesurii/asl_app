import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../services/completed_lessons_progress.dart';
import '../services/state_progress.dart';

class Lesson1Screen extends StatefulWidget {
  final String lessonId;
  const Lesson1Screen({super.key, required this.lessonId});

  @override
  State<Lesson1Screen> createState() => _Lesson1ScreenState();
}

class _Lesson1ScreenState extends State<Lesson1Screen> {
  int currentIndex = 0;
  int totalScore = 0;
  final lessonManager = LessonManager();
  final PageController _pageController = PageController();
  final AudioPlayer player = AudioPlayer();

  bool answeredQuestion1 = false;
  bool answeredQuestion2 = false;
  bool answeredQuestion3 = false;
  bool answered1 = false;
  bool answered2 = false;
  bool lessonCompleted = false; 

  final Map<int, bool> _isZoomed = {};

  final List<Map<String, dynamic>> lessonSections = [
    {
      'title': 'Introduction',
    },
    {
      'title': 'Sign Space',
      'image':
          'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/ASL%20Sign%20Space%20(1).webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0FTTCBTaWduIFNwYWNlICgxKS53ZWJwIiwiaWF0IjoxNzQ1MzE2MTMzLCJleHAiOjE3NzY4NTIxMzN9.spK6yoCnJhNu2oYi-YPkyPmhQPhb-VcJ-2-DIBbNzfo' // Replace with your Supabase image URL
    },
    {
      'title': 'Alphabet Overview',
    },
    {
      'title': 'Vowels',
      'content': "These are the 5 Vowels:",
      'images': [
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/A.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0Eud2VicCIsImlhdCI6MTc0NDcxMzA4NiwiZXhwIjoxNzc2MjQ5MDg2fQ.xd___ael5CLmT3P0pCjWR8Xv0joSUUvs_3SSHlNSkn8',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/E.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0Uud2VicCIsImlhdCI6MTc0NDcxMzE3NCwiZXhwIjoxNzc2MjQ5MTc0fQ.y75LdA_1qe3p0BWshTue5mzyc9kmg5lgcf5wZhYyqw4',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/I.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0kud2VicCIsImlhdCI6MTc0NDcxMzI1NCwiZXhwIjoxNzc2MjQ5MjU0fQ.fZ8oIPti5Ux8dvvhCVyma0cxrrXLHf9J9RISDihidoA',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/O%20side%20view.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL08gc2lkZSB2aWV3LndlYnAiLCJpYXQiOjE3NDQ3MTMzNzQsImV4cCI6MTc3NjI0OTM3NH0.wJ4RofmQ5ruKNS2RLBzUxJvUBES5-uUfVZNOi4mZ2eM',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/U.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1Uud2VicCIsImlhdCI6MTc0NDcxMzQ3NSwiZXhwIjoxNzc2MjQ5NDc1fQ.jXslrEaH-h5RmQksek92NWYNUF5bFo_jUdqzfkFdAAk',
      ],
    },
    {
      'title': 'Consonants',
      'content': "These are the 21 Consonants:",
      'images': [
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/B.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0Iud2VicCIsImlhdCI6MTc0NDcxMzExMywiZXhwIjoxNzc2MjQ5MTEzfQ.PTObYkVLeX-UnKiYrdT7G0PXmInPg7aYMjwBbb1nXsQ',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/C.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0Mud2VicCIsImlhdCI6MTc0NDcxMzEzNCwiZXhwIjoxNzc2MjQ5MTM0fQ.L_DCRULZ3cfS_3cpMNF1mNcZFL7x1W6onPLWFpT2E6c',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/D.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0Qud2VicCIsImlhdCI6MTc0NDcxMzE1OSwiZXhwIjoxNzc2MjQ5MTU5fQ.9RFt4sDnPeookS3Igy8mqsoC8VRuCtB_ptwrhtUleaA',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/F.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0Yud2VicCIsImlhdCI6MTc0NDcxMzE5MywiZXhwIjoxNzc2MjQ5MTkzfQ.u8JqzRn91b_2Xu6cdKJgHqfz3nFKUJd7n22Zj-Ocuvg',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/G.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0cud2VicCIsImlhdCI6MTc0NDcxMzIwOSwiZXhwIjoxNzc2MjQ5MjA5fQ.oylkoo7uvXMzNfb6BOH8fMXTlMEvJrz0hvUMX8DGaA8',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/H.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0gud2VicCIsImlhdCI6MTc0NDcxMzIyNSwiZXhwIjoxNzc2MjQ5MjI1fQ.5UsZADzXAXVv_0zYyr9VVBoW3VGZaiw3f-yDvGlHqUs',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/J-gif%20(1)%20(1).gif?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0otZ2lmICgxKSAoMSkuZ2lmIiwiaWF0IjoxNzQ0NzEzMjc0LCJleHAiOjE3NzYyNDkyNzR9.3mzzTaL5LE_6_KJ25fBCv109Q-trw_LAYxymYTnwtCg',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/K.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0sud2VicCIsImlhdCI6MTc0NDcxMzI5MywiZXhwIjoxNzc2MjQ5MjkzfQ.IfTkBmg5HF2_xc_P536Uj4E81lyqGXfdiIli6dmREDc',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/L.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0wud2VicCIsImlhdCI6MTc0NDcxMzMxNywiZXhwIjoxNzc2MjQ5MzE3fQ.uHLfQmydh7lGnHMKQwV8QXtRvmpbJ7PRMXjYOCr7nr8',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/M.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL00ud2VicCIsImlhdCI6MTc0NDcxMzMzMCwiZXhwIjoxNzc2MjQ5MzMwfQ.Y2gqLhKrO6gjeKre2IZqZiubyt4SnoXqRGyCpmLBSLo',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/N.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL04ud2VicCIsImlhdCI6MTc0NDcxMzM1NSwiZXhwIjoxNzc2MjQ5MzU1fQ.6BG4xG4QszFpNBQaSyaaQmaC_CLXg4aQAthRPIjoc3k',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/Pside%20view.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1BzaWRlIHZpZXcud2VicCIsImlhdCI6MTc0NDcxMzM5MSwiZXhwIjoxNzc2MjQ5MzkxfQ.Iv8FzwL9ueu6Zoqhqc3-aUU3WVIbRp53FRaLtPXDNUY',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/Q%20side%20view.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1Egc2lkZSB2aWV3LndlYnAiLCJpYXQiOjE3NDQ3MTM0MTIsImV4cCI6MTc3NjI0OTQxMn0.8CifU32uknYo5F6V42TjRDuTKZxwDIM2_Qsp85nRtxY',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/R.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1Iud2VicCIsImlhdCI6MTc0NDcxMzQzMCwiZXhwIjoxNzc2MjQ5NDMwfQ.v1W1HQkjeyBS_ZqpyhXX3w-megLWMdoMH5ouN1s5U8s',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/S.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1Mud2VicCIsImlhdCI6MTc0NDcxMzQ0NSwiZXhwIjoxNzc2MjQ5NDQ1fQ.VSp37g8YE11KZS5qbhH6OX8Iy5srL63dQecRV3e5cuA',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/T.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1Qud2VicCIsImlhdCI6MTc0NDcxMzQ2MCwiZXhwIjoxNzc2MjQ5NDYwfQ.vGLdKU5Mwq-8fP3qPck7Ej9CxBH1NPIMgGVwbiPp6Y0',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/V.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1Yud2VicCIsImlhdCI6MTc0NDcxMzQ4OCwiZXhwIjoxNzc2MjQ5NDg4fQ.Q4S0aaz8lDvxiqoFtn2RB-1zItUkoGAG7n2zOVCZW8I',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/W.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1cud2VicCIsImlhdCI6MTc0NDcxMzUwNiwiZXhwIjoxNzc2MjQ5NTA2fQ.geG_7HzX1lMcLX-kEXZD6tcwZUTzPfxAuG0fd4iQeKs',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/X.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1gud2VicCIsImlhdCI6MTc0NDcxMzUyMSwiZXhwIjoxNzc2MjQ5NTIxfQ.HRFcF1aZIQZg5X1eV78bqfeRRGuf-zI7sxgk2dpuCYE',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/Y.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1kud2VicCIsImlhdCI6MTc0NDcxMzUzNSwiZXhwIjoxNzc2MjQ5NTM1fQ.jt_qgyVtz419gi9z_tCwALCISbvNLUDXgq-HRvDR--o',
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/Z-gif%20(1)%20(1).gif?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1otZ2lmICgxKSAoMSkuZ2lmIiwiaWF0IjoxNzQ0NzEzNTUwLCJleHAiOjE3NzYyNDk1NTB9.PgMdj12vZhFylwbG_5ry3gAZKL49EPY_DkW8KVr4L70',
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

  Future<void> nextPage() async {
    if (currentIndex < lessonSections.length - 1) {
      _pageController.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> previousPage() async {
    if (currentIndex > 0) {
      _pageController.animateToPage(
        currentIndex - 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
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
                                          color: Colors.black,
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
                                          color: Colors.black,
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
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Note: ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
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

                            int correctAnswer1 = 1;
                            int correctAnswer2 = 3;
                            int correctAnswer3 = 2;

                            double progress = 0.0;
                            int maxPoints = 100; // Maximum score possible

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
                                  }

                                  if (isCorrect) {
                                    totalScore += 10;
                                    await player.play(
                                        AssetSource('sounds/correct.mp3'));
                                  } else {
                                    await player
                                        .play(AssetSource('sounds/wrong.mp3'));
                                  }

                                  progress = totalScore / maxPoints;
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
                                        textAlign: TextAlign.justify,
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
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/N.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL04ud2VicCIsImlhdCI6MTc0NDcxMzM1NSwiZXhwIjoxNzc2MjQ5MzU1fQ.6BG4xG4QszFpNBQaSyaaQmaC_CLXg4aQAthRPIjoc3k',
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
                                        textAlign: TextAlign.justify,
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
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/Z-gif%20(1)%20(1).gif?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1otZ2lmICgxKSAoMSkuZ2lmIiwiaWF0IjoxNzQ0NzEzNTUwLCJleHAiOjE3NzYyNDk1NTB9.PgMdj12vZhFylwbG_5ry3gAZKL49EPY_DkW8KVr4L70',
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
                                        textAlign: TextAlign.justify,
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
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/M.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL00ud2VicCIsImlhdCI6MTc0NDcxMzMzMCwiZXhwIjoxNzc2MjQ5MzMwfQ.Y2gqLhKrO6gjeKre2IZqZiubyt4SnoXqRGyCpmLBSLo',
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
                                totalScore / 100; // Update progress

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
                                    'y';

                                if (isCorrect1) {
                                  totalScore += 10;
                                  progress = totalScore / 100;
                                  await player
                                      .play(AssetSource('sounds/correct.mp3'));
                                } else {
                                  await player
                                      .play(AssetSource('sounds/wrong.mp3'));
                                }

                                answered1 = true;
                                setState(() {});
                              }
                            }

                            void checkAnswer2(StateSetter setState) async {
                              if (!answered2) {
                                isCorrect2 = answerController2.text
                                        .trim()
                                        .toLowerCase() ==
                                    'd';

                                if (isCorrect2) {
                                  totalScore += 10;
                                  progress = totalScore / 100;
                                  await player
                                      .play(AssetSource('sounds/correct.mp3'));
                                } else {
                                  await player
                                      .play(AssetSource('sounds/wrong.mp3'));
                                }

                                answered2 = true;
                                setState(() {});
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
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/Y.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1kud2VicCIsImlhdCI6MTc0NDcxMzUzNSwiZXhwIjoxNzc2MjQ5NTM1fQ.jt_qgyVtz419gi9z_tCwALCISbvNLUDXgq-HRvDR--o',
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
                                        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/D.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0Qud2VicCIsImlhdCI6MTc0NDcxMzE1OSwiZXhwIjoxNzc2MjQ5MTU5fQ.9RFt4sDnPeookS3Igy8mqsoC8VRuCtB_ptwrhtUleaA',
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
                // Conditionally render the Previous button
                if (currentIndex > 0 &&
                    currentIndex < lessonSections.length - 2)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentIndex--;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      side: BorderSide(color: Colors.black, width: 1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      'Previous',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                else
                  SizedBox(
                      width: 120), // Placeholder to maintain spacing if needed

                // Next or Finish Button
                ElevatedButton(
                  onPressed: () async {
                    bool allQuestionsAnsweredQuiz = answeredQuestion1 &&
                        answeredQuestion2 &&
                        answeredQuestion3;
                    bool allQuestionsAnsweredInput = answered1 && answered2;

                    if (context.mounted) {
                      if (currentIndex == lessonSections.length - 2) {
                        // Quiz section (second-to-the-last page)
                        if (!allQuestionsAnsweredQuiz) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please answer all quiz questions before proceeding.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                      } else if (currentIndex == lessonSections.length - 1) {
                        // Input section (last page)
                        if (!allQuestionsAnsweredInput) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please answer all input questions before finishing.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                      }
                    }
                    if (currentIndex < lessonSections.length - 1) {
                      setState(() {
                        currentIndex++;
                      });
                      _saveCurrentPage();
                    } else {
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
            ),
          ],
        ),
      ),
    );
  }
}
