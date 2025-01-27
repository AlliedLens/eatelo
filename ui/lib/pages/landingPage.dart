import 'package:flutter/material.dart';
import 'dart:async';
import 'loginSignUpPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _pageController;
  int _currentPage = 0;
  final List<String> _features = [
    "Rank. Eat. Repeat.",
    "Find your perfect Plate",
    "Connect Through Cuisine",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = (_currentPage + 1) % _features.length;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Eatelo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Restaurant\nReviews\nReinvented.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.5, // Line spacing
              ),
            ),
      
            const SizedBox(height: 24),

            // Get Started Button            
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const LoginSignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          
            const SizedBox(height: 24),
          
            // Features Section with Carousel
            const Text(
              'Features:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          
            const SizedBox(height: 16),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _features.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      _features[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),

            const Center(
              child: Text(
                'Contact',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}