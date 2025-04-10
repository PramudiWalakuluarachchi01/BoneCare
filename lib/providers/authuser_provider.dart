import 'dart:convert';

import 'package:bone_care/screens/userprofile_screen/userprofile_screen.dart';
import 'package:bone_care/services/api_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class AuthUserProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = false;
  String _name = '';
  String _email = '';
  String _age = '';
  String _password = '';
  String _gender = '';
  final String _baseUrl = apiUrl();

  // Getters
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  String get name => _name;
  String get email => _email;
  String get age => _age;
  String get gender => _gender;

  // Setters
  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setAge(String age) {
    _age = age;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  // Sign-in function
  Future<void> signIn(String email, String password) async {
    String apiUrl = "$_baseUrl/api/signin";
    _isLoading = true;
    FlutterSecureStorage storage = const FlutterSecureStorage();
    setEmail(email);
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _isAuthenticated = true;
        storage.write(key: "userId", value: responseData["userId"].toString());
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

  // Sign-up function
  Future<void> signUp(BuildContext context) async {
    String apiUrl = "$_baseUrl/api/signup";
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": _name,
          "email": _email,
          "age": _age,
          "gender": _gender,
          "password": _password,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _name = responseData["name"];
        _email = responseData["email"];
        _age = responseData["age"];
        _gender = responseData["gender"];

        notifyListeners();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Signup successful!"),
              backgroundColor: Colors.green),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UserProfileScreen()),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("An error occurred"), backgroundColor: Colors.red),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch user profile by email
  Future<void> fetchUserProfile(String email) async {
    String apiUrl = "$_baseUrl/api/userProfile/$email";

    try {
      final response = await http.get(Uri.parse(apiUrl));
      Logger().f(response.statusCode);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        _name = responseData["name"];
        _email = responseData["email"];
        _age = responseData["age"].toString();
        _gender = responseData["gender"];

        notifyListeners();
      } else {
        Logger().e("Failed to fetch user profile");
      }
    } catch (error) {
      Logger().e("Error fetching user profile: $error");
    }
  }

  Future<Map<String, dynamic>> requestPasswordReset(String email) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/forgotPassword'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> resetPassword(
      String email, String newPassword) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/resetPassword'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'newPassword': newPassword}),
    );
    return jsonDecode(response.body);
  }
}
