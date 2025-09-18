import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pp_project/constant/image_path.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        backgroundColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff82272E),
        unselectedItemColor: const Color(0xff545454),
        selectedLabelStyle: GoogleFonts.mulish(
          color: const Color(0xff82272E),
          fontWeight: FontWeight.w800,
          fontSize: 12,
        ),
        unselectedLabelStyle: GoogleFonts.mulish(
          color: const Color(0xff545454),
          fontWeight: FontWeight.w800,
          fontSize: 12,
        ),
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: "Analytics",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "Model Paper",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science),
            label: "Mock Test",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "Modules",
          ),
        ],
      ),
    );
  }
}
