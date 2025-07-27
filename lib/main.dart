import 'package:flutter/material.dart';
import 'package:eatelo/pages/get_started.dart';
import 'package:eatelo/pages/login_page.dart';
import 'package:eatelo/pages/signup_page.dart';
import 'package:eatelo/pages/preferences_page.dart';
import 'package:eatelo/pages/personalisation_page.dart';
import 'package:eatelo/pages/ranking_page.dart';
import 'package:eatelo/pages/new_review_page.dart';
import 'package:eatelo/pages/my_reviews_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';

void main() async{
  await dotenv.load(
    fileName: kIsWeb ? "dotenv.Develop" : "dotenv.Develop"
  );

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
        '/': (context) =>  GetStartedPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/preferences': (context) => PreferencesPage(username: '', email: ''),
        '/personalisation': (context) => PersonalisationPage(username: '', email: '', selectedPreferences: []),
        '/ranking': (context) => RankingPage(),
        '/new-review': (context) => NewReviewPage(),
        '/my-reviews': (context) => MyReviewsPage(),
      },
    );
  }
}

/*
  first present problem statement
  why u need it
  what solutions you considered 

  10 mins presentation 5 mins q/a

*/