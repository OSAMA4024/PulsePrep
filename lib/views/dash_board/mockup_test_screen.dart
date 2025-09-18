import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/mocktest_widget/custom_mockup_box.dart';
import '../../widgets/custom_dropdown_box.dart';
class MockupTestScreen extends StatelessWidget {

  const MockupTestScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // ⬅ removes the back button
        backgroundColor: const Color(0xff82272E),
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30), // round bottom corners
          ),
        ),
        titleSpacing: 0, // ⬅ removes default padding on left
        title: Padding(
          padding: const EdgeInsets.only(left: 16, top: 8), // custom alignment
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mock Test',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFFFFF),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Read carefully before you start',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 8),
            child: Icon(
              Icons.sticky_note_2_sharp,
              color: Color(0xffFFFFFF),
              size: 28,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Available Test',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  CustomDropdownBox(),
                ],
              ),
            ),

            SizedBox(height: 16,),
            MockTestCard(
              title: "Block F: Comprehensive Mock Test 1",
              description: "Comprehensive assessment of block F concept and application",
              course: "MBBS",
              year: "2nd Year",
              passPercentage: "60%",
              duration: "120 mins",
              questions: "120 Questions",
              attempts: "10 Attempts",
              available: true,
              onStart: () {
                print("Test Started!");
              },
            ),
            MockTestCard(
              title: "Block F: Comprehensive Mock Test 1",
              description: "Comprehensive assessment of block F concept and application",
              course: "MBBS",
              year: "2nd Year",
              passPercentage: "60%",
              duration: "120 mins",
              questions: "120 Questions",
              attempts: "10 Attempts",
              available: true,
              onStart: () {
                print("Test Started!");
              },
            ),

            MockTestCard(
              title: "Block F: Comprehensive Mock Test 1",
              description: "Comprehensive assessment of block F concept and application",
              course: "MBBS",
              year: "2nd Year",
              passPercentage: "60%",
              duration: "120 mins",
              questions: "120 Questions",
              attempts: "10 Attempts",
              available: true,
              onStart: () {
                print("Test Started!");
              },
            ),

            MockTestCard(
              title: "Block F: Comprehensive Mock Test 1",
              description: "Comprehensive assessment of block F concept and application",
              course: "MBBS",
              year: "2nd Year",
              passPercentage: "60%",
              duration: "120 mins",
              questions: "120 Questions",
              attempts: "10 Attempts",
              available: true,
              onStart: () {
                print("Test Started!");
              },
            ),

            MockTestCard(
              title: "Block F: Comprehensive Mock Test 1",
              description: "Comprehensive assessment of block F concept and application",
              course: "MBBS",
              year: "2nd Year",
              passPercentage: "60%",
              duration: "120 mins",
              questions: "120 Questions",
              attempts: "10 Attempts",
              available: true,
              onStart: () {
                print("Test Started!");
              },
            ),


          ],
        ),
      ),
    );
  }
}
