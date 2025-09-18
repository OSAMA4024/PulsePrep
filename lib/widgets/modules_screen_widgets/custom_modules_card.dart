
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chapter {
  final String title;
  final String subtitle;
 // final IconData icon;

  Chapter({required this.title, required this.subtitle,});
}

class CustomModuleCard extends StatelessWidget {
  final String leadingLetter;
  final List<Chapter> chapters;

  const CustomModuleCard({
    super.key,
    required this.leadingLetter,
    required this.chapters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Top Section
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffD9D9D9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              border: Border(
                top: BorderSide(color: Colors.green, width: 3),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.layers, color: Colors.green, size: 32),
                const SizedBox(width: 12),
                Text(
                  leadingLetter,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Chapters in Column
          Column(
            children: chapters.map((chapter) {
              return Container(
                width: 350,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xff979797).withOpacity(0.4)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.chevron_right, color: Colors.green, size: 22),
                    const SizedBox(width: 8),
                    Icon(Icons.local_hospital_outlined, color: Colors.green, size: 22),
                    const SizedBox(width: 10),

                    // 🔹 Text
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            chapter.title,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            chapter.subtitle,
                            style: GoogleFonts.inter(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

