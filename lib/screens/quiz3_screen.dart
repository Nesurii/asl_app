import 'package:flutter/material.dart';
import 'dart:math';
import '../services/quiz_progress.dart';
import 'video_player_widget.dart';
import 'main_screen.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(home: Quiz3Screen()));
}

class Quiz3Screen extends StatefulWidget {
  const Quiz3Screen({super.key});

  @override
  State<Quiz3Screen> createState() => _Quiz3ScreenState();
}

class _Quiz3ScreenState extends State<Quiz3Screen> {
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();

  final Map<String, String> correctMatches = {
    "Which":
        "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%203/Lesson%209/which.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDMvTGVzc29uIDkvd2hpY2gud2VibSIsImlhdCI6MTc0NDAyNzQwOSwiZXhwIjoxNzc1NTYzNDA5fQ.zUbBmzLCjHZ_IR2Z-O4ksSWsUw_uh1-BbGlGj1yOz2w",
    "Email":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/email.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvZW1haWwud2VibSIsImlhdCI6MTc0NjYxMDc3MSwiZXhwIjoxNzc4MTQ2NzcxfQ.SuiJgH09gm0SU1nz9Bjoz7zj7FnSs07iB2S_JGpRrEc",
    "Weather":
        "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%203/Lesson%2012/weather%20ver.%201.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDMvTGVzc29uIDEyL3dlYXRoZXIgdmVyLiAxLndlYm0iLCJpYXQiOjE3NDQwMzM1MjEsImV4cCI6MTc3NTU2OTUyMX0.rAeFfYeAYnV8VYTmmm2n8Y66i3Ymos_loTOe1gmEO5Q",
    "Sunny":
        "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%203/Lesson%2012/sunny.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDMvTGVzc29uIDEyL3N1bm55LndlYm0iLCJpYXQiOjE3NDQwMzMzOTUsImV4cCI6MTc3NTU2OTM5NX0.8x405qrHKNgNB_Y75uXD2_KjUdnPaclLEG7tW6XbBVI",
    "Address":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/address.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvYWRkcmVzcy53ZWJtIiwiaWF0IjoxNzQ2NjA5NDExLCJleHAiOjE3NzgxNDU0MTF9.sltPx8tQDzmO7W78bM1j0UgXFuf4_mxsuCvG0w6-Y3I",
    "Blue":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/blue.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvYmx1ZS53ZWJtIiwiaWF0IjoxNzQ2NjEwMzgxLCJleHAiOjE3NzgxNDYzODF9.V6UYZy9zRuMbetAh_QllyPaga9MzwcYd_qsdf3EjwWk",
    "Philippines":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/philippines.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvcGhpbGlwcGluZXMud2VibSIsImlhdCI6MTc0NjYxODE1MywiZXhwIjoxNzc4MTU0MTUzfQ.f50sXWQKMmcwOuXUDoSIT7_dRGwqx6oC02E4Lb4mvxA",
    "Orange":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/orange.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvb3JhbmdlLndlYm0iLCJpYXQiOjE3NDY2MTA1NzIsImV4cCI6MTc3ODE0NjU3Mn0.6EkDItlS7iMeDzh94-cnnahalRJXo-Gv1jqtAOkribw",
    "At (@ symbol)":
        "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%203/Lesson%2011/@.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDMvTGVzc29uIDExL0Aud2VibSIsImlhdCI6MTc0NDAzMjkxOCwiZXhwIjoxNzc1NTY4OTE4fQ.rFqXFF9LOvwsgjUJAW-fkZv8947p5U28UvYX6-FHdRM"
  };

  Map<String, String> userMatches = {};
  Map<String, Color> dropAreaColors = {};
  List<String> shuffledTexts = [];
  List<String> shuffledMediaUrls = [];
  Set<String> usedTexts = {};
  Set<String> answeredItems = Set<String>();

  int currentPage = 0;
  final List<List<String>> pages = [
    ["Which", "Email", "Weather"],
    ["Sunny", "Address", "Blue"],
    ["Philippines", "Orange", "At (@ symbol)"],
  ];

  @override
  void initState() {
    super.initState();
    shuffleCurrentPage();
  }

