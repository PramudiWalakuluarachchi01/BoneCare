import 'dart:async';

import 'package:bone_care/screens/landing_screen/landing.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Landing();
      }));
    });
    super.initState();
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
