// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class OsteoporosisdetailsScreen extends StatefulWidget {
  const OsteoporosisdetailsScreen({super.key});

  @override
  State<OsteoporosisdetailsScreen> createState() =>
      _OsteoporosisdetailsScreenState();
}

class _OsteoporosisdetailsScreenState
    extends State<OsteoporosisdetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Stack(
        children: [
          // Full-screen image
          Positioned.fill(
            child: Image.asset(
              'assets/images/pic10.png',
              fit: BoxFit.cover,
            ),
          ),

          // Row with Back Button and Title Text
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'What is Osteoporosis?',
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

          // Content inside styled container
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: 20,
            right: 20,
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
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
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    Text(
                      'Osteoporosis is a condition that causes bones to become weak and brittle, making them more prone to fractures. Here are some key points to understand about osteoporosis:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Playfairdisplay',
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '• Bone Density Loss: Bones lose density and become fragile, leading to increased risk of fractures.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Playfairdisplay',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '• Risk of Fractures: Most common fractures occur in the spine, hips, and wrists.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Playfairdisplay',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '• Symptoms Are Often Hidden: Osteoporosis often develops without noticeable symptoms until a fracture occurs.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Playfairdisplay',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '• Diagnosis: A Bone Mineral Density (BMD) test is used to assess bone density and fracture risk.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Playfairdisplay',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '• Treatment: Treatment includes medications, calcium and vitamin D supplements, and weight-bearing exercises.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Playfairdisplay',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '• Physiotherapy: Physiotherapy is a key part of treatment, as it can help improve bone strength and prevent falls with exercises tailored to the patient\'s needs.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Playfairdisplay',
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
