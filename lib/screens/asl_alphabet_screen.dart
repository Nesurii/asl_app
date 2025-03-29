import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'practice_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';

class ASLAlphabetScreen extends StatelessWidget {
  // Mapa ng mga ASL alphabet letters na may corresponding image URL
  final Map<String, String> aslAlphabetImages = {
    'A':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/A.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0EuanBnIiwiaWF0IjoxNzQyOTQxODY3LCJleHAiOjE3NzQ0Nzc4Njd9.IQlynugC9t5mEhhAClUTmiq0VFhff5HN2C9e0tQAPDM',
    'B':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/B.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0IuanBnIiwiaWF0IjoxNzQyOTQxODgzLCJleHAiOjE3NzQ0Nzc4ODN9.WU8DhaFjri5c8FEMBKOWINSvjpPhmal93ARQPgiyFWc',
    'C':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/C.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0MuanBnIiwiaWF0IjoxNzQyOTQxODk2LCJleHAiOjE3NzQ0Nzc4OTZ9.7uEsYeI5jAbBd5Pcqd-Ib7QGf07ePOxhXCicHWzAg4c',
    'D':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/D.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0QuanBnIiwiaWF0IjoxNzQyOTQxOTA3LCJleHAiOjE3NzQ0Nzc5MDd9.IsmqzMc4_IOgm0lJyfd_7xCReG5R5WHsoKIJlghASKY',
    'E':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/E.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0UuanBnIiwiaWF0IjoxNzQyOTQxOTE3LCJleHAiOjE3NzQ0Nzc5MTd9.Mcgu6w9sM6WKOeG_LBdHR4o5agUPJ6W5K_x9QNTbn4A',
    'F':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/F.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0YuanBnIiwiaWF0IjoxNzQyOTQxOTI1LCJleHAiOjE3NzQ0Nzc5MjV9.bKpb0ra8lPJh63eZhClFrpRl7bdLAPixS4mb9cUkQsk',
    'G':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/G%20back%20view.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0cgYmFjayB2aWV3LmpwZyIsImlhdCI6MTc0Mjk0MTk0OCwiZXhwIjoxNzc0NDc3OTQ4fQ.1cxU0AUBG9Er-TxdTjyoNF-acYmJ4ryE4YtUIPPgMjw',
    'H':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/H%20back%20view.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0ggYmFjayB2aWV3LmpwZyIsImlhdCI6MTc0Mjk0MTk3MCwiZXhwIjoxNzc0NDc3OTcwfQ.E9E3QHflTvRfdXEs5ih8Q8guyk1o43uOWDqervpIZtc',
    'I':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/I.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0kuanBnIiwiaWF0IjoxNzQyOTQxOTg4LCJleHAiOjE3NzQ0Nzc5ODh9.QuU7XEmFREFRK31M4MB1yq_EboNEu0L8ieO3x24JKh8',
    'J':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/J-gif%20(1).gif?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0otZ2lmICgxKS5naWYiLCJpYXQiOjE3NDI5NDI0MTUsImV4cCI6MTc3NDQ3ODQxNX0.gqMeYfFWK0lN6Vq59cy-tL3joQ_IL8EtbBkEEsm19iM',
    'K':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/K.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0suanBnIiwiaWF0IjoxNzQyOTQyMDEzLCJleHAiOjE3NzQ0NzgwMTN9.RTx1EbZTo8VUk21WxSFnG4ctyXUFBa-uWSQB2BO9eps',
    'L':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/L.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL0wuanBnIiwiaWF0IjoxNzQyOTQyMDQwLCJleHAiOjE3NzQ0NzgwNDB9.eogHQyb7mjgd0qghJzdB9wMQTG5muvugo9WGmsDhfBI',
    'M':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/M.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL00uanBnIiwiaWF0IjoxNzQyOTQyMDQ5LCJleHAiOjE3NzQ0NzgwNDl9.L5MVHNmQn5vkIKrtzmZDtpvcxeyPlcwJnBmP5Vs24vs',
    'N':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/N.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL04uanBnIiwiaWF0IjoxNzQyOTQyMDU4LCJleHAiOjE3NzQ0NzgwNTh9.gWasumv5-lh_rptHKHhAzOW_dCyAgDPXz4jzfMaz4LI',
    'O':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/O%20side%20view.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL08gc2lkZSB2aWV3LmpwZyIsImlhdCI6MTc0Mjk0MjA3NCwiZXhwIjoxNzc0NDc4MDc0fQ.foi0RoW_V1su7d0AIVmfN5qcZDlLaui14j_ASgNYTMc',
    'P':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/Pside%20view.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1BzaWRlIHZpZXcuanBnIiwiaWF0IjoxNzQyOTQyMDk0LCJleHAiOjE3NzQ0NzgwOTR9.jsD_3wIjzqicIqpV7INAEPirK1GP1n7xMNWPBEyAUrI',
    'Q':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/Q%20side%20view.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1Egc2lkZSB2aWV3LmpwZyIsImlhdCI6MTc0Mjk0MjExNSwiZXhwIjoxNzc0NDc4MTE1fQ.KHztO4g_RiGaq59DCrPLFPFcIiyRxzGuljoOvBTN5_E',
    'R':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/R.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1IuanBnIiwiaWF0IjoxNzQyOTQyMTI1LCJleHAiOjE3NzQ0NzgxMjV9.HnmH8BGJT_Q-lwAU1122dG3eNIG6QY6tpNcWhwZz1iI',
    'S':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/S.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1MuanBnIiwiaWF0IjoxNzQyOTQyMTMyLCJleHAiOjE3NzQ0NzgxMzJ9.lQQ4kfDyc7rv176F5j7UI9eY6m0xaE9i0LHrffBOBVY',
    'T':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/T.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1QuanBnIiwiaWF0IjoxNzQyOTQyMTQwLCJleHAiOjE3NzQ0NzgxNDB9.hMEmYEmNQ3ApJYPbih8Xw5jm8Bs0BJ8RxTf0dv94lNA',
    'U':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/U.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1UuanBnIiwiaWF0IjoxNzQyOTQyMTUwLCJleHAiOjE3NzQ0NzgxNTB9.QG9DFhdjZTdJAIVO4VeSi8hPZ6Psxd9o54Y7F7CEJG4',
    'V':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/V.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1YuanBnIiwiaWF0IjoxNzQyOTQyMTU5LCJleHAiOjE3NzQ0NzgxNTl9.Bo15jez2T_C1cmaqbfIiiimkrGLxv6qD9L4xR1g6eTM',
    'W':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/W.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1cuanBnIiwiaWF0IjoxNzQyOTQyMTY5LCJleHAiOjE3NzQ0NzgxNjl9.6g4-HXV1Td91UvJ0H8WRWOVjQ7iezK_Mc7yxspZMtik',
    'X':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/X.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1guanBnIiwiaWF0IjoxNzQyOTQyMTc5LCJleHAiOjE3NzQ0NzgxNzl9.IiaCNysY6-uITHlyoWHarMw9ko9L8t-XblFml9Xp0Ag',
    'Y':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/Y.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1kuanBnIiwiaWF0IjoxNzQyOTQyMTkwLCJleHAiOjE3NzQ0NzgxOTB9.63cKCQUh3BhxtlfTTUT5flf-_tkhjXx1ymaHYmD_rgg',
    'Z':
        'https://batvjfcaxelxagufynxk.supabase.co/storage/v1/object/sign/itro/Z-gif%20(1).gif?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpdHJvL1otZ2lmICgxKS5naWYiLCJpYXQiOjE3NDI5NDI0MzEsImV4cCI6MTc3NDQ3ODQzMX0.S_p3l0BIl1_td718m468FVj4p7ZvsWo-hs_47Ibhx_k',
  };

  ASLAlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let\'s learn ASL Alphabet!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Memorizing the American Sign Language Alphabet (ASL alphabet in short) '
                      'is one of the most important steps in learning American Sign Language.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 26,
                  itemBuilder: (context, index) {
                    String letter =
                        String.fromCharCode(65 + index); // 'A' to 'Z'

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ZoomedImageScreen(
                                letter: letter,
                                imageUrl: aslAlphabetImages[letter]!),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'image_$letter',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.network(
                                    aslAlphabetImages[letter]!,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Center(
                                        child: Icon(Icons.broken_image,
                                            size: 40, color: Colors.red),
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    color: Colors.black.withAlpha((0.6 * 255).toInt()),
                                    padding: EdgeInsets.symmetric(vertical: 4),
                                    child: Text(
                                      letter,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        currentIndex: 1,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
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
        onTap: (index) {
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
      ),
    );
  }
}

class ZoomedImageScreen extends StatelessWidget {
  final String letter;
  final String imageUrl;

  const ZoomedImageScreen({super.key, required this.letter, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha((0.8 * 255).toInt()),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Hero(
              tag: 'image_$letter',
              child: Center(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child:
                          Icon(Icons.broken_image, size: 50, color: Colors.red),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
