import 'package:flutter/material.dart';

class Quiz3Screen extends StatelessWidget {
  const Quiz3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz 3")),
      body: Center(
        child: Text(
          "This is Quiz 3 Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
