import 'package:flutter/material.dart';
import 'preferences_page.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEFD5), // Corrected background color from Figma
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Eatelo Logo
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "eatelo!",
                      style: TextStyle(
                        fontFamily: "RedHatDisplay",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                // Sign Up Card
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
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: "RedHatDisplay",
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFEFD5),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Input Fields
                      _buildInputField("Username"),
                      SizedBox(height: 10),
                      _buildInputField("Email"),
                      SizedBox(height: 10),
                      _buildInputField("Password", isPassword: true),
                      SizedBox(height: 10),
                      _buildInputField("Confirm Password", isPassword: true),
                      SizedBox(height: 20),

                      // Sign Up Button
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to preferences page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PreferencesPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF990000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                        ),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontFamily: "RedHatDisplay",
                            fontSize: 18,
                            color: Color(0xFFFFEFD5),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      // Divider with OR
                      Row(
                        children: [
                          Expanded(child: Divider(color: Color(0xFFFFEFD5))),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Color(0xFFFFEFD5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Color(0xFFFFEFD5))),
                        ],
                      ),

                      SizedBox(height: 10),

                      // Social Login Buttons (Google, Instagram)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton("assets/google_logo.png"),  // ✅ Google
                          SizedBox(width: 20),
                          _buildSocialButton("assets/instagram_logo.png"), // ✅ Instagram
                        ],
                      ),

                      SizedBox(height: 10),

                      // Navigate to Login
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        child: Text(
                          "Already have an account? Sign In",
                          style: TextStyle(
                            fontFamily: "RedHatDisplay",
                            color: Color(0xFFFFEFD5),
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
  Widget _buildSocialButton(String assetPath) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Image.asset(assetPath, height: 24), // Ensure the asset exists
    );
  }
}
