
import 'package:flutter/material.dart';
import './loginPage.dart';
import './signUpPage.dart';

class LoginSignUpPage extends StatefulWidget{ 
  const LoginSignUpPage({super.key});

  @override
  State<LoginSignUpPage> createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage>{

  bool toggleLogin = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text( toggleLogin ? 'Login' : 'Sign up', ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            ElevatedButton(
              onPressed: () {
                setState(() {
                  toggleLogin = true;
                });
              }
            , child: const Text("Have an account? Login") ),

            if (toggleLogin) ...[
              const LoginPage(),
            ] else ... [
              const SignUpPage(),
            ],

            const SizedBox(height: 16,),

            ElevatedButton(onPressed: (){
              setState(() {
                toggleLogin = false;
              });
            }, child: const Text("First-time eater? Sign up"))
              
          ],



        ),
      ),
    );
  }
}