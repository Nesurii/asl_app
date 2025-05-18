import 'package:flutter/material.dart';
import 'dart:math';
import '../services/quiz_progress.dart';
import 'video_player_widget.dart';
import 'main_screen.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(home: Quiz8Screen()));
}

class Quiz8Screen extends StatefulWidget {
  const Quiz8Screen({super.key});

  @override
  State<Quiz8Screen> createState() => _Quiz8ScreenState();
}

class _Quiz8ScreenState extends State<Quiz8Screen> {
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();

  final Map<String, String> correctMatches = {
    "Karate":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/karate.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2thcmF0ZS53ZWJtIiwiaWF0IjoxNzQ2NjY1NzQyLCJleHAiOjE3NzgyMDE3NDJ9.NDhdLTz5-gRblsSFGewScRRBwP5sxyI2Zkznf4QhO-4",
    "Every":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/every.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL2V2ZXJ5LndlYm0iLCJpYXQiOjE3NDY2NjQ5MTcsImV4cCI6MTc3ODIwMDkxN30.kjJFUz4KMEUFXeK539y8CC4NaMIOjN5Mx34uRUaJcxw",
    "To clean":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2032/to%20clean.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMyL3RvIGNsZWFuLndlYm0iLCJpYXQiOjE3NDY2NjgyMzIsImV4cCI6MTc3ODIwNDIzMn0.tTjBjlgGxee24uqRLd9D-Tp649SmxWfDzwXT-XQ9dF4",
    "Baseball":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2029/baseball.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDI5L2Jhc2ViYWxsLndlYm0iLCJpYXQiOjE3NDY2NDIyMTQsImV4cCI6MTc3ODE3ODIxNH0.IWNG0nCo8PQhu7YzlP1lYVE6a_--nisLrFGcFog4fPA",
    "Perfume":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2031/perfume.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMxL3BlcmZ1bWUud2VibSIsImlhdCI6MTc0NjY2NzU4MywiZXhwIjoxNzc4MjAzNTgzfQ.8tZPIz1HikGca2Nn4mvOuLwAPSbmtvENcjlyJP8NWpo",
    "To sweep":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2032/to%20sweep.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMyL3RvIHN3ZWVwLndlYm0iLCJpYXQiOjE3NDY2NjkyNDMsImV4cCI6MTc3ODIwNTI0M30.lVHYoCeBqJPX2i6ye11sMzfMSOZ-mqzJJEqOYtLwyKQ",
    "To take a bath":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2030/to%20take%20a%20bath.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMwL3RvIHRha2UgYSBiYXRoLndlYm0iLCJpYXQiOjE3NDY2NjU1MTcsImV4cCI6MTc3ODIwMTUxN30.0idNzCMykz4koeKwVy5x-liI-dWDEljnteQpJaRrtNA",
    "Floss":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2031/floss.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMxL2Zsb3NzLndlYm0iLCJpYXQiOjE3NDY2Njc5NjgsImV4cCI6MTc3ODIwMzk2OH0.2GFkM09fvk5Oj6YaRp8gdsfAHWLAsCDeY00cUA-i5w8",
    "To feed":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2032/to%20feed.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMyL3RvIGZlZWQud2VibSIsImlhdCI6MTc0NjY2ODMwOCwiZXhwIjoxNzc4MjA0MzA4fQ.0ZHfq6THE8ZtWR-5N8Q-SaIjxm954MXvWo7DZbdG-bs",
  };

  Map<String, String> userMatches = {};
  Map<String, Color> dropAreaColors = {};
  List<String> shuffledTexts = [];
  List<String> shuffledMediaUrls = [];
  Set<String> usedTexts = {};
  Set<String> answeredItems = Set<String>();

  int currentPage = 0;
  final List<List<String>> pages = [
    ["Karate", "Every", "To clean"],
    ["Baseball", "Perfume", "To sweep"],
    ["To take a bath", "Floss", "To feed"],
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
          "Quiz 8",
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
                  onAcceptWithDetails:
                      (DragTargetDetails<String> details) async {
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
    String correctAnswer = "i play tennis every sunday";
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
        title: Text('Quiz 8',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MainScreen(category: 'Unit 8: My Daily Routine'),
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
              Text('What is the sign from the video shown below?',
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
              SizedBox(height: 30),
              CustomVideoPlayer(
                videoUrl:
                    "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%208/Lesson%2032/i%20play%20tennis%20every%20sunday.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDgvTGVzc29uIDMyL2kgcGxheSB0ZW5uaXMgZXZlcnkgc3VuZGF5LndlYm0iLCJpYXQiOjE3NDY2NzQzMzgsImV4cCI6MTc3ODIxMDMzOH0.gYPLah75WeV1zC6hFv8UL2DP2cp6m56K9f3E55uORJc",
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
                      quizId: 'Unit 8',
                      totalScore: totalScore,
                    );

                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MainScreen(category: 'Unit 8: My Daily Routine'),
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
