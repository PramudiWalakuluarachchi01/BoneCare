import 'dart:async';

import 'package:bone_care/screens/landing_screen/landing.dart';
import 'package:bone_care/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _checkSessionAndNavigate();
  }

  Future<void> _checkSessionAndNavigate() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate loading time

    String? userID = await _storage.read(key: 'userId');
    bool sessionAvailable = true;

    sessionAvailable = (userID != null);

    if (sessionAvailable) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Landing();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Text(
          'BONE CARE',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 137, 189, 238),
            fontFamily: 'PlayfairDisplay',
          ),
        ),
      ),
    );
  }
}

//
