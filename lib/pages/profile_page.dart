
import 'package:flutter/material.dart';
import 'personalisation_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dishController = TextEditingController();

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
            Center(
              child: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                  fontFamily: "RedHatDisplay",
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Profile Picture Section
            Center(
              child: GestureDetector(
                onTap: () {
                  // Implement photo selection logic here
                },
                child: CircleAvatar(
                  radius: 120,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 80,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            // Name Field
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7, // 80% of screen width
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(fontFamily: "RedHatDisplay",fontWeight: FontWeight.w600),
                    filled: true,
        
                    fillColor: Color(0xFFFFEFD5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.black), // Black outline
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 26.0),
            // Favorite Dish Text Field
            TextField(
              controller: _dishController,
              maxLines: 7,
              decoration: InputDecoration(
                
                hintText: 'Write about your favourite dish',
                hintStyle: TextStyle(fontFamily: "RedHatDisplay", fontWeight: FontWeight.w500),
                filled: true,
                fillColor: Colors.white, // Change background color to white
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const Spacer(),
            // Page indicator dots (for 3 pages, as per your layout)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPageIndicator(isActive: false),
                _buildPageIndicator(isActive: true),
                _buildPageIndicator(isActive: false),
                _buildPageIndicator(isActive: false),
              ],
            ),
            const SizedBox(height: 12),
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
                    MaterialPageRoute(builder: (context) => const PersonalisationPage(),),);
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