import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/current_user.dart';
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
  bool isEditing = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();

    nameController.text = "${currentUserData.account?['username']}"; 
    emailController.text =
        "${currentUserData.account?['email']}"; 
    passwordController.text =
        "${currentUserData.account?['password']}"; 
    selectedAvatar = currentUserData.account?['avatar_url']; // Replace with saved avatar path if available
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26)],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Avatar'),
                _buildAvatarSelection(),
                _buildSectionTitle('Name'),
                _buildTextField(nameController, 'Full Name',
                    hintText: 'Enter your full name'),
                _buildSectionTitle('Email'),
                _buildTextField(emailController, 'Email',
                    hintText: 'Enter your email address'),
                _buildSectionTitle('Password'),
                _buildTextField(passwordController, 'New Password',
                    hintText: 'Enter a new password', obscureText: true),
                const SizedBox(height: 24),
                _buildSaveOrEditButton(),
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
      readOnly: !isEditing,
      obscureText: label == 'New Password' ? _obscurePassword : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        filled: !isEditing,
        fillColor: !isEditing ? Colors.grey[200] : Colors.white,
        suffixIcon: label == 'New Password'
            ? IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              )
            : null,
      ),
    );
  }

  Widget _buildAvatarSelection() {
    return GestureDetector(
      onTap: isEditing ? _showAvatarSelectionDialog : null,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                selectedAvatar != null ? AssetImage(selectedAvatar!) : null,
            backgroundColor: Colors.grey[300],
            child: selectedAvatar == null
                ? Icon(Icons.person, size: 50, color: Colors.white)
                : null,
          ),
          if (isEditing)
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
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.width * 0.8,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(6, (index) {
              String avatarPath = 'assets/avatars/avatar${index + 1}.png';
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAvatar = avatarPath; // only update locally
                  });
                  Navigator.pop(context); // close the dialog
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(avatarPath),
                ),
              );
            }),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedAvatar = null; // just clear the selection
              });
              Navigator.pop(context);
            },
            child: const Text('Remove Avatar'),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveOrEditButton() {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () async {
          if (isEditing) {
            final user = Supabase.instance.client.auth.currentUser;

            if (user != null) {
              try {
                final updatedName = nameController.text.trim();
                final updatedEmail = emailController.text.trim();
                final updatedPassword = passwordController.text.trim();

                Map<String, dynamic> updates = {};

                if (updatedName != currentUserData.account?['username']) {
                  updates['username'] = updatedName;
                }
                if (updatedEmail != currentUserData.account?['email']) {
                  updates['email'] = updatedEmail;
                }
                if (updatedPassword != currentUserData.account?['password']) {
                  updates['password'] = updatedPassword;
                }
                if (selectedAvatar != currentUserData.account?['avatar_url']) {
                  updates['avatar_url'] = selectedAvatar;
                }

                if (updates.isNotEmpty) {
                  await Supabase.instance.client
                      .from('user_account')
                      .update(updates)
                      .eq('id', user.id);

                  if (updates.containsKey('email') || updates.containsKey('password')) {
                    await Supabase.instance.client.auth.updateUser(UserAttributes(
                      email: updates['email'] ?? updatedEmail,
                      password: updates['password'] ?? updatedPassword,
                    ));
                  }

                  if (!mounted) return;

                  // Update currentUserData via Provider
                  final updatedUserData = {
                    ...?currentUserData.account,
                    'username': updatedName,
                    'email': updatedEmail,
                    'password': updatedPassword,
                    'avatar_url': selectedAvatar,
                  };

                  Provider.of<CurrentUserData>(context, listen: false).setAccountData(updatedUserData);

                  setState(() {
                    isEditing = false;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile updated successfully!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No changes to save.')),
                  );
                }
              } catch (e) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to update profile: $e')),
                );
              }
            }
          } else {
            setState(() {
              isEditing = true;
            });
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
        ),
        child: Text(
          isEditing ? 'Save' : 'Edit',
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
