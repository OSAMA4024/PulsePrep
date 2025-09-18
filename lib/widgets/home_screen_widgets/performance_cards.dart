import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PerformanceCards extends StatelessWidget {
  const PerformanceCards({
    super.key, required this.title,
    this.completedScoreValue,
    this.bestScoreValue,
    this.color,
    this.completedScore,
    this.bestScore,
    required this.icon,
  });
  final String title;
  final String ? completedScoreValue;
  final String ? bestScoreValue;
  final color;
  final String ? completedScore;
  final String ? bestScore;
  final IconData icon;



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
                  Text(title, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black,)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(completedScoreValue??'', style: GoogleFonts.openSans(fontSize: 6, color: Colors.black),),
                  Text(bestScoreValue??'', style: GoogleFonts.openSans(fontSize: 6, color: Colors.black),),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Completed Score', style: GoogleFonts.openSans(fontSize: 6, color: Color(0xffA0A4AB),)),
                  SizedBox(width: 8),
                  Text('Best Score', style: GoogleFonts.openSans(fontSize:6,  color: Color(0xffA0A4AB),)),
                ],
              )

              
            ],
          ),
        ),

        // Top border overlay (red color)
        Positioned(
          top: -1.5, // shift slightly up so it "sits" on border
          left: 1.5,
          right: 1.5,
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
    );
  }
}
