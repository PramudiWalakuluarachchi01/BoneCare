import 'package:bone_care/screens/login_screen/login.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/pic13.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),

              const SizedBox(height: 170),

              // First Container (Terms and Conditions)
              textInsideContainer("Terms and Conditions", 50, 400,
                  Colors.white.withOpacity(0.5), Colors.black),
              const SizedBox(height: 40),

              // Second Container (Support)
              textInsideContainer("Support", 50, 400,
                  Colors.white.withOpacity(0.5), Colors.black),
              const SizedBox(height: 20),

              const SizedBox(height: 106),

              // Large Bottom Container (Log Out) with RED text
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LoginScreen()), // Navigate to Login screen
                  );
                },
                child: textInsideContainer("Sign Out", 70, 400,
                    Colors.white.withOpacity(0.5), Colors.red, 22),
              ),
            ],
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.pop(context); // Navigates back to Home Screen
                  },
                ),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.white54,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 70,
            right: 20,
            child: PopupMenuButton<String>(
              iconColor: Colors.white,
              onSelected: (value) {
                if (value == 'Profile') {
                  // Handle Profile navigation
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(value: 'Profile', child: Text('Profile')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to create a container with styled text inside, adjustable width, and color
  Widget textInsideContainer(String content, double height, double width,
      Color bgColor, Color textColor,
      [double fontSize = 18]) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          content,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'PlayfairDisplay',
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
