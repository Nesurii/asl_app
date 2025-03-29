import 'package:flutter/material.dart';
import 'package:mypod_flutter/widgets/video_player.dart';
// Import the video player widget

class Lesson4Screen extends StatefulWidget {
  const Lesson4Screen({super.key});

  @override
  State<Lesson4Screen> createState() => _Lesson4ScreenState();
}

class _Lesson4ScreenState extends State<Lesson4Screen> {
  int currentIndex = 0;
  int totalScore = 0;

  final List<Map<String, dynamic>> lessonSections = [
    {
      'title': 'Names & Introductions',
    },
    {
      'title': 'Understanding Closing Signals and Deixis',
    },
    {
      'title': 'Deaf Culture',
    },
    {
      'title': 'Introduction Vocabulary',
    },
    {
      'title': 'Introducing Yourself and Others in ASL!',
    },
    {
      'title': 'Fingerspell a Name with a Double Letter',
    },
    {
      'title': 'Did You Know?',
    },
    {
      'title': 'Everyday Conversations',
    },
    {
      'title': 'Lesson Completed!',
    },
    {
      'title': 'Activity',
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
          'Lesson 4 - ${section['title']}',
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
                          case 'Names & Introductions':
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
                                        text: "Take a look at these examples.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/What.is.your.name.mp4',
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
                                        text: "What is your name?",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/My.name.is.judith.mp4',
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
                                        text: "My name is Judith.",
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
                                            "Did you notice the sign pointing back to yourself or the person you're talking about at the end of the sign?",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40),
                              ],
                            );

                          case 'Understanding Closing Signals and Deixis':
                            return Column(
                              children: [
                                SizedBox(height: 125),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    children: [
                                      TextSpan(
                                        text: "That is called a ",
                                      ),
                                      TextSpan(
                                        text: "Closing Signal ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      TextSpan(
                                        text:
                                            "wherein you use Deixis (pointing of finger) at the end of a sentence.\n",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    children: [
                                      TextSpan(
                                        text:
                                            "You only need to use the Closing Signal when:",
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
                                            "• Making a statement or comment about yourself or somebody else.\n• Asking a question.",
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
                                        text:
                                            "When you use deixis, look towards the area you're pointing to. This is called ",
                                      ),
                                      TextSpan(
                                        text: "eye glaze ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      TextSpan(
                                        text:
                                            "and helps hold that location for the person or thing you're signing about.\n\n",
                                      ),
                                      TextSpan(
                                        text:
                                            "Remember, ASL sentences lacking closing signals are incomplete!",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );

                          case 'Deaf Culture':
                            return Column(
                              children: [
                                SizedBox(height: 135),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    children: [
                                      TextSpan(
                                        text:
                                            "It is also considered rude to use your voice during a conversation with a deaf person near you.",
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
                                        text: "So remember to ",
                                      ),
                                      TextSpan(
                                        text: "'Turn off voice'. ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            "You should avoid mouthing what you are signing and close your mouth unless it is a necessary NMS.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/Turn.off.voice.mp4',
                                ),
                                SizedBox(height: 40),
                              ],
                            );

                          case 'Introduction Vocabulary':
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
                                            "Now, let’s get you familiarized with the Introduction vocabulary.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/deaf.ver.1.mp4',
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
                                        text: "Deaf Version 1",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/deaf.ver.2.mp4',
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
                                        text: "Deaf Version 2",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/friend.mp4',
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
                                        text: "Friend",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/Hard.of.hearing.mp4',
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
                                        text: "Hard of hearing",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/hearing.mp4',
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
                                        text: "Hearing",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/to.introduce.mp4',
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
                                        text: "To introduce",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/to.meet.mp4',
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
                                        text: "To meet",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/my.mp4',
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
                                        text: "My",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/nice.mp4',
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
                                        text: "Nice",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/Nice.to.meet.you.mp4',
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
                                        text: "Nice to meet you",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/want.mp4',
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
                                        text: "To want",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/name.mp4',
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
                                        text: "Name",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40),
                              ],
                            );
                          case 'Introducing Yourself and Others in ASL!':
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
                                            "Now, look at this! These are some of the ways to introduce someone or yourself.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/I_m.judith.mp4',
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
                                        text: "I am Judith.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/I.want.to.introduce.my.friend.mp4',
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
                                        text: "I want to introduce my friend.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/Her.name.is.Neslie.mp4',
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
                                        text: "Her name is Neslie.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/She.is.Jade.mp4',
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
                                        text: "She is Jade.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40),
                              ],
                            );
                          case 'Fingerspell a Name with a Double Letter':
                            return Column(
                              children: [
                                SizedBox(height: 125),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    children: [
                                      TextSpan(
                                        text:
                                            "How do you fingerspell a name with a double letter?",
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
                                        text: "Try to look at this.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/She.is.Joanna.mp4',
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
                                        text: "She is Joanna.",
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
                                        text:
                                            "You just glide it through and avoid opening your hands since it would look like a different letter.",
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
                                            "Did you know? Raising your eyebrows forms the ",
                                      ),
                                      TextSpan(
                                        text: "Question-Maker",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            ", an expression that shows you are asking a question.  Keep the eyebrows raised until you've completed signing the question.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    children: [
                                      TextSpan(
                                        text: "Take a look at this example.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/I_m.going.to.the.bathroom.mp4',
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
                                        text: "I am going to the bathroom.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/Am.I.going.to.the.bathroom.mp4',
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
                                        text: "Am I going to the bathroom?",
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
                                            "You will notice that the signs are the same with only the facial expressions being different.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40),
                              ],
                            );
                          case 'Everyday Conversations':
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
                                            "Check this Making Conversation vocabulary.",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/ASL.mp4',
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
                                        text: "ASL",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/Bathroom.mp4',
                                ),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "Bathroom",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/to.go.to.mp4',
                                ),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "To go to",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/To.learn.mp4',
                                ),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "To learn",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/no.mp4',
                                ),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "No",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/yes.mp4',
                                ),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "Yes",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/Please.mp4',
                                ),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "Please",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/Again.mp4',
                                ),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "Again",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CustomVideoPlayer(
                                  videoUrl:
                                      'https://github.com/Nesurii/try/releases/download/new/To.slow.down.mp4',
                                ),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "Slow/To slow down",
                                      ),
                                    ],
                                  ),
                                ),
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
                                            "Yay! You’ve completed this lesson. Let’s test your knowledge!",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );

                          case 'Activity':
                            int selectedAnswer1 = -1;
                            int selectedAnswer2 = -1;
                            int selectedAnswer3 = -1;
                            int selectedAnswer4 = -1;
                            int selectedAnswer5 = -1;

                            int correctAnswer1 = 2;
                            int correctAnswer2 = 1;
                            int correctAnswer3 = 1;
                            int correctAnswer4 = 2;
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
                                      '1. What does the visual below mean?',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    CustomVideoPlayer(
                                        videoUrl:
                                            'https://github.com/Nesurii/try/releases/download/new/name.mp4'),
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
                                                color: Colors.black, width: 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                          ),
                                          child: Text(
                                            'Friend',
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
                                            'Name',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30),

                                    // Question 2
                                    Text(
                                      '2. Identify if the visual below is the correct sign for “Nice to meet you”',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    CustomVideoPlayer(
                                        videoUrl:
                                            'https://github.com/Nesurii/try/releases/download/new/Nice.to.meet.you.mp4'),
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
                                            'Correct',
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
                                            'Wrong',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 30),

                                    // Question 3
                                    Text(
                                      '3. The visual below means “To learn”.',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    CustomVideoPlayer(
                                        videoUrl:
                                            'https://github.com/Nesurii/try/releases/download/new/To.learn.mp4'),
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
                                      "4. Pointing back to yourself or the person you're talking about at the end of the sign is called Question-Maker.",
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
                                            'False',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 30),

                                    // Question 5
                                    Text(
                                      "5.When you use deixis, you need to look towards the area you're pointing to. This is called eye gaze.",
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
                  onPressed: (currentIndex == 9)
                      ? () =>
                          Navigator.pop(context) // Pop the screen on last page
                      : nextSection,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    side: BorderSide(color: Colors.black, width: 1),
                  ), // Otherwise, go to next section
                  child: Text(
                    (currentIndex == 9) ? 'Finish' : 'Next',
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
