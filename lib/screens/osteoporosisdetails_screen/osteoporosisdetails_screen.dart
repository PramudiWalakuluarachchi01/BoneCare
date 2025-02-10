import 'package:flutter/material.dart';

class OsteoporosisdetailsScreen extends StatefulWidget {
  const OsteoporosisdetailsScreen({super.key});

  @override
  State<OsteoporosisdetailsScreen> createState() => _OsteoporosisdetailsScreenState();
}

class _OsteoporosisdetailsScreenState extends State<OsteoporosisdetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Stack(
        children: [
          // Full-screen image
          Positioned.fill(
            child: Image.asset(
              'assets/images/pic10.png', // Your image
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),

          // Content over the image
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1, // Adjust vertical position
            left: 20,
            
            child: Center(
              child: Column(
                children: [
                  Text(
                    'What is', // Title text
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
                  SizedBox(height: 10), // Space between title and content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Osteoporosis?',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Playfairdisplay',
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text for readability
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
