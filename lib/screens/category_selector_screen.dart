import 'package:flutter/material.dart';
import '../services/state_progress.dart';
import 'main_screen.dart';

class CategorySelectorScreen extends StatelessWidget {
  final List<Map<String, String>> modules = [
    {
      'title': 'Unit 1: Welcome',
      'image': 'assets/images/unit1.jpg',
      'levelRange': 'Level 1-4'
    },
    {
      'title': 'Unit 2: Getting Started',
      'image': 'assets/images/unit2.jpg',
      'levelRange': 'Level 5-8'
    },
    {
      'title': 'Unit 3: Getting to Know You',
      'image': 'assets/images/unit3.jpg',
      'levelRange': 'Level 9-12'
    },
    {
      'title': 'Unit 4: Numbers',
      'image': 'assets/images/unit4.jpg',
      'levelRange': 'Level 13-16'
    },
    {
      'title': 'Unit 5: Time',
      'image': 'assets/images/unit5.jpg',
      'levelRange': 'Level 17-20'
    },
    {
      'title': 'Unit 6: Family and Friends',
      'image': 'assets/images/unit6.jpg',
      'levelRange': 'Level 21-24'
    },
    {
      'title': 'Unit 7: School Days',
      'image': 'assets/images/unit7.jpg',
      'levelRange': 'Level 25-28'
    },
    {
      'title': 'Unit 8: My Daily Routine',
      'image': 'assets/images/unit8.jpg',
      'levelRange': 'Level 29-32'
    },
    {
      'title': 'Unit 9: Describing people',
      'image': 'assets/images/unit9.jpg',
      'levelRange': 'Level 33-36'
    },
    {
      'title': 'Unit 10: Making Plans',
      'image': 'assets/images/unit10.jpg',
      'levelRange': 'Level 37-40'
    },
  ];

  CategorySelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text(
            'Select Module',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        automaticallyImplyLeading: false, // Para walang back arrow
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: modules.length,
          itemBuilder: (context, index) {
            final module = modules[index];
            return GestureDetector(
 
              onTap: () async {
                final currentUnit = module['title']!;
                final lessonManager = LessonManager();
                await lessonManager.updateCurrentUnit(currentUnit);

                if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(category: currentUnit),
                  ),
                );
              }
              },

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha((0.5 * 255).round()),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.asset(
                        module['image']!,
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              module['title']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              module['levelRange']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
