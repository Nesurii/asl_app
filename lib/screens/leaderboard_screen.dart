import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/current_user.dart';
import 'main_screen.dart';
import 'asl_alphabet_screen.dart';
import 'profile_screen.dart';
import 'practice_screen.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final SupabaseClient supabase = Supabase.instance.client;
  List<Map<String, dynamic>> leaderboard = [];
  int? currentUserRank;
  int? currentUserExp;

  @override
  void initState() {
    super.initState();
    fetchLeaderboard();
  }

  Future<void> fetchLeaderboard() async {
    try {
      final data = await supabase
          .from('user_progresss')
          .select('exp, user_account(username, avatar_url)')
          .order('exp', ascending: false)
          .limit(10);

      final leaderboardData = (data as List).map((entry) {
        final userAccount = entry['user_account'];
        return {
          'username': userAccount['username'] ?? 'No Username',
          'avatarUrl': userAccount['avatar_url'] ?? '',
          'exp': entry['exp'] ?? 0,
        };
      }).toList();

      // Check if all EXP values are 0
      final allZero = leaderboardData.every((user) => user['exp'] == 0);

      if (!allZero) {
        // Track the current user's rank if they exist in the leaderboard
        final currentUser = leaderboardData.firstWhere(
          (user) => user['username'] == currentUserData.account?['username'],
          orElse: () => {},
        );

        if (currentUser.isNotEmpty) {
          setState(() {
            currentUserRank = leaderboardData.indexOf(currentUser) + 1;
            currentUserExp = currentUser['exp'];
          });
        }

        setState(() {
          leaderboard = leaderboardData;
        });
      } else {
        // If all EXPs are 0, don't set top user or leaderboard
        setState(() {
          leaderboard = []; // keeps UI clean if you want to display an empty state
          currentUserRank = null;
          currentUserExp = null;
        });
      }
    } catch (error) {
      debugPrint('Error fetching leaderboard: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final topUser = leaderboard.isNotEmpty ? leaderboard[0] : null;
    final otherUsers = leaderboard.length > 1 ? leaderboard.sublist(1) : [];

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
      body: leaderboard.isEmpty
          ? Center(
              child: leaderboard.isEmpty
                  ? CircularProgressIndicator() // Show spinner when fetching data
                  : Text('No users on the leaderboard yet.') // Show message when no data
            )
          : Column(
              children: [
                if (topUser != null)
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
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: topUser['avatarUrl'].isNotEmpty
                              ? AssetImage(topUser['avatarUrl'])
                              : null,
                          backgroundColor: Colors.grey[300],
                          child: topUser['avatarUrl'].isEmpty
                              ? Icon(Icons.person, size: 50, color: Colors.white)
                              : null,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          topUser['username'],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${topUser['exp']} EXP',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (currentUserRank != null && currentUserExp != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Your rank: $currentUserRank EXP $currentUserExp' , //// display current rank & exp
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
                                child: user['avatarUrl'].isNotEmpty
                                    ? ClipOval(
                                        child: Image.asset(
                                          user['avatarUrl'],
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Icon(Icons.person, color: Colors.white);
                                          },
                                        ),
                                      )
                                    : Icon(Icons.person, color: Colors.white),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user['username'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('${user['exp']} EXP'),
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
        icon: Image.asset('assets/icons/asl_alphabet_icon.png', width: 30, height: 30),
        label: 'ASL Alphabets',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/practice_icon.png', width: 30, height: 30),
        label: 'Practice',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/leaderboard_icon.png', width: 30, height: 30),
        label: 'Leaderboard',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/profile_icon.png', width: 30, height: 30),
        label: 'Profile',
      ),
    ],
    onTap: (index) {
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainScreen(category: 'Unit 1: Welcome')),
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
  );
}
