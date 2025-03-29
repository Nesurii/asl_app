import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'asl_alphabet_screen.dart';
import 'practice_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? selectedAvatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Information',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 320, // Adjust the width of the container
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26)],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
              children: [
                _buildSectionTitle('Select Avatar'),
                _buildAvatarSelection(),
                _buildSectionTitle('Edit Name'),
                _buildTextField(nameController, 'Full Name',
                    hintText: 'Enter your full name'),
                _buildSectionTitle('Edit Email'),
                _buildTextField(emailController, 'Email',
                    hintText: 'Enter your email address'),
                _buildSectionTitle('Change Password'),
                _buildTextField(passwordController, 'New Password',
                    hintText: 'Enter a new password', obscureText: true),
                const SizedBox(height: 24),
                _buildSaveButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool obscureText = false, String? hintText}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // Added rounded corners
        ),
      ),
      obscureText: obscureText,
    );
  }

  Widget _buildAvatarSelection() {
    return GestureDetector(
      onTap: _showAvatarSelectionDialog,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                selectedAvatar != null ? AssetImage(selectedAvatar!) : null,
            backgroundColor: Colors.grey[300],
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.orange,
            child: const Icon(Icons.edit, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  void _showAvatarSelectionDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Choose an Avatar'),
        content: Wrap(
          spacing: 10,
          children: List.generate(5, (index) {
            String avatarPath = 'assets/avatars/avatar${index + 1}.png';
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedAvatar = avatarPath;
                });
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(avatarPath),
              ),
            );
          }),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedAvatar = null;
              });
              Navigator.pop(context);
            },
            child: const Text('Remove Avatar'),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
        ),
        child: const Text(
          'Save',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      currentIndex: 4,
      items: [
        _navItem('assets/icons/home_icon.png', 'Home'),
        _navItem('assets/icons/asl_alphabet_icon.png', 'Alphabet'),
        _navItem('assets/icons/practice_icon.png', 'Practice'),
        _navItem('assets/icons/leaderboard_icon.png', 'Leaderboard'),
        _navItem('assets/icons/profile_icon.png', 'Profile'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            _navigateTo(MainScreen(category: 'Unit 1: Welcome'));
            break;
          case 1:
            _navigateTo(ASLAlphabetScreen());
            break;
          case 2:
            _navigateTo(PracticeScreen());
            break;
          case 3:
            _navigateTo(LeaderboardScreen());
            break;
          case 4:
            _navigateTo(ProfileScreen());
            break;
        }
      },
    );
  }

  BottomNavigationBarItem _navItem(String assetPath, String label) {
    return BottomNavigationBarItem(
      icon: Image.asset(assetPath, width: 30, height: 30),
      label: label,
    );
  }

  void _navigateTo(Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
