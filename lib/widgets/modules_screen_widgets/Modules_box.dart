import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModulesBox extends StatelessWidget {
  const ModulesBox({
    super.key,
    required this.title,
    this.icon,
    this.color,
    this.description,
  });

  final String title;
  final Icon? icon;
  final Color? color;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 182,
      height: 100,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFF979797).withOpacity(0.34),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: color ?? Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                icon?.icon,
                color: Colors.white,
              )
            ),

            const SizedBox(height: 5),

            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              description ?? "",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 10,
                color: const Color(0xff434343),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
