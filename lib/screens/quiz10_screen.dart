import 'package:flutter/material.dart';
import 'dart:math';
import '../services/quiz_progress.dart';
import 'video_player_widget.dart';
import 'main_screen.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(home: Quiz10Screen()));
}

class Quiz10Screen extends StatefulWidget {
  const Quiz10Screen({super.key});

  @override
  State<Quiz10Screen> createState() => _Quiz10ScreenState();
}

class _Quiz10ScreenState extends State<Quiz10Screen> {
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();

  final Map<String, String> correctMatches = {
    "Flower":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2037/flower.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzNy9mbG93ZXIud2VibSIsImlhdCI6MTc0NjY3MTY2OCwiZXhwIjoxNzc4MjA3NjY4fQ.rIQyBK80M6HBatToxD5cLHtAIpl4Ecx7Uo0EllGP_Yk",
    "Police Officer":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/police%20officer.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL3BvbGljZSBvZmZpY2VyLndlYm0iLCJpYXQiOjE3NDY2NzQ0MjksImV4cCI6MTc3ODIxMDQyOX0.IyvOrC3WwUKnV_azX_botcxBGRGvtzH9hMrhXUEoOkU",
    "Monkey":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2040/monkey.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiA0MC9tb25rZXkud2VibSIsImlhdCI6MTc0NjY3NDM5MywiZXhwIjoxNzc4MjEwMzkzfQ.z7zSJ0XgDyJmDd0d-OUgFqPanNgowxSzgPhRLUtyiLI",
    "Tree":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2037/tree.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzNy90cmVlLndlYm0iLCJpYXQiOjE3NDY2NzI2NzgsImV4cCI6MTc3ODIwODY3OH0.1wW7orJrrMK2qpRadfJWAUzKx7Xd4Q7w57J6fGhaXb8",
    "Entrepreneur":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/entrepreneur.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL2VudHJlcHJlbmV1ci53ZWJtIiwiaWF0IjoxNzQ2Njc0NTY3LCJleHAiOjE3NzgyMTA1Njd9.A4K1L9aFZE7hd-EXgnbROXOaTqEaVpOSflk59nY1JkI",
    "Pizza":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/pizza.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9waXp6YS53ZWJtIiwiaWF0IjoxNzQ2NjczODY2LCJleHAiOjE3NzgyMDk4NjZ9.C9lBGAB6M9L44lmdoUSxlKI7SYEZ9kHR5F23r_0T2nE",
    "River":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/new/river.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9uZXcvcml2ZXIud2VibSIsImlhdCI6MTc0NjYzMTMyOCwiZXhwIjoxNzc4MTY3MzI4fQ.PpshvVaM1bbOyaAZgoMDcB_huNAbal2vqe6utOlJouI",
    "Bacon":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/bacon.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9iYWNvbi53ZWJtIiwiaWF0IjoxNzQ2NjczNDA0LCJleHAiOjE3NzgyMDk0MDR9.ah3yXh2ZtfuM3zOPL93vdj7nJIMTTUpTBPabusnec38",
    "Turtle":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2040/turtle.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiA0MC90dXJ0bGUud2VibSIsImlhdCI6MTc0NjY3NDY3MiwiZXhwIjoxNzc4MjEwNjcyfQ.wizRSgSWOzA1PWBdFZkVI8-JOQQ5Df1Z3lQhI1PBO-I",
  };

  Map<String, String> userMatches = {};
  Map<String, Color> dropAreaColors = {};
  List<String> shuffledTexts = [];
  List<String> shuffledMediaUrls = [];
  Set<String> usedTexts = {};

  int currentPage = 0;
  final List<List<String>> pages = [
    ["Flower", "Police Officer", "Monkey"],
    ["Tree", "Entrepreneur", "Pizza"],
    ["River", "Bacon", "Turtle"],
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
          "Quiz 10",
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
                  if (currentPage < pages.length - 1) {
                    setState(() {
                      currentPage++;
                      shuffleCurrentPage();
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
                      usedTexts.add(receivedText); // prevent future drags

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
    String correctAnswer = "i'm going to the grocery store to buy food";
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

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? "Correct!" : "Incorrect! Try again."),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz 10',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MainScreen(category: 'Unit 10: Making Plans'),
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
                    "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%2010/Lesson%2039/i'm%20going%20to%20the%20grocery%20store%20to%20buy%20food.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDEwL0xlc3NvbiAzOS9pJ20gZ29pbmcgdG8gdGhlIGdyb2Nlcnkgc3RvcmUgdG8gYnV5IGZvb2Qud2VibSIsImlhdCI6MTc0NjY3NDc2NywiZXhwIjoxNzc4MjEwNzY3fQ.AUzBTPQkSi9aXnzoWAUWOq57jRcOI8wfV9xWxAAJtQk",
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
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () async {
                  final currentContext = context;

                  // update quiz score
                  await updateQuiz(
                    quizId: 'Unit 10',
                    totalScore: totalScore,
                  );

                  if (context.mounted) {
                    Navigator.pushReplacement(
                      currentContext,
                      MaterialPageRoute(
                        builder: (context) =>
                            MainScreen(category: 'Unit 10: Making Plans'),
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
