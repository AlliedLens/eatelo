import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color(0xFFFFEFD5), // Background color from Figma
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),

          // Eatelo Logo
          Image.asset(
            "assets/eatelo_logo.png",
            height: 50,
          ),
          const SizedBox(height: 20),

          // Title
          const Text(
            "Restaurant Reviews Reinvented",
            style: TextStyle(
              fontFamily: "RedHatDisplay",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF990000),
            ),
          ),

          const SizedBox(height: 60),

          // Placeholder for Image Element
          Container(
            height: 200, // Adjust height as needed
            width: double.infinity,
            color: Colors.transparent, // Set this to an image later
            child: const Center(
              child: Text(
                "Image Element",
                style: TextStyle(
                  fontFamily: "RedHatDisplay",
                  fontSize: 18,
                  color: Color(0xFF990000),
                ),
              ),
            ),
          ),

          const Spacer(),

          // Bottom Section with Gradient
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF990000), // Start gradient (Red)
                  Color(0xFF330000), // End gradient (Dark Red)
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  "Get Started",
                  style: TextStyle(
                    fontFamily: "RedHatDisplay",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFEFD5),
                  ),
                ),

                const SizedBox(height: 20),

                // Sign In Button
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E0B15), // Adjusted button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      fontFamily: "RedHatDisplay",
                      fontSize: 18,
                      color: Color(0xFFFFEFD5),
                    ),
                  ),
                ),

               const SizedBox(height: 10),

                // Create Account Button
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFEFD5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                  ),
                  child: const Text(
                    "Create new account",
                    style: TextStyle(
                      fontFamily: "RedHatDisplay",
                      fontSize: 16,
                      color: Color(0xFF990000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