  void shuffleCurrentPage() {
    List<String> textsForPage = List.from(pages[currentPage]);
    List<String> mediaForPage =
        pages[currentPage].map((text) => correctMatches[text]!).toList();

    textsForPage.shuffle(Random());
    mediaForPage.shuffle(Random());

    setState(() {
      shuffledTexts = textsForPage;
      shuffledMediaUrls = mediaForPage;
      dropAreaColors.clear();
      userMatches.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz 3",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange,
      ),
      // Use a Stack so we can overlay the floating buttons.
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 100), // space for floating buttons
            child: Column(
              children: [
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: LinearProgressIndicator(
                    value: totalScore / 100, // Normalized value (0 to 1)
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                    minHeight: 10,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Score: $totalScore",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Matching Type",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Drag the correct text label to match it with the corresponding image or video.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
                SizedBox(height: 20),
                // The matching sections are now inside a ListView.builder with shrinkWrap
                ListView.builder(
                  physics:
                      NeverScrollableScrollPhysics(), // Disable inner scrolling
                  shrinkWrap: true,
                  itemCount: shuffledTexts.length,
                  itemBuilder: (context, index) {
                    String text = shuffledTexts[index];
                    String shuffledMedia = shuffledMediaUrls[index];

                    return buildMatchingSection(text, shuffledMedia);
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
           Positioned(
            bottom: 30,
            right: 30,
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              radius: 25,
              child: IconButton(
                icon: Icon(Icons.arrow_forward, size: 20, color: Colors.white),
                onPressed: () {
                  if (answeredItems.length == shuffledTexts.length) {
                    if (currentPage < pages.length - 1) {
                      setState(() {
                        currentPage++;
                        shuffleCurrentPage();
                        answeredItems
                            .clear(); // Clear answered items for the next page
                      });
                    } else {
                      // Last Page: Redirect to FillInTheBlankScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FillInTheBlankScreen(totalScore: totalScore),
                        ),
                      );
                    }
                  } else {
                    // Show snackbar kapag hindi pa kompleto
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Please answer all quiz questions before proceeding.'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget buildMatchingSection(String text, String shuffledMedia) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: usedTexts.contains(text)
                    ? Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      )
                    : Draggable<String>(
                        data: text,
                        feedback: Material(
                          color: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Text(text,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ),
                        childWhenDragging: Opacity(
                          opacity: 0.5,
                          child: Text(text, style: TextStyle(fontSize: 18)),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Text(
                            text,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
              ),
              SizedBox(width: 15),
              Expanded(
                flex: 1,
                child: DragTarget<String>(
                   onWillAcceptWithDetails: (DragTargetDetails<String> details) {
                    return correctMatches.containsKey(details.data);
                  }, 
                  onAcceptWithDetails: (DragTargetDetails<String> details) async {
                     final receivedText = details.data;
                    setState(() {
                      usedTexts.add(receivedText); // Prevent future drags
                      answeredItems
                          .add(receivedText); // Track the answered item

                      if (correctMatches[receivedText] == shuffledMedia) {
                        userMatches[text] = shuffledMedia;
                        dropAreaColors[text] = Colors.green;
                        totalScore += 10;
                      } else {
                        dropAreaColors[text] = Colors.red;
                      }
                    });
                    if (correctMatches[receivedText] == shuffledMedia) {
                      await player.play(AssetSource('sounds/correct.mp3'));
                    } else {
                      await player.play(AssetSource('sounds/wrong.mp3'));
                    }
                  },
                  builder: (context, accepted, rejected) {
                    return Container(
                      height: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: dropAreaColors[text] ?? Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: getMediaWidget(shuffledMedia),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getMediaWidget(String mediaUrl) {
    if (mediaUrl.contains("webm")) {
      return CustomVideoPlayer(videoUrl: mediaUrl);
    } else {
      return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Center(
                    child: Image.network(mediaUrl, fit: BoxFit.cover),
                  ),
                ),
              );
            },
          );
        },
        child: Image.network(mediaUrl, width: 100, height: 100),
      );
    }
  }
}

class FillInTheBlankScreen extends StatefulWidget {
  final int totalScore;

  const FillInTheBlankScreen({required this.totalScore, super.key});

  @override
  State<FillInTheBlankScreen> createState() => _FillInTheBlankScreenState();
}

class _FillInTheBlankScreenState extends State<FillInTheBlankScreen> {
  late int totalScore;
  final TextEditingController answerController = TextEditingController();
  bool answered = false;
  bool isCorrect = false;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    totalScore = widget.totalScore;
    player = AudioPlayer(); // Initialize the audio player
  }

  Future<void> checkAnswer() async {
    String correctAnswer = "i live near the beach";
    String userAnswer = answerController.text.trim().toLowerCase();

    setState(() {
      answered = true;
      if (userAnswer == correctAnswer) {
        isCorrect = true;
        totalScore += 10;
      } else {
        isCorrect = false;
      }
    });

    try {
      if (isCorrect) {
        await player.play(AssetSource('sounds/correct.mp3'));
      } else {
        await player.play(AssetSource('sounds/wrong.mp3'));
      }
    } catch (e) {
      debugPrint("Error playing sound: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz 3',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
             leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(category: 'Unit 3:Getting to Know You'),
              ),
              (Route<dynamic> route) => false,
            );
          },
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: LinearProgressIndicator(
                  value: totalScore / 100,
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                  minHeight: 10,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Score: $totalScore',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Fill in the Blank Quiz",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Watch the video below and fill in the blank with the correct answer.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Text('What is being signed in the video below?',
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
              SizedBox(height: 30),
              CustomVideoPlayer(
                videoUrl:
                    "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/i%20live%20near%20the%20beach.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvaSBsaXZlIG5lYXIgdGhlIGJlYWNoLndlYm0iLCJpYXQiOjE3NDY2MzQzNDIsImV4cCI6MTc3ODE3MDM0Mn0.gOQES6dp_-PXx0vClO8fW_ctIgooYmZdT8PuR0Jq13w",
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: answerController,
                  enabled: !answered,
                  decoration: InputDecoration(
                    hintText: 'Enter your answer here',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send,
                          color: answered ? Colors.grey : Colors.blue),
                      onPressed: answered ? null : checkAnswer,
                    ),
                    filled: true,
                    fillColor: answered
                        ? (isCorrect ? Colors.green[100] : Colors.red[100])
                        : Colors.white,
                  ),
                ),
              ),
            ],
          ),
         Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange, // Always orange
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () async {
                  if (answered) {

                    // update quiz score
                    await updateQuiz(
                      quizId: 'Unit 3',
                      totalScore: totalScore,
                    ); 
                    
                    if(context.mounted){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MainScreen(category: 'Unit 3:Getting to Know You'),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Please answer all quiz questions before proceeding.'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
