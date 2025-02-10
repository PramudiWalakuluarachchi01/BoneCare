// ignore_for_file: deprecated_member_use

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bone_care/screens/instructions_screen/instructions_screen.dart';
import 'package:bone_care/screens/monthlyprogress_screen/monthlyprogress_screen.dart'; // Import MonthlyprogressScreen
import 'package:bone_care/screens/osteoporosisdetails_screen/osteoporosisdetails_screen.dart';
import 'package:bone_care/screens/playlist_screen/playlist_screen.dart';
import 'package:bone_care/screens/userprofile_screen/userprofile_screen.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final icons = <IconData>[Icons.home, Icons.chat, Icons.account_circle];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Image.asset(
              'assets/images/pic6.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
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
                SizedBox(height: 0),
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
                SizedBox(height: 70),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlaylistScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 14),
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
                                    'assets/images/homepic1.png',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Video Guides',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'IndieFlower',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                            // Physiotherapy Instructions container (with navigation)
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InstructionsScreen()),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(129, 253, 254, 255),
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
                                      'assets/images/homepic2.png', // Physiotherapy Instructions image
                                      height: 90,
                                      width: 100,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      'Physiotherapy',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'IndieFlower',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Instructions',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'IndieFlower',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            // What is Osteoporosis? container with navigation
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OsteoporosisdetailsScreen()),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(129, 253, 254, 255),
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
                                      'assets/images/homepic3.png',
                                      height: 90,
                                      width: 100,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      'What is',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'IndieFlower',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Osteoporosis?',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'IndieFlower',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            // Monthly Progress container with navigation to MonthlyprogressScreen
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MonthlyprogressScreen()), // Navigate to MonthlyprogressScreen
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(129, 253, 254, 255),
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
                                      'assets/images/homepic4.png',
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Monthly Progress',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'IndieFlower',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(20),
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
              child: Center(
                child: Text(
                  'Scan your X-ray here',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'IndieFlower',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
     bottomNavigationBar: AnimatedBottomNavigationBar(
  backgroundColor: const Color.fromARGB(255, 5, 26, 71),
  icons: icons,
  activeIndex: 0,
  activeColor: Colors.white, // Active icon color
  inactiveColor: Colors.grey, // Inactive icon color
  iconSize: 30,
  gapLocation: GapLocation.none,
  notchSmoothness: NotchSmoothness.softEdge,
  leftCornerRadius: 20,
  rightCornerRadius: 20,
  onTap: (index) {
    setState(() {
      if (index == 2) { // Assuming the user icon is at index 2
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserprofileScreen()),
        );
      }
    });
  },
),

    );
  }
}
