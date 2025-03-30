import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bone_care/providers/user_provider.dart';

class UserprofileScreen extends StatelessWidget {
  const UserprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
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
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                          Shadow(blurRadius: 10, color: Colors.white, offset: Offset(2, 2)),
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
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(147, 203, 202, 202).withOpacity(0.9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '$label: $value',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
