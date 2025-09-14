import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Jost font
  static TextStyle jost({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return GoogleFonts.jost(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Poppins font
  static TextStyle poppins({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Mulish font
  static TextStyle mulish({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return GoogleFonts.mulish(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
