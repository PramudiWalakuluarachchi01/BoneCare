import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class AddPostSection extends StatefulWidget {
  final Function(String postText, File? imageFile) onPost;
  const AddPostSection({
    super.key,
    required this.onPost,
  });

  @override
  State<AddPostSection> createState() => _AddPostSectionState();
}

class _AddPostSectionState extends State<AddPostSection> {
  final TextEditingController _postTextController = TextEditingController();
  File? _imageFile;

  Future<void> _pickImage() async {
    // Check Android version and request appropriate permissions
    if (Platform.isAndroid) {
      _selectImage();
    } else if (Platform.isIOS) {
      // iOS-specific permission request
      var status = await Permission.photos.status;
      Logger().i('iOS: Photos permission status: $status');

      if (!status.isGranted) {
        status = await Permission.photos.request();
      }

      if (status.isGranted) {
        _selectImage();
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      } else {
        Logger().e('Photos permission denied on iOS');
      }
    }
  }

  // Separate function to select an image after permissions are granted
  Future<void> _selectImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile =
              File(pickedFile.path); // No need for MANAGE_EXTERNAL_STORAGE
        });
        Logger().i('Image selected: ${pickedFile.path}');
      } else {
        Logger().i('No image selected');
      }
    } catch (e) {
      Logger().e('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'Playfairdisplay'),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets, // Handles keyboard overlap
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: Color.fromARGB(255, 235, 235, 235),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 160, vertical: 1),
                child: Container(
                  height: 4,
                  decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                ),
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  TextField(
                    controller: _postTextController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Share your thoughts...',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 137, 189, 238)),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 8,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.black),
                      onPressed: _pickImage,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (_imageFile != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _imageFile!,
                      height: 100,
                      fit: BoxFit.cover,
                      width: 100,
                    ),
                  ),
                ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 137, 189, 238)),
                  ),
                  onPressed: () {
                    widget.onPost(_postTextController.text, _imageFile);
                    Navigator.pop(
                        context); // Close the bottom sheet after posting
                  },
                  child: const Text(
                    'Post',
                    style: TextStyle(
                      fontFamily: 'Playfairdisplay',
                      fontSize: 16,
                      color: Color.fromARGB(255, 1, 33, 59),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
