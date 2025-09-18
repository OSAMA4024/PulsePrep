import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_app_bar.dart';
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backbutton: true,
        titlename: 'Osama',
        subtitle: 'jdjaja djdjd jkan ',
      ),
    );
  }
}
