import 'package:flutter/material.dart';
import 'profile_page.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  // Track selected preferences
  final Set<String> _selectedPreferences = {};

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Tailor Your Experience',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: "RedHatDisplay",
              ),
            ),
            const SizedBox(height: 4.0),
            const Text(
              'What do you value most when visiting a restaurant?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                fontFamily: "RedHatDisplay",
              ),
            ),
            const SizedBox(height: 35.0),
            // Button choices in a wrapr
            Wrap(
              spacing: 8.0,
              runSpacing: 10.0,
              children: [
                _buildChoiceButton('Ambience'),
                _buildChoiceButton('Food Quality'),
                _buildChoiceButton('Price'),
                _buildChoiceButton('Location'),
                _buildChoiceButton('Service'),
                _buildChoiceButton('Hygiene'),
                _buildChoiceButton('Speed of Service'),
                _buildChoiceButton('Portion Size'),
                _buildChoiceButton('Affordability'),
                _buildChoiceButton('Multi-Cuisine'),
                _buildChoiceButton('Outdoor Seating'),
                _buildChoiceButton('Beverage Selection'),
              ],
            ),
            const Spacer(),
            // Page indicator dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPageIndicator(isActive: true),
                _buildPageIndicator(isActive: false),
                _buildPageIndicator(isActive: false),
                _buildPageIndicator(isActive: false),
              ],
            ),
            const SizedBox(height: 16),
            // Next button in the corner
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
                    MaterialPageRoute(builder: (context) => const ProfilePage(),),);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFEFD5),
                          fontFamily: "RedHatDisplay",
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, color: Color(0xFFFFEFD5), size: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create choice buttons
  Widget _buildChoiceButton(String label) {
    final bool isSelected = _selectedPreferences.contains(label);
    
    return ElevatedButton(
      onPressed: () {
        setState(() {
          // Toggle selection
          if (isSelected) {
            _selectedPreferences.remove(label);
          } else {
            _selectedPreferences.add(label);
          }
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xFF990000) : Color(0xFFFFEFD5), // Red if selected, white if not
        foregroundColor: isSelected ? Color(0xFFFFEFD5): Colors.black, // Text color based on selection
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // Increased padding for bigger size
        elevation: 2, // No shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // More rounded corners
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
          fontSize: 24, // Increased font size
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