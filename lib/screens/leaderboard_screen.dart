import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'asl_alphabet_screen.dart';
import 'profile_screen.dart';
import 'practice_screen.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text('Leaderboard',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          _buildPodium(),
          Expanded(child: _buildLeaderboardList()),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildPodium() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildPodiumPlace(
            2, "assets/avatars/default.png", 80, Colors.grey[300]!),
        _buildPodiumPlace(1, "assets/avatars/default.png", 100, Colors.amber),
        _buildPodiumPlace(
            3, "assets/avatars/default.png", 80, Colors.brown[300]!),
      ],
    );
  }

  Widget _buildPodiumPlace(
      int rank, String avatar, double height, Color color) {
    return Column(
      children: [
        CircleAvatar(backgroundImage: AssetImage(avatar), radius: 30),
        Container(
          width: 70,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Text("$rank",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildLeaderboardList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/avatars/default.png"),
              radius: 25,
            ),
            title: Text("User Name"),
            subtitle: Text("0 pts"),
            trailing: Text("${index + 4}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      selectedItemColor: Colors.orange, // Highlight sa label lang
      unselectedItemColor: Colors.grey, // Normal na kulay sa di-selected tabs
      currentIndex: 3, // Set to leaderboard tab by default
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
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(
                    category:
                        'Unit 1: Welcome'), // Palitan ang 'Unit: 1' ng tamang unit kung kailangan
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
}
