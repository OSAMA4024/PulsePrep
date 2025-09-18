import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pp_project/views/dash_board/mockup_test_screen.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_dropdown_box.dart';
import '../../widgets/home_screen_widgets/performance_cards.dart';
import '../../widgets/home_screen_widgets/quick_box.dart';
import '../../widgets/home_screen_widgets/tips_list.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backbutton: false,
        titlename: 'Dashboard',
        subtitle: 'Welcome back, John!',
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dashboard',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  CustomDropdownBox(),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Performance Overview',
                style: GoogleFonts.inter(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 16),

              // Performance cards
              Row(
                children: [
                  Expanded(
                    child: PerformanceCards(
                      icon: Icons.science_outlined,
                      title: 'Mock Test',
                      color: const Color(0xff82272E),
                      completedScoreValue: '8',
                      bestScoreValue: '78%',
                    ),
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: PerformanceCards(
                      icon: Icons.description,
                      title: 'Model Paper',
                      color: Colors.green,
                      completedScoreValue: '5',
                      bestScoreValue: '82%',
                    ),
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: PerformanceCards(
                      icon: Icons.fitness_center,
                      title: 'Practice',
                      color: const Color(0xff2D6FEF),
                      completedScoreValue: '12',
                      bestScoreValue: '69%',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Quick Actions
              Text(
                'Quick Actions',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: QuickBox(
                          title: 'Start Mock Test',
                          color: const Color(0xff82272E),
                          description:
                          'Take a timed practice test to access your knowledge and improve performance',
                          icon: Icons.contact_page,
                          Ontab: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>  MockupTestScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: QuickBox(
                          title: 'Solve Model Paper',
                          color: Colors.blue,
                          description:
                          'Practice with past year papers and exam-style questions',
                          icon: Icons.price_change,
                          Ontab: (){},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: QuickBox(
                          title: 'My Notes',
                          color: Colors.purple,
                          description:
                          'Create, organize and review your personal study notes',
                          icon: Icons.notes,
                          Ontab: (){},
                        ),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: QuickBox(
                          title: 'Practice Module',
                          color: Colors.green,
                          description:
                          'Study topic wise with customizable practice sessions',
                          icon: Icons.sports_gymnastics,
                          Ontab: (){},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: QuickBox(
                          title: 'View Progress',
                          color: Colors.deepOrange,
                          description:
                          'Track your performance and identify improvement areas',
                          icon: Icons.bar_chart,
                          Ontab: (){},
                        ),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: QuickBox(
                          title: 'Manage Profile',
                          color: Colors.blueGrey,
                          description:
                          'Update your personal information and preferences',
                          icon: Icons.account_circle_rounded,
                          Ontab: (){},
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Study Tips
              Text(
                'Study Tips',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: const [
                  TipsList(
                    title: 'Plan Ahead',
                    color: Colors.blue,
                    description:
                    'Track your performance and identify improvement areas',
                    icon: Icons.lightbulb,
                  ),
                  SizedBox(height: 12),
                  TipsList(
                    title: 'Stay Consistent',
                    color: Colors.deepOrange,
                    description:
                    'Daily practice ensures better understanding and results',
                    icon: Icons.lightbulb,
                  ),
                  SizedBox(height: 12),
                  TipsList(
                    title: 'Revise Regularly',
                    color: Colors.yellow,
                    description:
                    'Review your notes frequently to retain information',
                    icon: Icons.lightbulb,
                  ),
                  SizedBox(height: 12),
                  TipsList(
                    title: 'Take Breaks',
                    color: Colors.blueGrey,
                    description:
                    'Short breaks between study sessions improve focus',
                    icon: Icons.lightbulb,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}