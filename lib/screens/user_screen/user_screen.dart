// ignore_for_file: deprecated_member_use

// import 'package:bone_care/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width * 1,
          height: size.height * 1,
          child: Stack(
            children: [
              // Full-screen background image
              Positioned.fill(
                child: Image.asset(
                  'assets/images/pic12.png', // Ensure this image exists in your assets folder
                  fit: BoxFit.cover, // Covers the entire screen
                ),
              ),

              Positioned(
                top: 50,
                left: 20,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.pop(context); // Navigates back to Home Screen
                  },
                ),
              ),
              // Content on top of the image
              Positioned(
                top: 90, // Adjust as needed
                left: 20,
                child: Text(
                  'User Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Playfairdisplay',
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Adjust color based on image contrast
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
                top: 230, // Adjust as needed
                right: 50,
                left: 130,
                child: Text(
                  'User Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Playfairdisplay',
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Adjust color based on image contrast
                    shadows: [
                      Shadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2, 2)),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 310,
                left: 20,
                right: 20,
                child: TextField(
                  controller: _nameController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 4, 4, 4)),
                    filled: true,
                    fillColor: const Color.fromARGB(147, 203, 202, 202)
                        .withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 390,
                left: 20,
                right: 20,
                child: TextField(
                  controller: _ageController,
                  keyboardType:
                      TextInputType.number, // Ensures only numbers are entered
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Age',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: const Color.fromARGB(147, 203, 202, 202)
                        .withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 470,
                left: 20,
                right: 20,
                child: TextField(
                  controller: _addressController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: const Color.fromARGB(147, 203, 202, 202)
                        .withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 550,
                left: 20,
                right: 20,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType
                      .emailAddress, // Ensures proper email keyboard
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: const Color.fromARGB(147, 203, 202, 202)
                        .withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 630,
                left: 20,
                right: 20,
                child: TextField(
                  controller: _dobController,
                  readOnly: true, // Prevents manual input
                  onTap: () => _selectDate(context), // Opens date picker
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: const Color.fromARGB(147, 203, 202, 202)
                        .withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Icon(Icons.calendar_today,
                        color: Colors.black), // Calendar icon
                  ),
                ),
              ),
              Positioned(
                top: 710,
                left: 20,
                right: 20,
                child: TextField(
                  controller: _mobileController,
                  keyboardType:
                      TextInputType.phone, // Ensures phone number input format
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: const Color.fromARGB(147, 203, 202, 202)
                        .withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 120,
                right: 120,
                child: GestureDetector(
                  onTap: () {
                    // You can implement the update functionality here
                    print("Profile Updated");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 8, 45, 100),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Update Profile',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Playfairdisplay',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
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
