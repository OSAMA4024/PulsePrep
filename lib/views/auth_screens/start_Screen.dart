import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pp_project/views/auth_screens/signup.dart';

import '../../widgets/auth_screen_widgets/custom_elevated_button.dart';
import 'login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6D6D6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SizedBox(height: 120,),
          Text(
            'Let’s you in',
            style: GoogleFonts.jost(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: const Color(0xff202244),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // shadow color
                      spreadRadius: 5,
                      blurRadius: 6,
                      offset: const Offset(0, 2), // shadow position
                    ),
                  ],
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
              SizedBox(width: 10),

              Text(
                'Continue with Google',
                style: GoogleFonts.mulish(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff434343),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // shadow color
                      spreadRadius: 5,
                      blurRadius: 6,
                      offset: const Offset(0, 2), // shadow position
                    ),
                  ],
                  //border: Border.all(color: Colors.grey),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () {
                    // Apple login
                  },
                  child: Center(
                    child: Icon(
                      Icons.apple,
                      color: Color(0xff4c4c48),
                      size: 28, // perfect fit
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),

              Text(
                'Continue with Apple  ',
                style: GoogleFonts.mulish(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff434343),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            '( OR )',
            style: GoogleFonts.jost(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: const Color(0xff434343),
            ),
          ),

          SizedBox(height: 30),

          CustomElevatedButton(
            text: 'Login with Your Account',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => SinUpScreen()),
              );
              // Navigate to sign up screen
            },
            child: RichText(
              text: TextSpan(
                text: 'Don\'t have an Account? ',
                style: GoogleFonts.mulish(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff434343),
                ),
                children: [
                  TextSpan(
                    text: 'SIGN UP',
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff0961F5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
