import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.videoId});

  final String videoId;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238), // Same as PlaylistScreen
      body: Stack(
        children: [
          // Background Image at the Top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/pic14.png', // Ensure this path is correct
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),

          // Back Button
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Title Text
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1, // Adjusted Position
            left: 100,
            right: 100,
            child: const Center(
              child: Text(
                'Video Player',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Playfairdisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.white,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Video Player Positioned Below the Image
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25, // Adjusted based on image height
            left: 0,
            right: 0,
            child: Center(
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
