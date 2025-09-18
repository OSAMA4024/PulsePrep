import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pp_project/views/auth_screens/forget_password_Screen.dart';
import 'package:provider/provider.dart';
import '../../view_model/auth_view_model.dart';
import '../../widgets/auth_screen_widgets/custom_dialogue_box.dart';
import '../../widgets/auth_screen_widgets/custom_elevated_button.dart';
import '../../widgets/auth_screen_widgets/custom_textfield.dart';
import '../dash_board/dashboard_screen .dart';
import 'signup.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Color(0xFFD6D6D6),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // align left by default
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
              padding: const EdgeInsets.symmetric(
                horizontal: 26.0,
                vertical: 3.0,
              ),
              child: Text(
                'Let’s Sign In.!',
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
                'Login to Your Account to Continue your Courses',
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff221F1F),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color(0xff434343),
                      size: 22,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff221F1F),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Color(0xff434343),
                      size: 22,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      color: Color(0xff434343),
                      size: 22,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Checkbox(
                        value: context.watch<AuthViewModel>().rememberMe,
                        onChanged: (value) {
                          context.read<AuthViewModel>().toggleRememberMe(
                            value ?? false,
                          );
                        },
                        activeColor: const Color(0xff285115), //
                        checkColor: Colors.white,
                        side: const BorderSide(
                          color: Color(0xff29711a),
                          width: 1.5,
                        ),
                      ),
                      Text(
                        "Remember Me",
                        style: GoogleFonts.mulish(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.mulish(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff0961F5),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: CustomElevatedButton(
                text: 'Sign In',
                onPressed: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false, // prevent closing by tap
                      builder: (context) => const Center(child: CustomDialogueBox()),
                    );
        
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.of(context).pop(); // close the dialog
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const DashboardScreen()),
                      );
                    });
        
                },
              ),
            ),
            SizedBox(height: 10),
        
            // Divider with "Or Continue With" text
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
            SizedBox(height: 10),
        
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
                Text(
                  'Don\'t have an Account?',
                  style: GoogleFonts.mulish(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff434343),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SinUpScreen()),
                    );
                    // Navigate to sign up screen
                  },
                  child: Text(
                    'SIGN UP',
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff0961F5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
