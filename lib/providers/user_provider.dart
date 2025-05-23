// import 'dart:convert';
// import 'package:bone_care/screens/userprofile_screen/userprofile_screen.dart';
// import 'package:bone_care/services/api_url.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:logger/logger.dart';

// class UserProvider with ChangeNotifier {
//   String _name = '';
//   String _email = '';
//   String _age = '';
//   String _password = '';
//   String _gender = '';
//   bool _isLoading = false;

//   // Getters
//   String get name => _name;
//   String get email => _email;
//   String get age => _age;
//   String get gender => _gender;
//   bool get isLoading => _isLoading;
//   final String _baseUrl = apiUrl();

//   // Setters
//   void setName(String name) {
//     _name = name;
//     notifyListeners();
//   }

//   void setEmail(String email) {
//     _email = email;
//     notifyListeners();
//   }

//   void setAge(String age) {
//     _age = age;
//     notifyListeners();
//   }

//   void setPassword(String password) {
//     _password = password;
//     notifyListeners();
//   }

//   void setGender(String gender) {
//     _gender = gender;
//     notifyListeners();
//   }

//   // Sign-up function
//   Future<void> signUp(BuildContext context) async {
//     String apiUrl = "$_baseUrl/api/signup";
//     _isLoading = true;
//     notifyListeners();

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "name": _name,
//           "email": _email,
//           "age": _age,
//           "gender": _gender,
//           "password": _password,
//         }),
//       );

//       final responseData = jsonDecode(response.body);

//       if (response.statusCode == 200) {
//         // Store user details in provider
//         _name = responseData["name"];
//         _email = responseData["email"];
//         _age = responseData["age"];
//         _gender = responseData["gender"];

//         notifyListeners();

//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//               content: Text("Signup successful!"),
//               backgroundColor: Colors.green),
//         );

//         // Navigate to User Profile Screen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const UserProfileScreen()),
//         );
//       }
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text("An error occurred"), backgroundColor: Colors.red),
//       );
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   // Fetch user profile by email
//   Future<void> fetchUserProfile(String email) async {
//     String apiUrl = "$_baseUrl/api/userProfile/$email";
//     Logger().f(email);

//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         _name = data['name'];
//         _age = data['age'];
//         _email = data['email'];
//         _gender = data['gender'];
//         notifyListeners();
        
//       } else {
//         print("Failed to fetch user profile");
//       }
//     } catch (error) {
//       print("Error fetching user profile: $error");
//     }
//   }
// }
