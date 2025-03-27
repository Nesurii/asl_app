import 'package:flutter/material.dart';
import 'main_screen.dart';

class CategorySelectorScreen extends StatelessWidget {
  CategorySelectorScreen({super.key});

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
      'title': 'Unit 4: Family and Friends',
      'image': 'assets/images/unit4.jpg',
      'levelRange': 'Level 13-16'
    },
    {
      'title': 'Unit 5: School Days',
      'image': 'assets/images/unit5.jpg',
      'levelRange': 'Level 17-20'
    },
    {
      'title': 'Unit 6: Sports and Activities',
      'image': 'assets/images/unit6.jpg',
      'levelRange': 'Level 21-24'
    },
    {
      'title': 'Unit 7: My Daily Routine',
      'image': 'assets/images/unit7.jpg',
      'levelRange': 'Level 25-28'
    },
    {
      'title': 'Unit 8: Describing People',
      'image': 'assets/images/unit8.jpg',
      'levelRange': 'Level 29-32'
    },
    {
      'title': 'Unit 9: My Home and Community',
      'image': 'assets/images/unit9.jpg',
      'levelRange': 'Level 33-36'
    },
    {
      'title': 'Unit 10: Making Plans',
      'image': 'assets/images/unit10.jpg',
      'levelRange': 'Level 37-40'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select a Module',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffffa02f),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: modules.length,
          itemBuilder: (context, index) {
            return ModuleBox(
              title: modules[index]['title']!,
              imagePath: modules[index]['image']!,
              levelRange: modules[index]['levelRange']!,
            );
          },
        ),
      ),
    );
  }
}

class ModuleBox extends StatefulWidget {
  final String title;
  final String imagePath;
  final String levelRange;

  const ModuleBox({super.key, 
    required this.title,
    required this.imagePath,
    required this.levelRange,
  });

  @override
  State<ModuleBox> createState() => _ModuleBoxState();
}

class _ModuleBoxState extends State<ModuleBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
      lowerBound: 0.9,
      upperBound: 1.0,
    );
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  void _navigateToScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MainScreen(category: widget.title)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.reverse(),
      onTapUp: (_) {
        _controller.forward();
        Future.delayed(const Duration(milliseconds: 200),
            () => _navigateToScreen(context));
      },
      onTapCancel: () => _controller.forward(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha((0.2 * 255).toInt()),
                  blurRadius: 8,
                  spreadRadius: 1),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  widget.imagePath,
                  height: 100, // Adjusted height
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.levelRange,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 11,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(height: 8), // Space para hindi dikit sa baba
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
