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
  final ImagePicker _picker = ImagePicker();
  final String _baseUrl = apiUrl();

  // Mapping integer result to grade description
  String getGradeDescription(int grade) {
    switch (grade) {
      case 0:
        return 'Your knee is healthy and shows no signs of problems.';
      case 1:
        return "Your knee shows some early signs of wear, but it's still in the early stages.";
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

  // Show result in a dialog box
  void _showResultDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Analysis Result'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
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

      final response = await http.post(
        Uri.parse('$_baseUrl/api/analyze-image'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'image': base64Image}),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final grade = result['predicted_class'] as int;
        final description = getGradeDescription(grade);

        _showResultDialog(description);
      } else {
        _showResultDialog('Error: Failed to analyze image');
      }
    } catch (e) {
      _showResultDialog('Error: $e');
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
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Foreground Image (Behind the Centered Text)
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: const Offset(30, 50),
                child: Opacity(
                  opacity: 1.0,
                  child: Image.asset(
                    'assets/images/pic15.png',
                    width: 500,
                    height: 500,
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 4, 57, 100)
                  ),
                  onPressed: _pickImage,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(style: TextStyle(color: Colors.white),'Upload'),
                      SizedBox(width: 8),
                      Icon(Icons.upload, size: 20, color: Colors.white,),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Back Button & Title
          Positioned(
            top: 60,
            left: 16,
            right: 16,
            child: Row(
              children: [
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
