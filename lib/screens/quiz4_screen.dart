import 'package:flutter/material.dart';

class Quiz4Screen extends StatelessWidget {
  const Quiz4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz 4")),
      body: Center(
        child: Text(
          "This is Quiz 4 Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
