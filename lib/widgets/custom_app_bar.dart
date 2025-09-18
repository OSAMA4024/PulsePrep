import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.backbutton,
    required this.titlename,
    required this.subtitle,
  });

  final bool backbutton;
  final String titlename;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: backbutton,
      backgroundColor: const Color(0xff82272E),
      toolbarHeight: 100,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titlename,
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xffFFFFFF),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xffFFFFFF),
              ),
            ),
          ],
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16, top: 8),
          child: Icon(
            Icons.sticky_note_2_sharp,
            color: Color(0xffFFFFFF),
            size: 28,
          ),
        ),
      ],
    );
  }

  //  Required when creating custom AppBar
  @override
  Size get preferredSize => const Size.fromHeight(100);
}
