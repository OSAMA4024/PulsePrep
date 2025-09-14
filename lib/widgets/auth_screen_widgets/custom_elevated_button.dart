import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double width;
  final double height;
  final double borderRadius;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xff82272E),
    this.textColor = Colors.white,
    this.iconColor = const Color(0xff82272E),
    this.width = 350,
    this.height = 60,
    this.borderRadius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Empty space to balance the arrow icon on the right
            SizedBox(width: 40),

            // Centered text
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),
            ),

            // White circle with arrow icon
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.arrow_forward,
                color: iconColor,
                size: 24, // Slightly smaller for better proportion
              ),
            ),
          ],
        ),
      ),
    );
  }
}