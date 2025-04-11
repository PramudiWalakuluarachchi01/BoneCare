import 'package:bone_care/screens/player_screen/player_screen.dart';
import 'package:flutter/material.dart';

// List of video URLs
final videoUrls = [
  'https://youtu.be/MSKBe2Gr-uA?si=-k5Br7_kj4jUJKeM',
  'https://youtu.be/1f3Nz5WsUpE?si=iEtc7wjxsuXGI-bg',
  'https://youtu.be/Bdmeei0kq34?si=-nsaDaxbfsJ_XZaq',
  'https://youtu.be/GU17-w8a_hU?si=qxZIzkXkva2coqmy',
  'https://youtu.be/tRnqF-AFFdw?si=BpRY-rPnlttiEwwc',
  'https://youtu.be/1p63so9Cx-s?si=7ZXAn0_1Zgqvk5jy',
  'https://youtu.be/0Hl2UTJw9D4?si=aKciRuHt2q4W0n7L',
  'https://youtu.be/hOMEuX4yF1o?si=UgWJ3znzKvlXcMhg',
];

// List of video descriptions
final videoDescriptions = [
  'Learn basic osteoporosis exercises.',
  'A series of physiotherapy techniques.',
  'Strengthening exercises for bones.',
  'Steps to improve bone density.',
  'Simple daily stretches for bone health.',
  'Therapeutic yoga for osteoporosis.',
  'Posture improvement for better bone support.',
  'Breathing exercises for bone relief.'
];

// Function to extract video ID from YouTube URL
String getVideoId(String url) {
  final uri = Uri.parse(url);

  // If it's a short URL (youtu.be)
  if (uri.host.contains('youtu.be')) {
    return uri.pathSegments.first;
  }

  // If it's a standard YouTube URL
  return uri.queryParameters['v'] ??
      uri.pathSegments.last.split('?').first; // Handles extra params
}

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
          // Background Image at the Top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/pic8.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),

          // Combined Back Button and Title
          Positioned(
            top: 70,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  SizedBox(width: 10),
                  Text(
                    'Playlist',
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
                  ),
                ],
              ),
            ),
          ),

          // List of Videos
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: videoUrls.length,
                      itemBuilder: (context, index) {
                        final videoId = getVideoId(videoUrls[index]);
                        final thumbnailUrl = 'https://img.youtube.com/vi/$videoId/mqdefault.jpg';

        return Card(
          elevation: 4.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(129, 253, 254, 255),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: ListTile(
              leading: Image.network(
                thumbnailUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: Colors.red);
                },
              ),
              // Remove title text (Video 1, 2, etc.)
              title: null,
              subtitle: Text(
                videoDescriptions[index],
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              trailing: const Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerScreen(videoId: videoId),
                  ),
                );
              },
            ),
          ),
        );
                      },
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
