import 'package:flutter/material.dart';

class MonthlyprogressScreen extends StatefulWidget {
  const MonthlyprogressScreen({super.key});

  @override
  State<MonthlyprogressScreen> createState() => _MonthlyprogressScreenState();
}

class _MonthlyprogressScreenState extends State<MonthlyprogressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Stack(
        children: [
          // Full-screen image
          Positioned.fill(
            child: Image.asset(
              'assets/images/pic11.png', // Path to your image
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),

          // Content in front of the image (Text)
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.1, // Adjust the vertical position
            left: 20,

            child: Center(
              child: Text(
                'Monthly Progress', // Your text here
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Playfairdisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text for contrast
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.white.withOpacity(0.5),
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
