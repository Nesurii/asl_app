import 'package:flutter/material.dart';
import 'dart:math';
import '../services/quiz_progress.dart';
import 'video_player_widget.dart';
import 'main_screen.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(home: Quiz9Screen()));
}

class Quiz9Screen extends StatefulWidget {
  const Quiz9Screen({super.key});

  @override
  State<Quiz9Screen> createState() => _Quiz9ScreenState();
}

class _Quiz9ScreenState extends State<Quiz9Screen> {
  int totalScore = 0;
  final AudioPlayer player = AudioPlayer();

  final Map<String, String> correctMatches = {
    "Ethnicity":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2033/ethnicity.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDMzL2V0aG5pY2l0eS53ZWJtIiwiaWF0IjoxNzQ2NjcwMjY4LCJleHAiOjE3NzgyMDYyNjh9.CV--QED6o-r03SIrypO481nllRPuebrJpDjNRjzhK_0",
    "Ponytail":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2034/ponytail.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM0L3Bvbnl0YWlsLndlYm0iLCJpYXQiOjE3NDY2ODgxMTksImV4cCI6MTc3ODIyNDExOX0.3KdOkK9PB_Xd07WilvRE3s3zwYcydqBtr6gUxjA6E-0",
    "Doctor":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2036/doctor.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM2L2RvY3Rvci53ZWJtIiwiaWF0IjoxNzQ2NjM4NzczLCJleHAiOjE3NzgxNzQ3NzN9.8K0CZRLsKIgdHj21Xl6ZLZysumUTvgm3p7b5pulApWM",
    "Pregnant":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2033/to%20be%20pregnant.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDMzL3RvIGJlIHByZWduYW50LndlYm0iLCJpYXQiOjE3NDY2Njk4NjEsImV4cCI6MTc3ODIwNTg2MX0.qvWbBCEfVaLzw7BbTWWx6ZBb7RAnkT-Q50352iXF8EM",
    "Cap":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2035/cap.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM1L2NhcC53ZWJtIiwiaWF0IjoxNzQ2Njc0MzQ1LCJleHAiOjE3NzgyMTAzNDV9.1oswLjCoyKii9rmNiHOXRWAb2aIVPd2sxF1YNl_6W6s",
    "Medicine":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2036/medicine.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM2L21lZGljaW5lLndlYm0iLCJpYXQiOjE3NDY2NzE3OTEsImV4cCI6MTc3ODIwNzc5MX0.C4moJR7lqCFqfmRgBgE5hpBd4t6L0K7s4kwboemDUow",
    "Beard":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2034/beard.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM0L2JlYXJkLndlYm0iLCJpYXQiOjE3NDY2Njg0NTksImV4cCI6MTc3ODIwNDQ1OX0.8vIUO-nblrCZRaod0_JMHX59ohzp2RQ6T4ShpaB7Hn0",
    "Shoes":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2035/shoes.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM1L3Nob2VzLndlYm0iLCJpYXQiOjE3NDY2NzEzMzUsImV4cCI6MTc3ODIwNzMzNX0.jw6qPs9DafB_2cyNCgcDnSTQr3FfArlNzxb6OvW1jKU",
    "Cold":
        "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2036/cold.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM2L2NvbGQud2VibSIsImlhdCI6MTc0NjY3MTU0NywiZXhwIjoxNzc4MjA3NTQ3fQ.BV6yqp_WmnZt8Rc4pPOnJx1VSzFeJFY8OG2LMzQI1-E",
  };

  Map<String, String> userMatches = {};
  Map<String, Color> dropAreaColors = {};
  List<String> shuffledTexts = [];
  List<String> shuffledMediaUrls = [];
  Set<String> usedTexts = {};
  Set<String> answeredItems = Set<String>();

  int currentPage = 0;
  final List<List<String>> pages = [
    ["Ethnicity", "Ponytail", "Doctor"],
    ["Pregnant", "Cap", "Medicine"],
    ["Beard", "Shoes", "Cold"],
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
          "Quiz 9",
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
    String correctAnswer = "my sister is pregnant so she gained weight";
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
        title: Text('Quiz 9',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MainScreen(category: 'Unit 9: Describing people'),
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
                    "https://jrywkphkycxntswqyfyq.supabase.co/storage/v1/object/sign/asl-lessons/Unit%209/Lesson%2036/my%20sister%20is%20pregnant%20so%20she%20gained%20weight.webm?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzNiOTE4MzBhLTZiYzMtNDdhZC04OTRjLTZlYmQ5N2U1YzMyYyJ9.eyJ1cmwiOiJhc2wtbGVzc29ucy9Vbml0IDkvTGVzc29uIDM2L215IHNpc3RlciBpcyBwcmVnbmFudCBzbyBzaGUgZ2FpbmVkIHdlaWdodC53ZWJtIiwiaWF0IjoxNzQ2Njc0NTQ4LCJleHAiOjE3NzgyMTA1NDh9.iQ-ejgPAcdXKcSfjpCfkp0gtWJG_vHaA53vgPQK2bSQ",
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
                      quizId: 'Unit 9',
                      totalScore: totalScore,
                    );

                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MainScreen(category: 'Unit 9: Describing people'),
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
