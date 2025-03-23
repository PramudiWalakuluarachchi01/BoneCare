import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Column(
        children: [
          // Stack to overlay the back button and title on the image
          Stack(
            children: [
              // The image as the background
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/pic14.png', // Ensure this path is correct
                  fit: BoxFit.cover,
                  height: 210, // Adjust height as needed
                ),
              ),
              // Positioned Row with Back Button and Title (centered)
              Positioned(
                top: 80, // Adjust to position vertically in the center
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center horizontally
                    children: [
                      // Back button
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(
                              context); // Go back to the previous screen
                        },
                      ),
                      // Title Text
                      const Expanded(
                        child: Text(
                          "Terms and Conditions",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PlayfairDisplay',
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 10,
                                color: Colors.white54,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Handle overflow if needed
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), // Space below image

          // Terms and Conditions Text
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Here are the Terms and Conditions",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
