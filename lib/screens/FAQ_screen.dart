import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'asl_alphabet_screen.dart';
import 'practice_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';

class FAQScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'What is ASL?',
      'answer':
          'ASL stands for American Sign Language, a visual language used by the Deaf community.'
    },
    {
      'question': 'How can I memorize the ASL alphabet faster?',
      'answer':
          'Consistent practice is key! If you’re passionate about learning ASL, you’ll pick it up in no time. Our app is here to help—just visit the ASL Alphabet tab anytime to review and perfect each letter.'
    },
    {
      'question': 'Can I use this app offline?',
      'answer':
          'Unfortunately, this app requires an internet connection to function properly.'
    },
    {
      'question': 'Is this app suitable for beginners?',
      'answer':
          'Absolutely! This app is designed for all skill levels, especially beginners.'
    },
    {
      'question': 'Can the images and videos be zoomed in?',
      'answer':
          'Yes! Just tap on the image or video, and it will go full screen, allowing you to zoom in on the content.'
    },
    {
      'question': 'Is there a way to track my progress and achievements?',
      'answer':
          'Yes! You can check your achievements in the Profile or Leaderboard sections.'
    },
    {
      'question': 'Do I need to sign in to use the app?',
      'answer':
          'Yes, signing in is required so we can save your progress, track your achievements, and give you a more personalized learning experience.'
    },
    {
      'question': 'Are there quizzes or tests to practice?',
      'answer':
          'Yes! Our app includes 10 units, each with multiple lessons. Every lesson has an activity to help reinforce learning and check your understanding. At the end of each unit, there’s a quiz that summarizes the lessons and evaluates what you’ve learned. We also have a dedicated Practice tab, so users can review and practice anytime they want.'
    },
    {
      'question': 'What are the numbered circles on the main screen?',
      'answer':
          'Those are the lessons. Each circle represents a specific lesson within a unit. Tap on a circle to open and start learning that lesson.'
    },
    {
      'question': 'What if I forget a sign?',
      'answer': 'Visit the ASL Alphabet tab to review.',
    },
    {
      'question': 'How do I earn points?',
      'answer':
          'Points are awarded for correct activity/quiz answers (10 points per item).',
    },
    {
      'question': 'Can I redo an activity and quiz?',
      'answer':
          ' Yes, you can retake activities and quizzes to improve your score and learning.',
    },
  ];

  FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Frequently Asked Questions',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              faqs[index]['question']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(faqs[index]['answer']!),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        currentIndex: 4,
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
                  builder: (context) => MainScreen(category: 'Unit 1: Welcome'),
                ),
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
