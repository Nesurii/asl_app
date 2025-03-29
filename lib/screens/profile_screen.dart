import 'package:flutter/material.dart';
import 'package:mypod_flutter/main.dart';
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
  int _selectedIndex = 4; // Default selected index for Profile
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
                        builder: (context) =>
                            MainScreen(category: 'Unit 1: Welcome'),
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
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                          'assets/avatars/default_avatar.jpg'), // Replace with your default avatar path
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () => _showAvatarSelectionDialog(context),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                          ),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
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
                      '${userData!['email']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
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
              fillColor: Colors.orange,
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
          // Bottom Navigation Bar with Labels
          BottomNavigationBar(
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
            debugPrint("User logged out");
          },
        ),
      ],
    );
  }

  void _showAvatarSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Avatar"),
          content: SizedBox(
            height: 190, // Adjust height as needed
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle avatar selection
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/avatars/avatar${index + 1}.png'),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:
                          Text('Remove', style: TextStyle(color: Colors.red)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Save the selected avatar
                        Navigator.pop(context);
                      },
                      child: Text('Save', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
