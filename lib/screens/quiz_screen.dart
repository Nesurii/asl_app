import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  final int quizNumber;

  const QuizScreen({super.key, required this.quizNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz $quizNumber')),
      body: Center(
        child: Text(
          'Questions for Quiz $quizNumber',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
