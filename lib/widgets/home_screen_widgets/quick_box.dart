import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickBox extends StatelessWidget {
  const QuickBox({
    super.key,
    required this.title,
    required this.Ontab,
    this.color,
    this.description,
    this.icon,

  });
  final String title;
  final color;
  final String? description;
  final icon;
  final Ontab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontab,
      child: Stack(
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
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                       icon,
                        color: Color(0xffFFFFFF),
                        size: 15,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  description ?? "",
                  style: GoogleFonts.inter(fontSize: 8, color: Color(0xff434343)),
                ),
              ],
            ),
          ), // Top border overlay (red color)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 5, // Matches your top border width
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
