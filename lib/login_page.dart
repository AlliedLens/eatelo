import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCECDD), // Background color from Figma
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Eatelo Logo
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      "assets/eatelo_logo.png", // Ensure this matches the correct path
                      height: 50, // Adjust size as needed
                    ),
                  ),
                ),

                // Sign In Card
                Container(
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
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Sign in",
                        style: TextStyle(
                          fontFamily: "RedHatDisplay",
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFEFD5),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Input Fields
                      _buildInputField("Email"),
                      SizedBox(height: 10),
                      _buildInputField("Password", isPassword: true),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0xFFFFEFD5),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      // Sign In Button
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/home'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFFEFD5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                        ),
                        child: Text(
                          "Sign in",
                          style: TextStyle(fontSize: 18, color: Color(0xFF990000)),
                        ),
                      ),

                      SizedBox(height: 10),

                      // Sign Up Navigation
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/signup'),
                        child: Text(
                          "First time Eatelo? Sign Up",
                          style: TextStyle(
                            fontFamily: "RedHatDisplay",
                            color: Color(0xFFFFEFD5),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // "Restaurant Reviews Reinvented"
                Text(
                  "Restaurant Reviews Reinvented",
                  style: TextStyle(
                    fontFamily: "RedHatDisplay",
                    color: Color(0xFF990000),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20),

                // Social Login Buttons
                _buildSocialButton("assets/google_logo.png", "Continue with Google"),
                SizedBox(height: 10),
                _buildSocialButton("assets/instagram_logo.png", "Continue with Instagram"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Input Field Widget
  Widget _buildInputField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFFCECDD),
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: "RedHatDisplay",
          fontSize: 14,
          color: Colors.black54,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Social Button Widget
  Widget _buildSocialButton(String assetPath, String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(assetPath, height: 24), // Logo
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              fontFamily: "RedHatDisplay",
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
