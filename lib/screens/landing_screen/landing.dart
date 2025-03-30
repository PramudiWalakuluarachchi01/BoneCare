import 'package:bone_care/screens/signin_screen/signin.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              'assets/images/pic2.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/pic1.png',
                  width: 600,
                  height: 400,
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontFamily: 'GreatVibes'),
                ),
                Text(
                  "BONE CARE",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            blurRadius: 5,
                            color: Colors.black,
                            offset: Offset(0, 2))
                      ],
                      fontSize: 38,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlayfairDisplay'),
                ),
                SizedBox(height: 20),
                Text(
                  'Your trusted physiotherapy companion!',
                  style: TextStyle(
                      fontFamily: 'IndieFlower',
                      color: const Color.fromARGB(255, 95, 95, 95)),
                ),
                Text(
                  'Access personalized instructions, video',
                  style: TextStyle(
                      fontFamily: 'IndieFlower',
                      color: const Color.fromARGB(255, 95, 95, 95)),
                ),
                Text(
                  'guidance, and a supportive social',
                  style: TextStyle(
                      fontFamily: 'IndieFlower',
                      color: const Color.fromARGB(255, 95, 95, 95)),
                ),
                Text(
                  'platform. Let’s work together toward a',
                  style: TextStyle(
                      fontFamily: 'IndieFlower',
                      color: const Color.fromARGB(255, 95, 95, 95)),
                ),
                Text(
                  'stronger, healthier you!',
                  style: TextStyle(
                      fontFamily: 'IndieFlower',
                      color: const Color.fromARGB(255, 95, 95, 95)),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 8, 45, 100),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
