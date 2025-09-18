import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MockTestCard extends StatelessWidget {
  final String title;
  final String description;
  final String course;
  final String year;
  final String passPercentage;
  final String duration;
  final String questions;
  final String attempts;
  final bool available;
  final VoidCallback onStart;

  const MockTestCard({
    super.key,
    required this.title,
    required this.description,
    required this.course,
    required this.year,
    required this.passPercentage,
    required this.duration,
    required this.questions,
    required this.attempts,
    required this.available,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔴 Top Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF8B1E24),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: available ? Colors.green : Colors.red,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        available ? Icons.check_circle : Icons.cancel,
                        color: available ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        available ? "Available" : "Unavailable",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: available ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 📄 Description
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: GoogleFonts.mulish(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF434343),
              ),
            ),
          ),

          // 🔹 Info Badges Row 1
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(child: _buildInfoChip(Icons.school, course)),
                const SizedBox(width: 6),
                Expanded(child: _buildInfoChip(Icons.calendar_today, year)),
                const SizedBox(width: 6),
                Expanded(child: _buildInfoChip(Icons.percent, "Pass: $passPercentage")),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // 🔹 Info Badges Row 2
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(child: _buildInfoChip(Icons.access_time, duration)),
                const SizedBox(width: 6),
                Expanded(child: _buildInfoChip(Icons.help_outline, questions)),
                const SizedBox(width: 6),
                Expanded(child: _buildInfoChip(Icons.refresh, attempts)),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ▶ Start Test Button
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B1E24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
              ),
              onPressed: onStart,
              icon: const Icon(Icons.play_arrow, color: Colors.white),
              label: Text(
                "Start Test",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Reusable Chip Builder
  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF82272E)),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
