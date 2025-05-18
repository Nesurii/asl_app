import 'package:flutter/material.dart';
import '../services/current_user.dart';
import '../services/state_progress.dart';
import 'category_selector_screen.dart';
import 'asl_alphabet_screen.dart';
import 'practice_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';
import 'reward_screen.dart';
import 'lesson1_screen.dart';
import 'lesson2_screen.dart';
import 'lesson3_screen.dart';
import 'lesson4_screen.dart';
import 'lesson5_screen.dart';
import 'lesson6_screen.dart';
import 'lesson7_screen.dart';
import 'lesson8_screen.dart';
import 'lesson9_screen.dart';
import 'lesson10_screen.dart';
import 'lesson11_screen.dart';
import 'lesson12_screen.dart';
import 'lesson13_screen.dart';
import 'lesson14_screen.dart';
import 'lesson15_screen.dart';
import 'lesson16_screen.dart';
import 'lesson17_screen.dart';
import 'lesson18_screen.dart';
import 'lesson19_screen.dart';
import 'lesson20_screen.dart';
import 'lesson21_screen.dart';
import 'lesson22_screen.dart';
import 'lesson23_screen.dart';
import 'lesson24_screen.dart';
import 'lesson25_screen.dart';
import 'lesson26_screen.dart';
import 'lesson27_screen.dart';
import 'lesson28_screen.dart';
import 'lesson29_screen.dart';
import 'lesson30_screen.dart';
import 'lesson31_screen.dart';
import 'lesson32_screen.dart';
import 'lesson33_screen.dart';
import 'lesson34_screen.dart';
import 'lesson35_screen.dart';
import 'lesson36_screen.dart';
import 'lesson37_screen.dart';
import 'lesson38_screen.dart';
import 'lesson39_screen.dart';
import 'lesson40_screen.dart';
import 'quiz1_screen.dart';
import 'quiz2_screen.dart';
import 'quiz3_screen.dart';
import 'quiz4_screen.dart';
import 'quiz5_screen.dart';
import 'quiz6_screen.dart';
import 'quiz7_screen.dart';
import 'quiz8_screen.dart';
import 'quiz9_screen.dart';
import 'quiz10_screen.dart';

class MainScreen extends StatefulWidget {
  final String category;

  const MainScreen({super.key, required this.category});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final int _currentIndex = 0;
  String _currentSectionTitle = "";
  int _currentUnitNumber = 0;
  int chestCircleCounter = 1; // Counter for orange circles
  final lessonManager = LessonManager();
  final ScrollController _scrollController = ScrollController();
  //List<int> unlockedLessons = [];
  final List<String> sectionTitles = [
    'Welcome',
    'Getting Started',
    'Getting to Know You',
    'Numbers',
    'Time',
    'Family and Friends',
    'School Days',
    'My Daily Routine',
    'Describing People',
    'My Plans'
  ];

