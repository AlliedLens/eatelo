import 'package:flutter/material.dart';
import 'get_started.dart';
import 'login_page.dart';
import 'signup_page.dart';

void main() {
  runApp(EateloApp());
}

class EateloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eatelo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => GetStartedPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}
