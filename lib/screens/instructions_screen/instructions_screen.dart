import 'package:flutter/material.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({super.key});

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/pic9.png', // Make sure the path is correct
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          
          // Content Layer
          Positioned(
            top: 80, // Adding a top margin to prevent overlap with the status bar
            left: 30,
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Instructions',
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
                SizedBox(height: 20), // Space for better readability
                
                // Instructions content (you can adjust it based on your needs)
                
                // More steps as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