  @override
  void initState() {
    super.initState();
    _currentSectionTitle = widget.category.split(":")[1].trim();
    _currentUnitNumber =
        int.tryParse(widget.category.split(":")[0].split(" ")[1]) ?? 0;
    _scrollController.addListener(_onScroll);

    // Jump to specific section after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _jumpToSection();
    });
  }

  void _jumpToSection() {
    if (_currentUnitNumber > 0 && _currentUnitNumber <= sectionTitles.length) {
      double offset = (_currentUnitNumber - 1) * 666; // Adjust if needed
      _scrollController.jumpTo(offset);
    }
  }

  Future<void> _onScroll() async {
    double offset = _scrollController.offset;
    int sectionIndex = (offset / 664).floor();
    if (sectionIndex >= 0 && sectionIndex < sectionTitles.length) {
      setState(() {
        _currentSectionTitle = sectionTitles[sectionIndex];
        _currentUnitNumber = sectionIndex + 1; // Add 1 to make it 1-indexed
      });
    }
    await lessonManager
        .updateCurrentUnit('$_currentUnitNumber : $_currentSectionTitle');
  }

  void _onTabTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(category: widget.category)),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ASLAlphabetScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PracticeScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LeaderboardScreen()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.only(top: 100, bottom: 20),
            itemCount: sectionTitles.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(height: 2),
                  _buildDivider(index),
                  SizedBox(height: 2),
                  _buildCircles(index),
                  SizedBox(height: 50),
                ],
              );
            },
          ),
          _buildFloatingHeader(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildDivider(int section) {
    String title = section < sectionTitles.length
        ? sectionTitles[section]
        : 'Unknown Section';
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Text(
          '------- $title ------',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildCircles(int sectionIndex) {
    int startNumber =
        sectionIndex * 4 + 1; // Start number for blue circles (1, 5, 9, 13,...)
    int orangeCircleNumber =
        sectionIndex + 1; // Unique number for orange circles
    int quizNumber = sectionIndex + 1; // Unique quiz number

    return Column(
      children: List.generate(6, (index) {
        int circleNumber = (index < 4) ? startNumber + index : 0;

        return Row(
          mainAxisAlignment:
              index.isEven ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: _buildCircle(
                index == 4
                    ? Colors.red // Quiz Circle (Red)
                    : index == 5
                        ? Colors.orange // Chest Circle (Orange)
                        : Colors.blue, // Lesson Circles (Blue)
                isQuiz: index == 4,
                isChest: index == 5,
                circleNumber: index == 4
                    ? quizNumber
                    : (index == 5 ? orangeCircleNumber : circleNumber),
              ),
            ),
          ],
        );
      }),
    );
  }

  bool isLessonUnlocked(int lessonNumber) {
    // Lesson 1 is always unlocked
    if (lessonNumber == 1) return true;

    final completedLessons = currentUserData.progress?['lessons_completed'];
    final quizScores = currentUserData.progress?['quiz_scores'];

    if (completedLessons is! List || quizScores is! Map<String, dynamic>) {
      return false;
    }

    final prevLessonId = 'lesson ${lessonNumber - 1}';

    // Unlock normally if previous lesson is completed
    final prevLessonCompleted = completedLessons.contains(prevLessonId);

    // Additional rule: if lesson is start of a new unit (5, 9, 13, ...)
    final isUnitStart = (lessonNumber - 1) % 4 == 0;

    if (isUnitStart) {
      final prevUnit = (lessonNumber - 1) ~/ 4;
      final prevQuizKey = 'Unit $prevUnit';
      final prevQuizScore = quizScores[prevQuizKey];

      final quizPerfect = prevQuizScore == 100;

      return prevLessonCompleted && quizPerfect;
    }

    return prevLessonCompleted;
  }

  bool isChestUnlocked(int chestNumber) {
    final quizScores = currentUserData.progress?['quiz_scores'];
    if (quizScores == null || quizScores is! Map<String, dynamic>) return false;

    final quizKey = 'Unit $chestNumber';
    final score = quizScores[quizKey];

    debugPrint('Checking chest unlock for $quizKey → score: $score');

    return score == 100;
  }

  bool isUnitCompleted(int quizNumber) {
    final completedLessons = currentUserData.progress?['lessons_completed'];
    if (completedLessons is! List) return false;

    // Lessons required: Lesson (quizNumber * 4 - 3) to Lesson (quizNumber * 4)
    final start = (quizNumber - 1) * 4 + 1;
    final end = quizNumber * 4;

    for (int i = start; i <= end; i++) {
      if (!completedLessons.contains('lesson $i')) return false;
    }

    return true;
  }

  Widget _buildCircle(Color color,
      {bool isQuiz = false, bool isChest = false, int? circleNumber}) {
    // Determine if the lesson, quiz, or chest is locked
    final isLocked = circleNumber != null &&
        ((!isQuiz &&
                !isChest &&
                !isLessonUnlocked(circleNumber)) || // lock lessons
            (isQuiz && !isUnitCompleted(circleNumber)) || // lock quizzes
            (isChest &&
                !isChestUnlocked(circleNumber)) // lock chests unless quiz = 100
        );

    return GestureDetector(
      onTap: isLocked
          ? () {
              // Show locked message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isChest
                        ? 'Score a perfect 100 on Quiz $circleNumber to unlock the reward!'
                        : isQuiz
                            ? 'Complete all 4 lessons in this unit to unlock the quiz!'
                            : 'Complete previous lessons to unlock.',
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          : isQuiz
              ? () async {
                  // Navigate to quiz screen when unlocked
                  if (circleNumber != null) {
                    // You can show a loading indicator here if necessary
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => _getQuizScreen(circleNumber)),
                    );
                  }
                }
              : isChest
                  ? () async {
                      // Navigate to reward screen when chest is unlocked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RewardScreen(rewardIndex: circleNumber ?? 0)),
                      );
                    }
                  : () async {
                      // Navigate to lesson screen when unlocked
                      if (circleNumber != null) {
                        await lessonManager
                            .updateCurrentLesson('Lesson $circleNumber');

                        if (!mounted) return;

                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  _getLessonScreen(circleNumber)),
                        );

                        if (result == true) {
                          setState(
                              () {}); // refresh the main screen after a lesson is completed
                        }
                      }
                    },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isLocked ? Colors.grey : color, // Locking means greying out
        ),
        child: Center(
          child: isLocked
              ? const Icon(Icons.lock, color: Colors.white, size: 36)
              : isQuiz
                  ? const Icon(Icons.assignment,
                      color: Colors.white, size: 36) // Quiz icon
                  : isChest
                      ? const Icon(Icons.emoji_events,
                          color: Colors.white, size: 36) // Chest icon
                      : Text(
                          '${circleNumber ?? ''}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ), // Display lesson number
        ),
      ),
    );
  }

  Widget _getLessonScreen(int lessonNumber) {
    switch (lessonNumber) {
      case 1:
        return Lesson1Screen(lessonId: 'lesson $lessonNumber');
      case 2:
        return Lesson2Screen(lessonId: 'lesson $lessonNumber');
      case 3:
        return Lesson3Screen(lessonId: 'lesson $lessonNumber');
      case 4:
        return Lesson4Screen(lessonId: 'lesson $lessonNumber');
      case 5:
        return Lesson5Screen(lessonId: 'lesson $lessonNumber');
      case 6:
        return Lesson6Screen(lessonId: 'lesson $lessonNumber');
      case 7:
        return Lesson7Screen(lessonId: 'lesson $lessonNumber');
      case 8:
        return Lesson8Screen(lessonId: 'lesson $lessonNumber');
      case 9:
        return Lesson9Screen(lessonId: 'lesson $lessonNumber');
      case 10:
        return Lesson10Screen(lessonId: 'lesson $lessonNumber');
      case 11:
        return Lesson11Screen(lessonId: 'lesson $lessonNumber');
      case 12:
        return Lesson12Screen(lessonId: 'lesson $lessonNumber');
      case 13:
        return Lesson13Screen(lessonId: 'lesson $lessonNumber');
      case 14:
        return Lesson14Screen(lessonId: 'lesson $lessonNumber');
      case 15:
        return Lesson15Screen(lessonId: 'lesson $lessonNumber');
      case 16:
        return Lesson16Screen(lessonId: 'lesson $lessonNumber');
      case 17:
        return Lesson17Screen(lessonId: 'lesson $lessonNumber');
      case 18:
        return Lesson18Screen(lessonId: 'lesson $lessonNumber');
      case 19:
        return Lesson19Screen(lessonId: 'lesson $lessonNumber');
      case 20:
        return Lesson20Screen(lessonId: 'lesson $lessonNumber');
      case 21:
        return Lesson21Screen(lessonId: 'lesson $lessonNumber');
      case 22:
        return Lesson22Screen(lessonId: 'lesson $lessonNumber');
      case 23:
        return Lesson23Screen(lessonId: 'lesson $lessonNumber');
      case 24:
        return Lesson24Screen(lessonId: 'lesson $lessonNumber');
      case 25:
        return Lesson25Screen(lessonId: 'lesson $lessonNumber');
      case 26:
        return Lesson26Screen(lessonId: 'lesson $lessonNumber');
      case 27:
        return Lesson27Screen(lessonId: 'lesson $lessonNumber');
      case 28:
        return Lesson28Screen(lessonId: 'lesson $lessonNumber');
      case 29:
        return Lesson29Screen(lessonId: 'lesson $lessonNumber');
      case 30:
        return Lesson30Screen(lessonId: 'lesson $lessonNumber');
      case 31:
        return Lesson31Screen(lessonId: 'lesson $lessonNumber');
      case 32:
        return Lesson32Screen(lessonId: 'lesson $lessonNumber');
      case 33:
        return Lesson33Screen(lessonId: 'lesson $lessonNumber');
      case 34:
        return Lesson34Screen(lessonId: 'lesson $lessonNumber');
      case 35:
        return Lesson35Screen(lessonId: 'lesson $lessonNumber');
      case 36:
        return Lesson36Screen(lessonId: 'lesson $lessonNumber');
      case 37:
        return Lesson37Screen(lessonId: 'lesson $lessonNumber');
      case 38:
        return Lesson38Screen(lessonId: 'lesson $lessonNumber');
      case 39:
        return Lesson39Screen(lessonId: 'lesson $lessonNumber');
      case 40:
        return Lesson40Screen(lessonId: 'lesson $lessonNumber');
      default:
        return Lesson1Screen(lessonId: 'lesson $lessonNumber');
    }
  }

  Widget _getQuizScreen(int quizNumber) {
    switch (quizNumber) {
      case 1:
        return Quiz1Screen();
      case 2:
        return Quiz2Screen();
      case 3:
        return Quiz3Screen();
      case 4:
        return Quiz4Screen();
      case 5:
        return Quiz5Screen();
      case 6:
        return Quiz6Screen();
      case 7:
        return Quiz7Screen();
      case 8:
        return Quiz8Screen();
      case 9:
        return Quiz9Screen();
      case 10:
        return Quiz10Screen();
      default:
        return Quiz1Screen();
    }
  }

  final Map<String, Color> sectionColors = {
    'Welcome': Colors.orange,
    'Getting Started': Colors.green,
    'Getting to Know You': Colors.purple,
    'Numbers': Colors.red,
    'Time': Color(0xffE53888),
    'Family and Friends': Colors.blue,
    'School Days': Colors.pink,
    'My Daily Routine': Colors.indigo,
    'Describing People': Color(0xffF4CE14),
    'My Plans': Color(0xff00B8A9),
  };

// Floating header color change based on the module
  Widget _buildFloatingHeader() {
    Color headerColor = sectionColors[_currentSectionTitle] ?? Colors.orange;
    return Positioned(
      top: 25,
      left: 16,
      right: 16,
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CategorySelectorScreen()),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: headerColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.2 * 255).round()),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.assignment, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                'Unit $_currentUnitNumber: $_currentSectionTitle',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon:
              Image.asset('assets/icons/home_icon.png', width: 30, height: 30),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/asl_alphabet_icon.png',
              width: 30, height: 30),
          label: 'ASL Alphabets',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/practice_icon.png',
              width: 30, height: 30),
          label: 'Practice',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/leaderboard_icon.png',
              width: 30, height: 30),
          label: 'Leaderboard',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/profile_icon.png',
              width: 30, height: 30),
          label: 'Profile',
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}
