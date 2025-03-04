import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _age = '';
  String _password = '';

  // Getters
  String get name => _name;
  String get email => _email;
  String get age => _age;
  String get password => _password;

  // Setters
  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setAge(String value) {
    _age = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  // Method to handle signup logic
  Future<void> signUp() async {
    // Here, you would call your Node.js API for signup.
    print("Signing up with: Name: $_name, Email: $_email, Age: $_age, Password: $_password");
    
    // TODO: Implement API call to backend
  }
}
