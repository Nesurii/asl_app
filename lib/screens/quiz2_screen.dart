import 'package:flutter/material.dart';

class Quiz2Screen extends StatelessWidget {
  const Quiz2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz 2")),
      body: Center(
        child: Text(
          "This is Quiz 2 Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}