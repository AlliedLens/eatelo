import 'package:eatelo/components/inputs.dart';
import 'package:eatelo/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'preferences_page.dart';
import 'package:eatelo/constants/app_fonts.dart';
import 'package:eatelo/constants/app_colors.dart';
import 'package:eatelo/components/dialogs.dart';
import 'package:eatelo/components/inputs.dart';
import 'package:eatelo/components/buttons.dart';


class SignUpPage extends StatefulWidget{
  
  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {

  final usernameController = TextEditingController();  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 20,),

              Image.asset(
                "assets/eatelo_logo.png",
                height: 50,
              ),
              // Sign Up Card

              const SizedBox(height: 20,),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.primaryGradient,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: AppFonts.primaryFont,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.background,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Input Fields
                    InputField("Username", usernameController),
                    const SizedBox(height: 10),
                    InputField("Email", emailController),
                    const SizedBox(height: 10 ),
                    InputField("Password", passwordController, isPassword: true),
                    const SizedBox(height: 10),
                    InputField("Confirm Password", confirmPasswordController, isPassword: true),
                    const SizedBox(height: 20),

                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to preferences page
                        if (usernameController.text.isEmpty) {showErrorDialog(context, "empty username"); return;}
                        if (passwordController.text.isEmpty) {showErrorDialog(context, "empty password"); return;}
                        if (confirmPasswordController.text.isEmpty) {showErrorDialog(context, "empty confirmPassword"); return;}
                        if (passwordController.text != confirmPasswordController.text) {showErrorDialog(context, "erroneuous match"); return;}

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PreferencesPage(username: usernameController.text, email: emailController.text, password: passwordController.text)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontFamily: AppFonts.primaryFont,
                          fontSize: 18,
                          color: AppColors.background,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Divider with OR
                    const Row(
                      children: [
                        Expanded(child: Divider(color: AppColors.background)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              fontFamily: AppFonts.primaryFont,
                              color: AppColors.background,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: AppColors.background)),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Social Login Buttons (Google, Instagram)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialButton("assets/google_logo.png"),  // ✅ Google
                        const SizedBox(width: 20),
                        socialButton("assets/instagram_logo.png"), // ✅ Instagram
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Navigate to Login
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: const Text(
                        "Already have an account? Sign In",
                        style: TextStyle(
                          fontFamily: AppFonts.primaryFont,
                          color: AppColors.background,
                          fontSize: 18,
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
    );
  }
}

