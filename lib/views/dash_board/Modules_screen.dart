import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pp_project/widgets/home_screen_widgets/quick_box.dart';
import '../../constant/image_path.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/modules_screen_widgets/Modules_box.dart';
import '../../widgets/modules_screen_widgets/custom_modules_card.dart';
import '../../widgets/custom_dropdown_box.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefe7e7),
      appBar: const CustomAppBar(
        backbutton: false,
        titlename: "Modules",
        subtitle: "Create or access your study modules",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // add spacing around content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available Test',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  CustomDropdownBox(),
                ],
              ),
              SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 32,
                      width: 250,
                      child: TextField(
                        cursorColor: Colors.grey,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.green,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200], // light background

                          // default border (when not focused)
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xff979797), width: 0.5),
                          ),

                          // border when focused
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xff979797),width: 0.5),
                          ),

                        ),
                      )

                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 112,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green, width: 1),
                      ),
                      child: const Center(
                        child: Row(
                          children: [
                            SizedBox(width: 4),
                            Icon(
                              Icons.analytics_outlined,
                              size: 20,
                              color: Colors.green,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Progress",
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ModulesBox(
                      title: '3',
                      icon: Icon(Icons.fitness_center),
                      color: Colors.green,
                      description: 'Topic practice',
                    ),
                    ModulesBox(
                      title: '5%',
                      icon: Icon(Icons.circle),
                      color: Colors.green,
                      description: 'Average Accuracy',
                    ),
                  ],
                ),


              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ModulesBox(
                      title: '283',
                      icon: Icon(Icons.play_circle),
                      color: Colors.green,
                      description: 'Available topics',
                    ),
                    ModulesBox(
                      title: '0',
                      icon: Icon(Icons.menu_book),
                      color: Colors.green,
                      description: 'Topic Practice',
                    ),
                  ],
                ),


              ),
              CustomModuleCard(
                leadingLetter: "D",
                chapters: [
                  Chapter(title: "Neurosciences (MBBS, 2nd Year)", subtitle: "6 topics", ),
                  Chapter(title: "Neurosciences (MBBS, 2nd Year)", subtitle: "6 topics", ),
                ],
              ),
              CustomModuleCard(
                leadingLetter: "D",
                chapters: [
                  Chapter(title: "Neurosciences (MBBS, 2nd Year)", subtitle: "6 topics", ),
                  Chapter(title: "Neurosciences (MBBS, 2nd Year)", subtitle: "6 topics", ),
                  Chapter(title: "Neurosciences (MBBS, 2nd Year)", subtitle: "6 topics", ),
                ],
              ),






            ],
          ),
        ),
      ),
    );
  }
}


