import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/current_user.dart';
import 'login_screen.dart';
import 'main_screen.dart';
import 'asl_alphabet_screen.dart';
import 'practice_screen.dart';
import 'leaderboard_screen.dart';
import 'account_info_screen.dart';
import 'about_us_screen.dart';
import 'FAQ_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSettingsSelected = false;
  int _selectedIndex = 4; // Default selected index for Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopBar(),
          _buildProfileHeader(),
          SizedBox(height: 24),
          _buildToggleButtons(),
          SizedBox(height: 16),
          Expanded(
            child:
                isSettingsSelected ? _buildSettings() : _buildMyAchievements(),
          ),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 28),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(category: 'Unit 1: Welcome'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<CurrentUserData>(
            builder: (context, currentUserData, _) {
              final avatarUrl = currentUserData.account?['avatar_url'];

              return Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: (avatarUrl != null && avatarUrl != '')
                        ? AssetImage(avatarUrl)
                        : null,
                    child: (avatarUrl == null || avatarUrl == '')
                        ? Icon(Icons.person, size: 50, color: Colors.white)
                        : null,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountInfoScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                        ),
                        child: Icon(Icons.edit, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(width: 16),
          // Username + email section
          Expanded(
            child: Consumer<CurrentUserData>(
              builder: (context, userData, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${userData.account?['username'] ?? ''}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${userData.account?['email'] ?? ''}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Total EXP: ${userData.progress?['exp'] ?? ''}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ToggleButtons(
          isSelected: [!isSettingsSelected, isSettingsSelected],
          onPressed: (index) {
            setState(() {
              isSettingsSelected = index == 1;
            });
          },
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey.shade800,
          selectedColor: Colors.white,
          fillColor: Colors.orange,
          borderColor: Colors.transparent,
          selectedBorderColor: Colors.transparent,
          splashColor: Colors.orange.withAlpha((0.2 * 255).round()),
          highlightColor: Colors.transparent,
          constraints: BoxConstraints(minHeight: 48, minWidth: 140),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'My Achievements',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildMyAchievements() {
  final progressData = Provider.of<CurrentUserData>(context).progress;
  final List<dynamic>? earnedStickers = progressData?['stickers_earned'];

  return SingleChildScrollView(
    padding: EdgeInsets.only(bottom: 16), // extra space for scrolling
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Earned Stickers:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        if (earnedStickers != null && earnedStickers.isNotEmpty)
          Center(
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: earnedStickers.map((sticker) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6,
                        offset: Offset(2, 4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(16),
                  child: Image.asset(
                    '$sticker',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
          )
        else
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("No stickers earned yet."),
          ),
      ],
    ),
  );
}


  Widget _buildSettings() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text('Account Information'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountInfoScreen()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('About us'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUsScreen()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.question_answer),
          title: Text('FAQ'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FAQScreen()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.logout, color: Colors.red),
          title: Text('Logout', style: TextStyle(color: Colors.red)),
          onTap: () async {
            final googleSignIn = GoogleSignIn();

            // Sign out from Google if signed in
            try {
              if (await googleSignIn.isSignedIn()) {
                await googleSignIn.signOut();
              }
            } catch (e) {
              debugPrint('Google SignOut failed: $e');
            }

            // Sign out from Supabase
            await Supabase.instance.client.auth.signOut();

            if (!mounted) return;

            // Clear stored user data
            context.read<CurrentUserData>().logout();

            // Navigate to the login screen after logout
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) =>
                      LoginScreen()), // Replace with your Login screen
            );
          },
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey[600],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });

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
      items: [
        BottomNavigationBarItem(
          icon:
              Image.asset('assets/icons/home_icon.png', width: 30, height: 30),
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
    );
  }
}
