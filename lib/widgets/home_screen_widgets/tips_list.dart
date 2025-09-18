import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsList extends StatelessWidget {
  const TipsList({
    super.key,
    required this.title,
    this.color,
    this.description,
    this.icon,
  });
  final String title;
  final color;
  final String? description;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background container with full grey border and borderRadius
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            border: Border.all(
              color: const Color(0xFF979797).withOpacity(0.34),
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
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      icon,
                      color: const Color(0xffFFFFFF),
                      size: 15,
                    ),
                  ),
                  const SizedBox(width: 8),
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
              const SizedBox(height: 8),
              Text(
                description ?? "",
                style: GoogleFonts.inter(fontSize: 8, color: const Color(0xff434343)),
              ),
            ],
          ),
        ),

        // 👉 Left-side border overlay
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          child: Container(
            width: 5, // thickness of left bar
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );

  }
}
