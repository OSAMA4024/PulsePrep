import 'package:flutter/material.dart';
import 'package:pp_project/views/auth_screens/forget_password_Screen.dart';
import 'package:pp_project/views/auth_screens/start_Screen.dart';
import 'package:provider/provider.dart';
import 'view_model/auth_view_model.dart';
import 'views/auth_screens/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StartScreen(),
    );
  }
}
