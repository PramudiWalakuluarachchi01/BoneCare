// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class UserprofileScreen extends StatelessWidget {
  const UserprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: 90,
                left: 20,
                child: Text(
                  'User Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Playfairdisplay',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          blurRadius: 10,
                          color: Colors.white.withOpacity(0.5),
                          offset: Offset(2, 2)),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 230,
                left: 130,
                right: 50,
                child: Text(
                  'User Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Playfairdisplay',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2, 2)),
                    ],
                  ),
                ),
              ),
              _buildInfoField('Full Name', 'ABCD', 310),
              _buildInfoField('Age', '25', 390),
              _buildInfoField('Address', '123 Colombo', 470),
              _buildInfoField('Email', 'ABCD@Ggmail.com', 550),
              _buildInfoField('Date of Birth', '01/01/1998', 630),
              _buildInfoField('Mobile Number', '1234567890', 710),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, String value, double top) {
    return Positioned(
      top: top,
      left: 20,
      right: 20,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(147, 203, 202, 202).withOpacity(0.9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '$label: $value',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
