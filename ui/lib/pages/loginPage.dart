import 'package:eatelo/pages/homePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Column(
              // Login Form
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage() )
                    );
                  },
                  child: const Text('Login'),
                ), 
                const SizedBox(height: 20),
                const Placeholder(
                  child: Text(' Have to implement OAuth for login here as well FML'),
                )


              ],
    );
  }
}