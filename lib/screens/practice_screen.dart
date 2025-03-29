import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'asl_alphabet_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';
import 'lesson1practice_screen.dart';
import 'lesson2practice_screen.dart';
import 'lesson3practice_screen.dart';
import 'lesson4practice_screen.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});
  

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(category: 'Unit 1: Welcome')),
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Practice',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(category: 'Unit 1: Welcome'),
                ),
              );
            },
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: TabBar(
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              labelColor: Colors.black,
              tabs: [
                Tab(text: "1-10"),
                Tab(text: "11-20"),
                Tab(text: "21-30"),
                Tab(text: "31-40"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(4, (tabIndex) {
            int startLesson = tabIndex * 10 + 1;
            //int endLesson = startLesson + 9;
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                int lessonNumber = startLesson + index;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    onPressed: () {
                      // Navigate directly to the corresponding lesson screen
                      if (lessonNumber == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Lesson1PracticeScreen()),
                        );
                      } else if (lessonNumber == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Lesson2PracticeScreen()),
                        );
                      } else if (lessonNumber == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Lesson3PracticeScreen()),
                        );
                      } else if (lessonNumber == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Lesson4PracticeScreen()),
                        );
                      }
                      // Add additional cases for other lessons
                    },
                    child: Text("Lesson $lessonNumber: Practice",
                        style: TextStyle(fontSize: 18.0, color: Colors.black)),
                  ),
                );
              },
            );
          }),
        ),
        bottomNavigationBar: _buildBottomNav(),
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
            icon: Image.asset('assets/icons/home_icon.png',
                width: 30, height: 30),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/asl_alphabet_icon.png',
                width: 30, height: 30),
            label: 'ASL Alphabets'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/practice_icon.png',
                width: 30, height: 30),
            label: 'Practice'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/leaderboard_icon.png',
                width: 30, height: 30),
            label: 'Leaderboard'),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/profile_icon.png',
                width: 30, height: 30),
            label: 'Profile'),
      ],
    );
  }
}
