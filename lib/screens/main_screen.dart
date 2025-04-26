import 'package:flutter/material.dart';
import '../services/lesson_progress';
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
  final ScrollController _scrollController = ScrollController();
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

  void _onScroll() {
    double offset = _scrollController.offset;
    int sectionIndex = (offset / 664).floor();
    if (sectionIndex >= 0 && sectionIndex < sectionTitles.length) {
      setState(() {
        _currentSectionTitle = sectionTitles[sectionIndex];
        _currentUnitNumber = sectionIndex + 1; // Add 1 to make it 1-indexed
      });
    }
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
    int orangeCircleNumber = sectionIndex; // Unique number for orange circles
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

  Widget _buildCircle(Color color,
      {bool isQuiz = false, bool isChest = false, int? circleNumber}) {
    return GestureDetector(
      onTap: isQuiz
          ? () {
              if (circleNumber != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      switch (circleNumber) {
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
                          return Quiz1Screen(); // Fallback
                      }
                    },
                  ),
                );
              }
            }
          : isChest
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RewardScreen(rewardIndex: circleNumber ?? 0),
                    ),
                  );
                }
              : () async {
                  if (circleNumber != null) {
                    final lessonManager = LessonManager();
                    await lessonManager.updateCurrentLesson('lesson $circleNumber');
                    
                     if (!mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          switch (circleNumber) {
                            case 1:
                              return Lesson1Screen();
                            case 2:
                              return Lesson2Screen();
                            case 3:
                              return Lesson3Screen();
                            case 4:
                              return Lesson4Screen();
                            case 5:
                              return Lesson5Screen();
                            case 6:
                              return Lesson6Screen();
                            case 7:
                              return Lesson7Screen();
                            case 8:
                              return Lesson8Screen();
                            case 9:
                              return Lesson9Screen();
                            case 10:
                              return Lesson10Screen();
                            case 11:
                              return Lesson11Screen();
                            case 12:
                              return Lesson12Screen();
                            case 13:
                              return Lesson13Screen();
                            case 14:
                              return Lesson14Screen();
                            case 15:
                              return Lesson15Screen();
                            case 16:
                              return Lesson16Screen();
                            case 17:
                              return Lesson17Screen();
                            case 18:
                              return Lesson18Screen();
                            case 19:
                              return Lesson19Screen();
                            case 20:
                              return Lesson20Screen();
                            case 21:
                              return Lesson21Screen();
                            case 22:
                              return Lesson22Screen();
                            case 23:
                              return Lesson23Screen();
                            case 24:
                              return Lesson24Screen();
                            case 25:
                              return Lesson25Screen();
                            case 26:
                              return Lesson26Screen();
                            case 27:
                              return Lesson27Screen();
                            case 28:
                              return Lesson28Screen();
                            case 29:
                              return Lesson29Screen();
                            case 30:
                              return Lesson30Screen();
                            case 31:
                              return Lesson31Screen();
                            case 32:
                              return Lesson32Screen();
                            case 33:
                              return Lesson33Screen();
                            case 34:
                              return Lesson34Screen();
                            case 35:
                              return Lesson35Screen();
                            case 36:
                              return Lesson36Screen();
                            case 37:
                              return Lesson37Screen();
                            case 38:
                              return Lesson38Screen();
                            case 39:
                              return Lesson39Screen();
                            case 40:
                              return Lesson40Screen();
                            default:
                              return Lesson1Screen(); // Fallback
                          }
                        },
                      ),
                    );
                  }
                },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: isQuiz
              ? Icon(Icons.assignment, color: Colors.white, size: 36)
              : isChest
                  ? Icon(Icons.emoji_events, color: Colors.white, size: 36)
                  : circleNumber != null
                      ? Text(
                          '$circleNumber',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      : null,
        ),
      ),
    );
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
