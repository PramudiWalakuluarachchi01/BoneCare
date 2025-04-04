import 'package:bone_care/screens/home_screen/home_screen.dart';
import 'package:bone_care/screens/settings_screen/settings_screen.dart';
import 'package:bone_care/screens/social_platform/social_platform.dart';
import 'package:bone_care/screens/x-ray_detector/xray_detector.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0; // Track selected tab

  final List<Widget> _pages = [
    const HomeScreen(),
    const SocialPlatformScreen(),
    const XRayDetectorScreen(), // New X-ray Detector screen
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: selectedIndex,
            children: _pages,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircleNavBar(
              activeIcons: const [
                Icon(Icons.home, color: Colors.white),
                Icon(Icons.chat, color: Colors.white),
                Icon(Icons.fit_screen_sharp, color: Colors.white), // X-ray icon
                Icon(Icons.settings, color: Colors.white),
              ],
              inactiveIcons: const [
                Icon(Icons.home, color: Colors.grey),
                Icon(Icons.chat, color: Colors.grey),
                Icon(Icons.fit_screen_sharp,
                    color: Colors.grey), // X-ray icon inactive
                Icon(Icons.settings, color: Colors.grey),
              ],
              color: const Color.fromARGB(255, 5, 26, 71),
              height: 60,
              circleWidth: 60,
              activeIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              cornerRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              shadowColor: Colors.black38,
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }
}
