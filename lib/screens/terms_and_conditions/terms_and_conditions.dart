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
          const SizedBox(height: 10), // Space below image

          // Terms and Conditions Text
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "By using the Bone Care app, you agree to the following Terms and Conditions:",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),

          // Terms and Conditions Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '• By using the Bone Care app, you agree to these terms.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• You must be at least 18 years old or have parental consent to use the app.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Some features may require account creation. Keep your account details safe.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• The app provides educational content and tools related to osteoporosis, including physiotherapy exercises and progress tracking.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• The app is for informational purposes only. Always consult a healthcare provider for medical advice.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Use the app responsibly. Do not engage in illegal activities or misuse the app.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Your personal information will be handled according to our Privacy Policy.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• The app may contain links to third-party websites. We are not responsible for their content.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• All content in the app is owned by us and cannot be copied or used without permission.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• The app is provided "as is," and we are not responsible for any issues or damages that may arise from using it.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• We may suspend or terminate your access to the app if you violate these terms.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• These terms may be updated at any time, and you will be notified of major changes.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• These terms are governed by the laws of Sri Lanka.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• For any questions, contact us at pramudinethmini01@gmail.com',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
