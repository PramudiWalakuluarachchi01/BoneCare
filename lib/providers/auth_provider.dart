import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  Future<void> signIn(String email, String password) async {
    const String apiUrl = "http://192.168.1.4:3000/api/signin"; // Update this with your actual API URL

    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _isAuthenticated = true;
        notifyListeners();
      } else {
        _isAuthenticated = false;
        notifyListeners();
        throw Exception(responseData['message']);
      }
    } catch (error) {
      _isAuthenticated = false;
      notifyListeners();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void signOut() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
