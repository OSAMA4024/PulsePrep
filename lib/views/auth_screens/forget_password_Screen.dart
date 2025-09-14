
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pp_project/views/auth_screens/signup.dart';
import 'package:provider/provider.dart';
import '../../view_model/auth_view_model.dart';
import '../../widgets/auth_screen_widgets/custom_elevated_button.dart';
import '../../widgets/auth_screen_widgets/custom_textfield.dart';
import '../../widgets/auth_screen_widgets/password_rules_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFD6D6D6),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo2.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 3.0),
              child: Text(
                'Forgot Password',
                style: GoogleFonts.jost(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff202244),
                ),
              ),
            ),

            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Text(
                'Enter your new password below',
                style: GoogleFonts.mulish(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff202244),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // New Password
                  CustomTextField(
                    title: 'New Password',
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.lock_outline, color: Color(0xff434343), size: 22),
                    suffixIcon: const Icon(Icons.visibility_off_outlined, color: Color(0xff434343), size: 22),
                    onChanged: (value) {
                      authVM.checkPasswordStrength(value);
                    },
                  ),

                  const SizedBox(height: 15),

                  // Confirm Password
                  CustomTextField(
                    title: 'Confirm Password',
                    controller: confirmPasswordController,
                    hintText: 'Password',
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.lock_outline, color: Color(0xff434343), size: 22),
                    suffixIcon: const Icon(Icons.visibility_off_outlined, color: Color(0xff434343), size: 22),
                  ),

                  const SizedBox(height: 10),

                  // Password Rules Container (only after clicking SIGN UP with weak password)
                  if (authVM.showRules && !authVM.isPasswordStrong)
                    PasswordRulesWidget(),
                ],
              ),
            ),

            Center(
              child: CustomElevatedButton(
                text: 'Change Password',
                onPressed: () {
                  final password = passwordController.text.trim();
                  final confirmPassword = confirmPasswordController.text.trim();

                  // If weak password → show rules
                  if (!authVM.isPasswordStrong) {
                    authVM.setShowRules(true);
                    return;
                  }

                  // If passwords don’t match
                  if (password != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Passwords do not match")),
                    );
                    return;
                  }

                  // Otherwise success → Go to LoginScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SinUpScreen()),
                  );
                },

              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Divider(color: Color(0xff434343), thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or Continue With',
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff434343),
                    ),
                  ),
                ),
                Expanded(child: Divider(color: Color(0xff434343), thickness: 1)),
              ],
            ),
            SizedBox(height: 20),

            // Social login buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Google button
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {
                      // Google login
                    },
                    child: Center(
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/google2.png",
                          width: 28, // scale manually
                          height: 28,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),

                // Apple button
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {
                      // Apple login
                    },
                    child: Center(
                      child: Icon(
                        Icons.apple,
                        color: Colors.black,
                        size: 28, // perfect fit
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Don't have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an Account?',style: GoogleFonts.mulish(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff434343),
                ),),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SinUpScreen()));
                      // Navigate to sign up screen
                    },
                    child: Text('SIGN UP',
                      style: GoogleFonts.mulish(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff0961F5),
                      ),)
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

