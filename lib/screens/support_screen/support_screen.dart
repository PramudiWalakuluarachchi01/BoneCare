import 'package:bone_care/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Column(
        children: [
          Stack(
            children: [
              // Background image at the top
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/pic14.png',
                  fit: BoxFit.cover,
                  height: 250,
                ),
              ),
              // Positioned widgets for back button and title text
              Positioned(
                top: 80,
                left: 0,
                right: 260,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        "Support",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PlayfairDisplay',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Adding content below the app bar
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(
                  16.0), // Adding padding for better spacing
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Frequently Asked Questions",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'PlayfairDisplay',
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "1. How do I reset my password?",
                    style: TextStyle(fontSize: 16, color: Colors.black,fontFamily: 'PlayfairDisplay'),
                  ),
                  const Text(
                    " To reset your password, go to the login page, click on 'Forgot Password', and follow the instructions sent to your email.",
                    style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: 'PlayfairDisplay'),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "2. How can I contact support?",
                    style: TextStyle(fontSize: 16, color: Colors.black,fontFamily: 'PlayfairDisplay'),
                  ),
                  const Text(
                    " You can contact support by emailing us at pramudinethmini01@gmail.com option in the app.",
                    style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: 'PlayfairDisplay'),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "3. What if I have a problem with the app?",
                    style: TextStyle(fontSize: 16, color: Colors.black,fontFamily: 'PlayfairDisplay'),
                  ),
                  const Text(
                    " If you encounter any issues with the app, please reach out to our support team. We are available 24/7 to assist you.",
                    style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: 'PlayfairDisplay'),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'PlayfairDisplay',
                    ),
                  ),
                  const Text(
                    "Email: pramudinethmini01@gmail.com ",
                    style: TextStyle(fontSize: 16, color: Colors.black,fontFamily: 'PlayfairDisplay'),
                  ),
                  const Text(
                    "Phone: 0761051516",
                    style: TextStyle(fontSize: 16, color: Colors.black,fontFamily: 'PlayfairDisplay'),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
