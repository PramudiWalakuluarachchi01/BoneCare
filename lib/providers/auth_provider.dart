// import 'dart:convert';

// import 'package:bone_care/services/api_url.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class AuthProvider with ChangeNotifier {
//   bool _isAuthenticated = false;
//   bool _isLoading = false;

//   bool get isAuthenticated => _isAuthenticated;
//   bool get isLoading => _isLoading;
//   final String _baseUrl = apiUrl();

//   Future<void> signIn(String email, String password) async {
//     String apiUrl = "$_baseUrl/api/signin";

//     _isLoading = true;
//     notifyListeners();

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "email": email,
//           "password": password,
//         }),
//       );

//       final responseData = jsonDecode(response.body);

//       if (response.statusCode == 200) {
//         _isAuthenticated = true;
//         notifyListeners();
//       } else {
//         _isAuthenticated = false;
//         notifyListeners();
//         throw Exception(responseData['message']);
//       }
//     } catch (error) {
//       _isAuthenticated = false;
//       notifyListeners();
//       rethrow;
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   void signOut() {
//     _isAuthenticated = false;
//     notifyListeners();
//   }
// }
