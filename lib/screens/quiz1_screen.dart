import 'package:flutter/material.dart';
import 'dart:math';
import '../services/quiz_progress.dart';
import 'video_player_widget.dart';
import 'main_screen.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(home: Quiz1Screen()));
}

class Quiz1Screen extends StatefulWidget {
  const Quiz1Screen({super.key});

  @override
  State<Quiz1Screen> createState() => _Quiz1ScreenState();
}

class _Quiz1ScreenState extends State<Quiz1Screen> {
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();

  final Map<String, String> correctMatches = {
    "Letter J":
        "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/J-gif%20(1)%20(1).gif?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0otZ2lmICgxKSAoMSkuZ2lmIiwiaWF0IjoxNzQ0NzEzMjc0LCJleHAiOjE3NzYyNDkyNzR9.3mzzTaL5LE_6_KJ25fBCv109Q-trw_LAYxymYTnwtCg",
    "I’m fine":
        "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%202/i_m%20fine.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDIvaV9tIGZpbmUud2VibSIsImlhdCI6MTc0MzQyNTM1NSwiZXhwIjoxNzc0OTYxMzU1fQ.Umn3XD_69oi9u5wJYqA87ptchXkePGofiQeNgs5PJWs",
    "Good evening":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/good%20night.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvZ29vZCBuaWdodC53ZWJtIiwiaWF0IjoxNzQ2NjA2MzUzLCJleHAiOjE3NzgxNDIzNTN9.0jsriML1FK7lAbJ8FWgfWszr6VSn6NdW4NnBJo2J1Qg",
    "Friend":
        "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%204/friend.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDQvZnJpZW5kLndlYm0iLCJpYXQiOjE3NDM0MzI2MjAsImV4cCI6MTc3NDk2ODYyMH0.zXV7n383AKR3BrTRSL8e-k70yng1D4DkRM1vpxWEIIg",
    "Want":
        "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%204/want.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDQvd2FudC53ZWJtIiwiaWF0IjoxNzQzNDgyMzczLCJleHAiOjE3NzUwMTgzNzN9.BU-KyilvSg-dQ1UnTDctTwcDOLtQNUNhZujqu5eUnEY",
    "Introduce":
        "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%204/to%20introduce.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDQvdG8gaW50cm9kdWNlLndlYm0iLCJpYXQiOjE3NDM0ODIyODIsImV4cCI6MTc3NTAxODI4Mn0.qYQAC0SqVXpdEPXNc2LPHe7dtiE41mc5vQBQsDUt_Zo",
    "ASL":
        "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%204/ASL.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDQvQVNMLndlYm0iLCJpYXQiOjE3NDM0MzI1NDcsImV4cCI6MTc3NDk2ODU0N30.OVt-xyc1lQBdH3A3YztWNixLBOazlVwUFvzMFtTiuqg",
    "Goodbye":
        "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%201/Lesson%203/Goodbye.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDEvTGVzc29uIDMvR29vZGJ5ZS53ZWJtIiwiaWF0IjoxNzQzNDMxNzMyLCJleHAiOjE3NzQ5Njc3MzJ9.2RfM5qMqulkT474Id3A9IVujErIcpjQg31M6ZiGCuHQ",
    "Letter F":
        "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/F.webp?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0Yud2VicCIsImlhdCI6MTc0NDcxMzE5MywiZXhwIjoxNzc2MjQ5MTkzfQ.u8JqzRn91b_2Xu6cdKJgHqfz3nFKUJd7n22Zj-Ocuvg"
  };

  Map<String, String> userMatches = {};
  Map<String, Color> dropAreaColors = {};
  List<String> shuffledTexts = [];
  List<String> shuffledMediaUrls = [];
  Set<String> usedTexts = {};
  Set<String> answeredItems = Set<String>();

  int currentPage = 0;
  final List<List<String>> pages = [
    ["Letter J", "I’m fine", "Good evening"],
    ["Friend", "Want", "Introduce"],
    ["ASL", "Goodbye", "Letter F"],
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
          "Quiz 1",
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
    List<String> correctAnswers = [
      "hi! nice to meet you, my name is judith",
      "hi nice to meet you my name is judith",
    ];

    String userAnswer = answerController.text.trim().toLowerCase();

    setState(() {
      answered = true;
      isCorrect = correctAnswers.contains(userAnswer);
      if (isCorrect) {
        totalScore += 10;
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
  void dispose() {
    player.dispose(); // Dispose of audio player
    answerController.dispose(); // Dispose of text controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz 1',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(category: 'Unit 1: Welcome'),
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
              Text('Identify what the sign is in the video below:',
                  style: TextStyle(fontSize: 15), textAlign: TextAlign.center),
              SizedBox(height: 30),
              CustomVideoPlayer(
                videoUrl:
                    "https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/videos/Unit%202/Hi,%20nice%20to%20meet%20you.%20My%20name%20is%20Judith.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3ZpZGVvcy9Vbml0IDIvSGksIG5pY2UgdG8gbWVldCB5b3UuIE15IG5hbWUgaXMgSnVkaXRoLndlYm0iLCJpYXQiOjE3NDQ3OTk5OTksImV4cCI6MTc3NjMzNTk5OX0.5Jmh3RpK1ayAztGmxrICrojBlU20f5_gAcW-dGRNv_g",
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
                      quizId: 'Unit 1',
                      totalScore: totalScore,
                    ); 
                    
                    if(context.mounted){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MainScreen(category: 'Unit 1: Welcome'),
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
