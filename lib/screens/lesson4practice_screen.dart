import 'package:flutter/material.dart';

class Lesson4PracticeScreen extends StatelessWidget {
  const Lesson4PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Lesson 1 Practice',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Title or Introduction for the lesson
            Text(
              'Welcome to Lesson 4 Practice!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Add content for lesson practice (e.g., quiz, exercises)
            Text(
              'Practice your skills and test your knowledge here.',
              style: TextStyle(fontSize: 18.0),
            ),
            // You can add buttons, images, or any interactive widget here for lesson practice
            ElevatedButton(
              onPressed: () {
                // Add any action for the button if needed, for example, starting the quiz or lesson content
              },
              child: Text('Start Practice'),
            ),
          ],
        ),
      ),
    );
  }
}
