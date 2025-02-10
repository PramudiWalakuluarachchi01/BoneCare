import 'package:flutter/material.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Stack(
        children: [
          // Image at the top of the screen
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/pic8.png', // Adjust this to the path of your image
              width: MediaQuery.of(context).size.width, // Stretch the image across the screen width
              fit: BoxFit.cover, // Ensures the image covers the top area properly
            ),
          ),
          
          // Text in front of the image at the top
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1, // Adjust based on where you want the text
            left: 30,
            
            child: Center(
              child: Text(
                'Playlist', // Your text here
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Playfairdisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(blurRadius: 10, color: Colors.black.withOpacity(0.5), offset: Offset(2, 2)),
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
