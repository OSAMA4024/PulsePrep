import 'dart:async';

class AuthService {
  // 🔹 Mock signup API
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
    await Future.delayed(const Duration(seconds: 2)); // simulate API delay

    print("Signup payload: $firstName, $lastName, $email, $degree, $year, $imagePath, $receiptPath");

    return true; // mock success
  }

  // 🔹 Mock login API
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return email == "test@test.com" && password == "123456";
  }

  // 🔹 Mock reset password API
  Future<bool> resetPassword(String email, String newPassword) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
