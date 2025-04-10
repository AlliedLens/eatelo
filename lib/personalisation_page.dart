import 'package:flutter/material.dart';
import 'ranking_page.dart';

class PersonalisationPage extends StatefulWidget {
  const PersonalisationPage({super.key});

  @override
  _PersonalisationPageState createState() => _PersonalisationPageState();
}

class _PersonalisationPageState extends State<PersonalisationPage> {
  // Track selected preferences for dietary, dining style, and review style
  String? _selectedDietaryPreference;
  String? _selectedDiningStyle;
  String? _selectedReviewStyle;
  
  // Add PageController
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEFD5), // Beige background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/eatelo_logo.png",
          height: 35,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color(0xFF990000),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Personalise Your Profile',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: "RedHatDisplay",
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                // Dietary Preferences Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _buildPreferenceCard(
                    title: 'Select your dietary preferences:',
                    children: [
                      _buildChoiceButton('Vegetarian', _selectedDietaryPreference),
                      _buildChoiceButton('Vegan', _selectedDietaryPreference),
                      _buildChoiceButton('Pescarian', _selectedDietaryPreference),
                      _buildChoiceButton('Gluten-Free', _selectedDietaryPreference),
                      _buildChoiceButton('Halal', _selectedDietaryPreference),
                      _buildChoiceButton('Keto-Friendly', _selectedDietaryPreference),
                      _buildChoiceButton('No Food Left Behind!', _selectedDietaryPreference),
                      _buildChoiceButton('Custom +', _selectedDietaryPreference),
                    ],
                  ),
                ),
                // Dining Style Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _buildPreferenceCard(
                    title: 'Your dining style:',
                    children: [
                      _buildChoiceButton('Solo Diner', _selectedDiningStyle),
                      _buildChoiceButton('Foodie Explorer', _selectedDiningStyle),
                      _buildChoiceButton('Street Food Lover', _selectedDiningStyle),
                      _buildChoiceButton('Brunch Addict', _selectedDiningStyle),
                      _buildChoiceButton('Late-Night Snacker', _selectedDiningStyle),
                      _buildChoiceButton('Fine Dining Enthusiast', _selectedDiningStyle),
                      _buildChoiceButton('Coffee Over Everything', _selectedDiningStyle),
                      _buildChoiceButton('Wine & Dine Fan', _selectedDiningStyle),
                      _buildChoiceButton('Custom +', _selectedDiningStyle),
                    ],
                  ),
                ),
                // Review Style Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _buildPreferenceCard(
                    title: 'Your review style:',
                    children: [
                      _buildChoiceButton('Honest-Critic', _selectedReviewStyle),
                      _buildChoiceButton('Picture-First Reviewer', _selectedReviewStyle),
                      _buildChoiceButton('Detailed Reviewer', _selectedReviewStyle),
                      _buildChoiceButton('Social Media Foodie', _selectedReviewStyle),
                      _buildChoiceButton('Casual Reviewer', _selectedReviewStyle),
                      _buildChoiceButton('Loyal Customer', _selectedReviewStyle),
                      _buildChoiceButton('Video Reviewer', _selectedReviewStyle),
                      _buildChoiceButton('Custom +', _selectedReviewStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Page indicator dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPageIndicator(isActive: _currentPage == 0),
                    _buildPageIndicator(isActive: _currentPage == 1),
                    _buildPageIndicator(isActive: _currentPage == 2),
                  ],
                ),
                const SizedBox(height: 16),
                // Next button
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF990000), Color(0xFFFF330000)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RankingPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _currentPage < 2 ? 'Next' : 'Done',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFEFD5),
                              fontFamily: "RedHatDisplay",
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.arrow_forward, color: Color(0xFFFFEFD5), size: 16),
                        ],
                      ),
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

  // Helper method to create a preference card
  Widget _buildPreferenceCard({required String title, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 153, 144, 144),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            children: children,
          ),
        ],
      ),
    );
  }

  // Helper method to create choice buttons
  Widget _buildChoiceButton(String label, String? selectedValue) {
    final bool isSelected = selectedValue == label;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (isSelected) {
            if (selectedValue == _selectedDietaryPreference) {
              _selectedDietaryPreference = null;
            } else if (selectedValue == _selectedDiningStyle) {
              _selectedDiningStyle = null;
            } else if (selectedValue == _selectedReviewStyle) {
              _selectedReviewStyle = null;
            }
          } else {
            if (['Vegetarian', 'Vegan', 'Pescarian', 'Gluten-Free', 'Halal', 'Keto-Friendly', 'No Food Left Behind!', 'Custom +'].contains(label)) {
              _selectedDietaryPreference = label;
            } else if (['Solo Diner', 'Foodie Explorer', 'Street Food Lover', 'Brunch Addict', 'Late-Night Snacker', 'Fine Dining Enthusiast', 'Coffee Over Everything', 'Wine & Dine Fan', 'Custom +'].contains(label)) {
              _selectedDiningStyle = label;
            } else {
              _selectedReviewStyle = label;
            }
          }
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xFF990000) : Color(0xFFFFEFD5),
        foregroundColor: isSelected ? Color(0xFFFFEFD5) : Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isSelected ? const Color(0xFF990000) : Colors.black.withOpacity(0.8),
            width: 1.5,
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: "RedHatDisplay",
          fontSize: 20,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  // Helper method to create page indicator dots
  Widget _buildPageIndicator({required bool isActive}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF990000) : Colors.grey.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
    );
  }
}
