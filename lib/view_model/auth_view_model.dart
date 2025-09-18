import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  // Loading / error
  bool _loading = false;
  bool get loading => _loading;
  String? _error;
  String? get error => _error;

  // Remember me
  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;
  void toggleRememberMe(bool v) { _rememberMe = v; notifyListeners(); }

  // Password rules state
  bool _isPasswordStrong = false;
  bool get isPasswordStrong => _isPasswordStrong;

  bool hasMinLength = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;

  // Control whether rules container should be shown (user attempted submit)
  bool _showRules = false;
  bool get showRules => _showRules;
  void setShowRules(bool v) { _showRules = v; notifyListeners(); }

  // Check password strength (call on every password change)
  void checkPasswordStrength(String password) {
    hasMinLength = password.length >= 8;
    hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    hasNumber = RegExp(r'\d').hasMatch(password);
    hasSpecialChar = RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password);

    _isPasswordStrong = hasMinLength && hasUppercase && hasNumber && hasSpecialChar;
    // If password became strong we can hide the rules container automatically
    if (_isPasswordStrong && _showRules) _showRules = false;
    notifyListeners();
  }

  void resetPasswordFlags() {
    hasMinLength = hasUppercase = hasNumber = hasSpecialChar = false;
    _isPasswordStrong = false;
    _showRules = false;
    notifyListeners();
  }

  // Login
  Future<bool> login(String email, String password) async {
    _loading = true; notifyListeners();
    try {
      final ok = await _authService.login(email, password);
      _loading = false; notifyListeners();
      return ok;
    } catch (e) {
      _loading = false; _error = e.toString(); notifyListeners();
      return false;
    }
  }

  // Signup
// Signup
  Future<bool> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String degree,
    required String year,
    String? imagePath,
    String? receiptPath,
  }) async {
    _loading = true; notifyListeners();
    try {
      final ok = await _authService.signup(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        degree: degree,
        year: year,
        imagePath: imagePath,
        receiptPath: receiptPath,
      );
      _loading = false; notifyListeners();
      return ok;
    } catch (e) {
      _loading = false; _error = e.toString(); notifyListeners();
      return false;
    }
  }


  // Reset password
  Future<bool> resetPassword(String email, String newPassword) async {
    _loading = true; notifyListeners();
    try {
      final ok = await _authService.resetPassword(email, newPassword);
      _loading = false; notifyListeners();
      return ok;
    } catch (e) {
      _loading = false; _error = e.toString(); notifyListeners();
      return false;
    }
  }
}
