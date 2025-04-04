import 'dart:convert';
import 'dart:io';

import 'package:bone_care/services/api_url.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class XRayDetectorScreen extends StatefulWidget {
  const XRayDetectorScreen({super.key});

  @override
  XRayDetectorScreenState createState() => XRayDetectorScreenState();
}

class XRayDetectorScreenState extends State<XRayDetectorScreen> {
  File? _image;
  String? _result;
  final ImagePicker _picker = ImagePicker();
  final String _baseUrl = apiUrl();

  // Mapping integer result to grade description
  String getGradeDescription(int grade) {
    switch (grade) {
      case 0:
        return 'Your knee is healthy and shows no signs of problems.';
      case 1:
        return "Your knee shows some early signs of wear, but it's still in the early stages";
      case 2:
        return 'There are some signs of wear and tear in your knee, with small changes in the joint.';
      case 3:
        return 'Your knee shows moderate wear, with noticeable changes and some joint narrowing.';
      case 4:
        return 'Your knee has significant wear, with severe changes to the joint and narrowing.';
      default:
        return 'Unknown result';
    }
  }

  // Pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // Send the image to the backend for analysis
      _sendImageToBackend(_image!);
    }
  }

  // Send the image to the backend and get the result
  Future<void> _sendImageToBackend(File image) async {
    try {
      final bytes = image.readAsBytesSync();
      final base64Image = base64Encode(bytes);

      // Send the image to the Node.js API
      final response = await http.post(
        Uri.parse('$_baseUrl/api/analyze-image'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'image': base64Image}),
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the result
        final result = json.decode(response.body);
        final grade = result['predicted_class'] as int;

        setState(() {
          _result =
              getGradeDescription(grade); // Get description based on grade
        });
      } else {
        setState(() {
          _result = 'Error: Failed to analyze image';
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Error: $e';
      });
    }
  }

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
                offset:
                    const Offset(30, 50), // Move image 30 pixels to the right
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
                  onPressed: _pickImage,
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // Ensure the row only takes as much space as needed
                    children: const [
                      Text('Upload'),
                      SizedBox(
                          width:
                              8), // Add some spacing between the text and the icon
                      Icon(Icons.upload, size: 20), // Upload icon
                    ],
                  ),
                ),

                // Display the analysis result if available
                if (_result != null) ...[
                  const SizedBox(height: 20),
                  Text(
                    'Result: $_result',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
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
