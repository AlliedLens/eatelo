import 'package:flutter/material.dart';
import 'pages/landingPage.dart';

void main() {
  runApp(
    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eatelo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF860000),
          surface: const Color(0xFFFFEFD5),
        ),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }

}

