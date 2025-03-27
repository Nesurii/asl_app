import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'asl_alphabet_screen.dart';
import 'practice_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  File? imageFile;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() => imageFile = File(pickedFile.path));
      _showConfirmDialog();
    }
  }

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirm Upload'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imageFile != null)
              Image.file(imageFile!, height: 150)
            else
              const SizedBox.shrink(),
            const SizedBox(height: 10),
            const Text('Are you sure you want to upload this picture?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              debugPrint('Image confirmed: ${imageFile?.path}');
              Navigator.pop(context);
            },
            child: const Text('Confirm'),
          ),
          TextButton(
            onPressed: () {
              setState(() => imageFile = null);
              Navigator.pop(context);
            },
            child: const Text('Remove'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Information',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16.0),
          decoration: boxDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Change Photo'),
              _buildUploadButton(),
              const SizedBox(height: 16),
              _buildSectionTitle('Edit Name'),
              _buildTextField(nameController, 'Full Name'),
              const SizedBox(height: 16),
              _buildSectionTitle('Edit Email'),
              _buildTextField(emailController, 'Email'),
              const SizedBox(height: 16),
              _buildSectionTitle('Change Password'),
              _buildTextField(passwordController, 'New Password',
                  obscureText: true),
              const SizedBox(height: 24),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      obscureText: obscureText,
    );
  }

  Widget _buildUploadButton() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
          backgroundColor: Colors.grey[300],
        ),
        Positioned(
          bottom: 0,
          child: GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // TODO: Implement save functionality
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[800],
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.grey, width: 2),
        ),
        elevation: 5,
      ),
      child: const Text(
        'Save',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _navItem('assets/icons/home_icon.png'),
        _navItem('assets/icons/asl_alphabet_icon.png'),
        _navItem('assets/icons/practice_icon.png'),
        _navItem('assets/icons/leaderboard_icon.png'),
        _navItem('assets/icons/profile_icon.png', isHighlighted: true),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            _navigateTo(MainScreen(category: 'Unit 1'));
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

  BottomNavigationBarItem _navItem(String assetPath,
      {bool isHighlighted = false}) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: isHighlighted ? const EdgeInsets.all(8) : EdgeInsets.zero,
        decoration: isHighlighted
            ? BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        child: Image.asset(assetPath, width: 30, height: 30),
      ),
      label: '',
    );
  }

  void _navigateTo(Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

const BoxDecoration boxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(12)),
  boxShadow: [
    BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
  ],
);
