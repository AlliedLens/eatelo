import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEFD5), // Background color from Figma
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80),

          // Eatelo Logo
          Image.asset(
            "assets/images/eatelo_logo.png", // Ensure this path is correct
            height: 50,
          ),
          SizedBox(height: 20),

          // Title
          Text(
            "Restaurant Reviews Reinvented",
            style: TextStyle(
              fontFamily: "RedHatDisplay",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF990000),
            ),
          ),

          SizedBox(height: 60),

          // Placeholder for Image Element
          Container(
            height: 200, // Adjust height as needed
            width: double.infinity,
            color: Colors.transparent, // Set this to an image later
            child: Center(
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

          Spacer(),

          // Bottom Section with Gradient
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
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
                Text(
                  "Get Started",
                  style: TextStyle(
                    fontFamily: "RedHatDisplay",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFEFD5),
                  ),
                ),

                SizedBox(height: 20),

                // Sign In Button
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5E0B15), // Adjusted button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontFamily: "RedHatDisplay",
                      fontSize: 18,
                      color: Color(0xFFFFEFD5),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Create Account Button
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFEFD5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                  ),
                  child: Text(
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
