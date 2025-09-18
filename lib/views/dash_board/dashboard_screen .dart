import 'package:flutter/material.dart';
import 'package:pp_project/widgets/custom_bottom_nav.dart';
import 'Analytics_Screen.dart';
import 'ModelPaper_Screen.dart';
import 'home_screen.dart';
import 'mockup_test_screen.dart';
import 'modules_screen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 2;

  final List<Widget> _screens = [
    const AnalyticsScreen(),
    const ModelPaperScreen(),
    const HomeScreen(),
    const MockupTestScreen(
    ),
    const ModulesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
