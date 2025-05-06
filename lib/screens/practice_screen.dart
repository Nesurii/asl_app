import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'asl_alphabet_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';
import 'unit1practice_screen.dart';
import 'unit2practice_screen.dart';
import 'unit3practice_screen.dart';
import 'unit4practice_screen.dart';
import 'unit5practice_screen.dart';
import 'unit6practice_screen.dart';
import 'unit7practice_screen.dart';
import 'unit8practice_screen.dart';
import 'unit9practice_screen.dart';
import 'unit10practice_screen.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    if (index == _currentIndex) return;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Practice',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          int lessonNumber = index + 1;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              onPressed: () {
                Widget screen;
                switch (lessonNumber) {
                  case 1:
                    screen = Unit1PracticeScreen();
                    break;
                  case 2:
                    screen = Unit2PracticeScreen();
                    break;
                  case 3:
                    screen = Unit3PracticeScreen();
                    break;
                  case 4:
                    screen = Unit4PracticeScreen();
                    break;
                  case 5:
                    screen = Unit5PracticeScreen();
                    break;
                  case 6:
                    screen = Unit6PracticeScreen();
                    break;
                  case 7:
                    screen = Unit7PracticeScreen();
                    break;
                  case 8:
                    screen = Unit8PracticeScreen();
                    break;
                  case 9:
                    screen = Unit9PracticeScreen();
                    break;
                  case 10:
                    screen = Unit10PracticeScreen();
                    break;
                  default:
                    return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => screen),
                );
              },
              child: Text("Unit $lessonNumber: Practice",
                  style: TextStyle(fontSize: 18.0, color: Colors.black)),
            ),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNav(),
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
