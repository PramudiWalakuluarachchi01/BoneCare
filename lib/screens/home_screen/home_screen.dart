import 'package:bone_care/screens/instructions_screen/instructions_screen.dart';
import 'package:bone_care/screens/monthlyprogress_screen/monthlyprogress_screen.dart';
import 'package:bone_care/screens/osteoporosisdetails_screen/osteoporosisdetails_screen.dart';
import 'package:bone_care/screens/playlist_screen/playlist_screen.dart';
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
      body: Stack(
        children: [
          // Background image
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Image.asset(
              'assets/images/pic6.png',
              fit: BoxFit.cover,
            ),
          ),
          // Positioned content in the screen
          Positioned(
            top: 80,
            left: 37,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Playfairdisplay',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.white.withOpacity(0.5),
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Start your physiotherapy here!',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Playfairdisplay',
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 183, 182, 182),
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.white.withOpacity(0.5),
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Playfairdisplay',
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildCategory(
                      context,
                      'assets/images/homepic1.png',
                      'Video Guides',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlaylistScreen()),
                      ),
                    ),
                    SizedBox(width: 40),
                    _buildCategory(
                      context,
                      'assets/images/homepic3.png',
                      'What is Osteoporosis?',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OsteoporosisdetailsScreen()),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildCategory(
                      context,
                      'assets/images/homepic2.png',
                      'Physiotherapy Instructions',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InstructionsScreen()),
                      ),
                    ),
                    SizedBox(width: 40),
                    _buildCategory(
                      context,
                      'assets/images/homepic4.png',
                      'Monthly Progress',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MonthlyprogressScreen()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context, String imagePath, String title,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        width: 150,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: const Color.fromARGB(129, 253, 254, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(0.5),
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              height: 100,
              width: 120,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'IndieFlower',
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
