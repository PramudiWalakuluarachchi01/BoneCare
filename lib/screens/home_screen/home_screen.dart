import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final icons = <IconData>[
    Icons.home,
    Icons.chat,
    Icons.account_circle
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity, // Makes the image fit the full width
            height: MediaQuery.of(context).size.height * 0.9, // Covers most of the screen height
            child: Image.asset(
              'assets/images/pic6.png',
              fit: BoxFit.cover, // Ensures it fills the width while keeping proportions
            ),
          ),
          Positioned(
            top: 80, // Adjust the distance from the top
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Playfairdisplay',
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Ensure visibility on the image
                    // Optional background for better readability
                  ),
                ),
                SizedBox(height: 0), // Space between the two texts
                Text(
                  'Start your physiotherapy here!',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Playfairdisplay',
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 183, 182, 182),
                    // Optional background
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 5, 26, 71),
        icons: icons,
        activeIndex: 0,
        onTap: (p0) {},
      ),
    );
  }
}
