import 'dart:convert';

import 'package:bone_care/providers/authuser_provider.dart';
import 'package:bone_care/services/api_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider =
          Provider.of<AuthUserProvider>(context, listen: false);
      userProvider.fetchUserProfile(userProvider.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthUserProvider>(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/pic12.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'User Profile',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Playfairdisplay',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              blurRadius: 10,
                              color: Colors.white,
                              offset: Offset(2, 2))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _buildInfoField('Full Name', userProvider.name, 310),
              _buildInfoField('Age', userProvider.age, 390),
              _buildInfoField('Email', userProvider.email, 470),
              _buildInfoField('Gender', userProvider.gender, 550),
              Positioned(
                bottom: 50,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () => _showUpdateDialog(context, userProvider),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 2, 50, 90),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(style: TextStyle(color: Colors.white,fontFamily: 'Playfairdisplay'),'Update Profile'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInfoField(String label, String value, double top) {
  return Positioned(
    top: top,
    left: 20,
    right: 20,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(147, 203, 202, 202).withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '$label: $value',
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w800, fontFamily: 'Playfairdisplay'),
      ),
    ),
  );
}

void _showUpdateDialog(BuildContext context, AuthUserProvider userProvider) {
  final nameController = TextEditingController(text: userProvider.name);
  final ageController = TextEditingController(text: userProvider.age);
  final passwordController = TextEditingController();
  final String baseUrl = apiUrl();
  String selectedGender = userProvider.gender;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Update Profile'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(userProvider.email,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        )),
                  ],
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Full Name')),
                TextField(
                    controller: ageController,
                    decoration: const InputDecoration(labelText: 'Age')),
                Row(
                  children: [
                    Text('Gender:'),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      value: selectedGender,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedGender = newValue;
                          });
                        }
                      },
                      items: ['Male', 'Female', 'Other']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                    ),
                  ],
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: 'Password (current)'),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel')),
              TextButton(
                onPressed: () {
                  if (passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Password is required"),
                          backgroundColor: Colors.red),
                    );
                    return;
                  }
                  _updateUserProfile(
                    context,
                    userProvider,
                    userProvider.email,
                    passwordController.text,
                    nameController.text,
                    ageController.text,
                    selectedGender,
                    baseUrl,
                  );
                  Navigator.pop(context);
                },
                child: const Text('Update'),
              ),
            ],
          );
        },
      );
    },
  );
}

Future<void> _updateUserProfile(
    BuildContext context,
    AuthUserProvider userProvider,
    String email,
    String password,
    String name,
    String age,
    String gender,
    String baseUrl) async {
  String apiUrl = "$baseUrl/api/updateProfile";

  try {
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
        "name": name,
        "age": age,
        "gender": gender,
      }),
    );

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      userProvider.setName(name);
      userProvider.setAge(age);
      userProvider.setGender(gender);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Profile updated successfully!"),
            backgroundColor: Colors.green),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(responseData['message']),
            backgroundColor: Colors.red),
      );
    }
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text("An error occurred"), backgroundColor: Colors.red),
    );
  }
}
