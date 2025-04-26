import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'asl_alphabet_screen.dart';
import 'profile_screen.dart';
import 'practice_screen.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch this list from Supabase and sort by points DESC
    final List<Map<String, dynamic>> leaderboard = [
      {
        'name': 'Rank 1 User',
        'points': 1500,
        'avatar': Icons.person,
      },
      {
        'name': 'Rank 2 User',
        'points': 1400,
        'avatar': Icons.person,
      },
      {
        'name': 'Rank 3 User',
        'points': 1350,
        'avatar': Icons.person,
      },
      {
        'name': 'Rank 4 User',
        'points': 1200,
        'avatar': Icons.person,
      },
      // Add dummy entries until rank 10
    ];

    final topUser = leaderboard[0];
    final otherUsers = leaderboard.sublist(1, leaderboard.length);

    return Scaffold(
      appBar: AppBar(
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
        title: const Text('Leaderboard',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [
          // 🔝 Top Rank 1
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/rank1.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.2 * 255).round()),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 120,
                      color: Colors.white.withAlpha((0.15 * 255).round()),
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          child: Icon(
                            topUser['avatar'],
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.emoji_events,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  topUser['name'],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${topUser['points']} pts',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // 📋 Rank 2–10 Cards
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ListView.builder(
                itemCount: otherUsers.length,
                itemBuilder: (context, index) {
                  final user = otherUsers[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha((0.3 * 255).round()),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey,
                          child: Icon(user['avatar'], color: Colors.white),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${user['points']} pts'),
                            ],
                          ),
                        ),
                        Text(
                          '#${index + 2}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ Bottom NavBar (unchanged)
Widget _buildBottomNavBar(BuildContext context) {
  return BottomNavigationBar(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    iconSize: 30,
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.grey,
    currentIndex: 3,
    items: [
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/home_icon.png', width: 30, height: 30),
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
        icon:
            Image.asset('assets/icons/profile_icon.png', width: 30, height: 30),
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
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ASLAlphabetScreen()));
          break;
        case 2:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => PracticeScreen()));
          break;
        case 3:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LeaderboardScreen()));
          break;
        case 4:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
          break;
      }
    },
  );
}
