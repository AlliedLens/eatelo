import 'package:flutter/material.dart';
import 'package:eatelo/pages/get_started.dart';
import 'package:eatelo/pages/login_page.dart';
import 'package:eatelo/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.setPersistence(Persistence.NONE);

  runApp(EateloApp());
}

class EateloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eatelo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>  GetStartedPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}