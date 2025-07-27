import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEFD5),
      body: Column(
        children: [
          // Top Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "RedHatDisplay",
                  ),
                ),
                const Spacer(),
                const Text(
                  '12:30',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "RedHatDisplay",
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.wifi, size: 16),
                const SizedBox(width: 4),
                const Icon(Icons.battery_full, size: 16),
              ],
            ),
          ),
          
          // Logo and Icons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Image.asset(
                  "assets/eatelo_logo.png",
                  height: 30,
                ),
                const Spacer(),
                const Icon(Icons.chat_bubble_outline, color: Color(0xFF990000)),
                const SizedBox(width: 16),
                const Icon(Icons.person, color: Color(0xFF990000)),
              ],
            ),
          ),
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Hi Shreya!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: "RedHatDisplay",
                      ),
                    ),
                  ),
                  
                  // New in Town Section
                  const Text(
                    'New in Town!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "RedHatDisplay",
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 240, // Further increased height to prevent overflow
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildRestaurantCard(
                          'Kenz - Al Arab Resto Cafe',
                          'Arabian',
                          'Premier Park Manipal',
                          'assets/placeholder_food.jpg',
                        ),
                        const SizedBox(width: 16),
                        _buildRestaurantCard(
                          'Spice Garden',
                          'Indian',
                          'Downtown Manipal',
                          'assets/placeholder_food.jpg',
                        ),
                        const SizedBox(width: 16),
                        _buildRestaurantCard(
                          'Pizza Palace',
                          'Italian',
                          'University Road',
                          'assets/placeholder_food.jpg',
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Looking for dinner place Section
                  const Text(
                    'Looking for a dinner place?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "RedHatDisplay",
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 170, // Increased height to prevent overflow
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildDiningCard('Eye of the Tiger', 'assets/placeholder_interior.jpg'),
                        const SizedBox(width: 16),
                        _buildDiningCard('Kyoto', 'assets/placeholder_interior.jpg'),
                        const SizedBox(width: 16),
                        _buildDiningCard('The Blue Room', 'assets/placeholder_interior.jpg'),
                        const SizedBox(width: 16),
                        _buildDiningCard('Sky Lounge', 'assets/placeholder_interior.jpg'),
                      ],
                    ),
                  ),
                  
                  // Page indicators for dinner places
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildPageIndicator(isActive: true),
                        const SizedBox(width: 8),
                        _buildPageIndicator(isActive: false),
                        const SizedBox(width: 8),
                        _buildPageIndicator(isActive: false),
                        const SizedBox(width: 8),
                        _buildPageIndicator(isActive: false),
                        const SizedBox(width: 8),
                        _buildPageIndicator(isActive: false),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Today's Offers Section
                  const Text(
                    'Today\'s Offers',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "RedHatDisplay",
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildOfferCard(),
                  
                  // Page indicators for offers
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildPageIndicator(isActive: true),
                        const SizedBox(width: 8),
                        _buildPageIndicator(isActive: false),
                        const SizedBox(width: 8),
                        _buildPageIndicator(isActive: false),
                        const SizedBox(width: 8),
                        _buildPageIndicator(isActive: false),
                        const SizedBox(width: 8),
                        _buildPageIndicator(isActive: false),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(String name, String cuisine, String location, String imagePath) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Restaurant Image
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Colors.grey[300],
            ),
            child: const Center(
              child: Icon(Icons.restaurant, size: 40, color: Colors.grey),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "RedHatDisplay",
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  cuisine,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF990000),
                    fontFamily: "RedHatDisplay",
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: "RedHatDisplay",
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiningCard(String name, String imagePath) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Interior Image
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Colors.grey[300],
            ),
            child: const Center(
              child: Icon(Icons.storefront, size: 30, color: Colors.grey),
            ),
          ),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RedHatDisplay",
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferCard() {
    return Container(
      width: double.infinity,
      height: 150, // Further increased height to prevent overflow
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE53E3E), Color(0xFFC53030)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background food images
          Positioned(
            right: 16,
            top: 16,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.restaurant, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.local_pizza, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'ZOMATO',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE53E3E),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pay using Paytm UPI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "RedHatDisplay",
                  ),
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Text(
                      'GET FLAT ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "RedHatDisplay",
                      ),
                    ),
                    Text(
                      '₹100',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "RedHatDisplay",
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Zomato Cashback',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "RedHatDisplay",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator({required bool isActive}) {
    return Container(
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF990000) : Colors.grey.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
    );
  }
} 