import 'package:flutter/material.dart';
import 'package:mypod_flutter/main.dart';
import 'package:mypod_flutter/screens/login_screen.dart';
import 'main_screen.dart';
import 'asl_alphabet_screen.dart';
import 'practice_screen.dart';
import 'leaderboard_screen.dart';
import 'notification_screen.dart';
import 'account_info_screen.dart';
import 'about_us_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSettingsSelected = false;
  //final user = supabase.auth.currentUser;
  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        throw Exception("User not logged in");
      }

      // Fetch user details from the "users" table
      final response = await supabase
          .from('user_account')
          .select()
          .eq('id', user.id)  // Fetch data using the logged-in user's ID
          .single();  // Use `.single()` since we expect only one result

      setState(() {
        userData = response;
        isLoading = false;
      });
    } catch (error) {
      debugPrint('Error fetching user data: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top bar with back arrow and notification icon
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: 28),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(category: 'Unit 1'),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications_none,
                      color: Colors.black, size: 28),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          // Profile Picture and Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('assets/images/profile_picture.jpg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${userData!['username']}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '@jajajunie',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Level 1',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600])),
                        SizedBox(height: 4),
                        Container(
                          width: screenWidth * 0.5,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.6,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          // Toggle Buttons for My Stats and Settings
          Center(
            child: ToggleButtons(
              isSelected: [!isSettingsSelected, isSettingsSelected],
              onPressed: (index) {
                setState(() {
                  isSettingsSelected = index == 1;
                });
              },
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
              selectedColor: Colors.white,
              fillColor: Colors.orange, // Blue background when active
              borderColor: Colors.grey,
              selectedBorderColor: Colors.orange,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text('My Stats', style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text('Settings', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: isSettingsSelected ? _buildSettings() : _buildMyStats(),
          ),
          // Bottom Navigation Bar
          BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/home_icon.png',
                    width: 30, height: 30),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/asl_alphabet_icon.png',
                    width: 30, height: 30),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/practice_icon.png',
                    width: 30, height: 30),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/leaderboard_icon.png',
                    width: 30, height: 30),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/icons/profile_icon.png',
                      width: 30, height: 30),
                ),
                label: '',
              ),
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainScreen(category: 'Unit 1')),
                  );
                  break;
                case 1:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ASLAlphabetScreen()),
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
                    MaterialPageRoute(
                        builder: (context) => LeaderboardScreen()),
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
        ],
      ),
    );
  }

  // "My Stats" Section
  Widget _buildMyStats() {
    return Center(
      child: Text(
        'Stats will be shown here!',
        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
      ),
    );
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  // "Settings" Section
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
          leading: Icon(Icons.logout, color: Colors.red),
          title: Text('Logout', style: TextStyle(color: Colors.red)),
          onTap: () {
            signOut();
            debugPrint("User logged out");
          },
        ),
      //   ListTile(
      //   leading: Icon(Icons.info_outline),
      //   title: Text(user?.appMetadata['provider'] == 'google' 
      //       ? 'Unlink Google Account' 
      //       : 'Link Google Account'),
      //   trailing: Icon(Icons.arrow_forward_ios),
      //   onTap: () async {
      //     if (user?.appMetadata['provider'] == 'google') {
      //       await _unlinkGoogleAccount();
      //     } else {
      //       await _linkGoogleAccount();
      //     }
      //     setState(() {}); // Refresh UI
      //   },
      // ),

      ],
    );
  }
  
//   Future<void> _linkGoogleAccount() async {
//   try {
//     final response = await supabase.auth.signInWithOAuth(
//       Provider.google,
//       redirectTo: 'YOUR_APP_REDIRECT_URL',  // Change this to your app's redirect URI
//     );

//     if (response.user != null) {
//       await supabase.from('users').update({
//         'google_id': response.user?.id,
//       }).match({'id': user?.id});
//     }
//   } catch (e) {
//     debugPrint("Google linking failed: $e");
//   }
// }

// Future<void> _unlinkGoogleAccount() async {
//   try {
//     await supabase.from('users').update({
//       'google_id': null,
//     }).match({'id': user?.id});

//     debugPrint("Google account unlinked successfully.");
//   } catch (e) {
//     debugPrint("Unlinking failed: $e");
//   }
// }

}
