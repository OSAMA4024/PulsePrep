import 'package:flutter/material.dart';
class Dashboard_Screen  extends StatelessWidget {
  const Dashboard_Screen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Color(0xff82272E),
      ),
    );
  }
}
