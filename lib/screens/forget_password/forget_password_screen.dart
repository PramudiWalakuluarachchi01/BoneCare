import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bone_care/providers/authuser_provider.dart';
import 'otp_verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text.trim();
                final response = await Provider.of<AuthUserProvider>(context, listen: false).requestPasswordReset(email);
                if (response['status'] == 'success') {
                  final otp = response['otp'].toString();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("OTP sent to your email.")));
                  
                  // Navigate to OTP screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTPVerificationScreen(email: email, serverOtp: otp),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${response['message']}")));
                }
              },
              child: const Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
