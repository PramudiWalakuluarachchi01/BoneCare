import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class XRayDetectorScreen extends StatelessWidget {
  const XRayDetectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Stack(
        children: [
          // Background Color
          Container(color: const Color.fromARGB(255, 137, 189, 238)),

          // Background Image (Placed at the Top)
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/pic16.png',
                width: double.infinity,
                height: 250, // Adjust height as needed
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Foreground Image (Behind the Centered Text)
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: const Offset(30, 50), // Move image 30 pixels to the right
                child: Opacity(
                  opacity: 1.0, // Fully visible
                  child: Image.asset(
                    'assets/images/pic15.png', // The image behind the text
                    width: 500, // Adjust width
                    height: 500, // Adjust height
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Centered Content (Icon & Text)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.camera,
                  size: 100,
                  color: const Color.fromARGB(144, 4, 41, 104),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Upload an X-ray Image',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'for Analysis',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                // Upload button with icon
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement image upload functionality
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Ensure the row only takes as much space as needed
                    children: const [
                      Text('Upload'),
                      SizedBox(width: 8), // Add some spacing between the text and the icon
                      Icon(Icons.upload, size: 20), // Upload icon
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Back Button & Title (In Front of Everything)
          Positioned(
            top: 60, // Adjusted for better visibility
            left: 16,
            right: 16,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Scan your X-Ray",
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
