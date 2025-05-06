import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'practice_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';

class ASLAlphabetScreen extends StatelessWidget {
  const ASLAlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let\'s learn ASL Alphabet!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Memorizing the American Sign Language Alphabet (ASL alphabet in short) '
                      'is one of the most important steps in learning American Sign Language.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 26,
                  itemBuilder: (context, index) {
                    String letter = String.fromCharCode(97 + index);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ZoomedImageScreen(letter: letter),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'image_$letter',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image.asset(
                                  'assets/alphabet_images/$letter.jpg',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Icon(Icons.broken_image,
                                          size: 40, color: Colors.red),
                                    );
                                  },
                                ),
                                Container(
                                  color: Colors.black54,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 30),
                                  child: Text(
                                    letter.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        currentIndex: 1,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home_icon.png',
                width: 30, height: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/asl_alphabet_icon.png',
                width: 30, height: 30),
            label: 'ASL Alphabet',
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
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MainScreen(category: 'Unit 1: Welcome')),
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
        },
      ),
    );
  }
}

class ZoomedImageScreen extends StatelessWidget {
  final String letter;
  const ZoomedImageScreen({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Hero(
              tag: 'image_$letter',
              child: Center(
                child: Image.asset(
                  'assets/alphabet_images/$letter.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
