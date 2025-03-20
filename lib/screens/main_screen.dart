import 'package:flutter/material.dart';
import 'category_selector_screen.dart';
import 'asl_alphabet_screen.dart';
import 'leaderboard_screen.dart';
import 'practice_screen.dart';
import 'profile_screen.dart';
import 'lesson_screen.dart';
import 'quiz_screen.dart';
import 'reward_screen.dart';

class MainScreen extends StatefulWidget {
  final String category;

  const MainScreen({super.key, required this.category});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final int _currentIndex = 0;

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
          Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 100, bottom: 40),
                  itemCount: 60,
                  reverse: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    int cycleIndex = index % 6;
                    int lessonNumber = (index ~/ 6) * 4 +
                        (cycleIndex < 4 ? cycleIndex + 1 : 4);

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: index % 2 == 0
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          if (cycleIndex < 4)
                            _buildLessonCircle(lessonNumber)
                          else if (cycleIndex == 4)
                            _buildQuizCircle((index ~/ 6) + 1)
                          else
                            _buildChest((index ~/ 6) % 10),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          _buildFloatingHeader(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildFloatingHeader() {
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
            color: Colors.orange,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.2 * 255).toInt()),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.assignment,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                widget.category,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/icons/home_icon.png',
                width: 30, height: 30),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/asl_alphabet_icon.png',
              width: 30, height: 30),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/practice_icon.png',
              width: 30, height: 30),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/leaderboard_icon.png',
              width: 30, height: 30),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/profile_icon.png',
              width: 30, height: 30),
          label: '',
        ),
      ],
    );
  }

  Widget _buildLessonCircle(int number) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LessonScreen(
              lessonNumber: 1,
              videoUrl: 'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/you%20are.mp4?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL3lvdSBhcmUubXA0IiwiaWF0IjoxNzQyNDY4MjE2LCJleHAiOjE5MDAxNDgyMTZ9.b7Ix98pGOpNmGSbYj8EETddKZAUohdgHPJzp6bz0Fqg',
              )),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 80),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          '$number',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildQuizCircle(int quizNumber) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizScreen(quizNumber: quizNumber),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 80),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          'Q$quizNumber',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildChest(int rewardIndex) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RewardScreen(rewardIndex: rewardIndex)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 80),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/icons/chest.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
