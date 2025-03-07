import 'package:flutter/material.dart';

class LessonScreen extends StatelessWidget {
  final int lessonNumber;

  const LessonScreen({super.key, required this.lessonNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lesson $lessonNumber')),
      body: Center(
        child: Text(
          'Content for Lesson $lessonNumber',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
