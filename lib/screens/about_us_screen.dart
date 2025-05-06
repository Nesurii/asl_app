import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'asl_alphabet_screen.dart';
import 'practice_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/banner.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Welcome to Our App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              'This app is designed to help users learn and practice American Sign Language in a fun and interactive way. '
              'With AI-powered recognition and guided exercises, mastering American Sign Language has never been easier!',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            const Text(
              'Meet Our Team',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildDeveloperCard(
                'Judith Balatinsayo',
                'Data Analytics',
                'assets/images/developer1.jpg',
                'judithbalatinsayo@gmail.com',
                '0921 623 4954'),
            _buildDeveloperCard(
                'Neslie Marie Colasito',
                'Backend Developer',
                'assets/images/developer2.jpg',
                'nesurii@gmail.com',
                '0908 663 5062'),
            _buildDeveloperCard(
                'Jade Airin Judin',
                'Frontend Developer',
                'assets/images/developer3.jpg',
                'jadeairinjudin@gmail.com',
                '0947 240 7430'),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: [
          _buildNavItem('assets/icons/home_icon.png', 'Home'),
          _buildNavItem('assets/icons/asl_alphabet_icon.png', 'ASL Alphabet'),
          _buildNavItem('assets/icons/practice_icon.png', 'Practice'),
          _buildNavItem('assets/icons/leaderboard_icon.png', 'Leaderboard'),
          _buildNavItem('assets/icons/profile_icon.png', 'Profile',
              isProfile: true),
        ],
        currentIndex: 4, // Profile tab highlighted
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _handleNavigation(context, index);
        },
      ),
    );
  }

  Widget _buildDeveloperCard(
      String name, String role, String imagePath, String email, String phone) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 8),
        Text(name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(role, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 8),
        _buildContactInfo(Icons.email, email),
        const SizedBox(height: 5),
        _buildContactInfo(Icons.phone, phone),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 18, color: Colors.orange),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(String assetPath, String label,
      {bool isProfile = false}) {
    return BottomNavigationBarItem(
      icon: Image.asset(assetPath, width: 30, height: 30),
      label: label,
    );
  }

  void _handleNavigation(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MainScreen(category: 'Unit 1: Welcome')));
        break;
      case 1:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ASLAlphabetScreen()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => PracticeScreen()));
        break;
      case 3:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LeaderboardScreen()));
        break;
      case 4:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        break;
    }
  }
}
