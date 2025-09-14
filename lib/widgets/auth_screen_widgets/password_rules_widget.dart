import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordRulesWidget extends StatelessWidget {
  const PasswordRulesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background container with full grey border and borderRadius
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            border: Border.all(
              color: Color(0xFF979797).withOpacity(0.34),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password Must Contain",
                style: GoogleFonts.mulish(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.circle, size: 8, color: Color(0xff82272E)),
                  SizedBox(width: 5),
                  Text(
                    "8+ characters",
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.circle, size: 8, color: Color(0xff82272E)),
                  SizedBox(width: 9),
                  Text(
                    "1 uppercase letter",
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.circle, size: 8, color: Color(0xff82272E)),
                  SizedBox(width: 5),
                  Text(
                    "1 number",
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.circle, size: 8, color: Color(0xff82272E)),
                  SizedBox(width: 3),
                  Text(
                    "1 special character",
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Top border overlay (red color)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 5, // Matches your top border width
            decoration: BoxDecoration(
              color: Color(0xff82272E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}