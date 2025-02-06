import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity, // Makes the image fit the full width
            height: MediaQuery.of(context).size.height *
                0.9, // Covers 50% of the screen height
            child: Image.asset(
              'assets/images/pic6.png',
              fit: BoxFit
                  .cover, // Ensures it fills the width while keeping proportions
            ),
          ),
          
        ],
      ),
    );
    
    
  }
}
