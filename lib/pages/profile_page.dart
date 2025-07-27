
import 'package:flutter/material.dart';
import 'package:eatelo/pages/restaurant_detail_page.dart';
import 'package:eatelo/pages/new_review_page.dart';
import 'package:eatelo/pages/my_reviews_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEFD5),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewReviewPage(),
            ),
          );
        },
        backgroundColor: const Color(0xFF990000),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          // Logo and Icons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF990000),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'eatelo!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "RedHatDisplay",
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.chat_bubble_outline, color: Color(0xFF990000)),
                const SizedBox(width: 16),
                const Icon(Icons.settings, color: Color(0xFF990000)),
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
                  // User Profile Section
                  _buildUserProfileSection(),
                  
                  const SizedBox(height: 24),
                  
                  // My Top Restaurants Section
                  _buildTopRestaurantsSection(),
                  
                  const SizedBox(height: 24),
                  
                  // My Reviews Section
                  _buildReviewsSection(),
                  
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfileSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Picture
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey[300],
          child: const Icon(Icons.person, size: 40, color: Colors.grey),
        ),
        
        const SizedBox(width: 16),
        
        // User Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shreya Sharma',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF990000),
                  fontFamily: "RedHatDisplay",
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '@shreyyjn25',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: "RedHatDisplay",
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Color(0xFF990000), size: 16),
                  const SizedBox(width: 4),
                  const Text(
                    'Manipal, Karnataka',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: "RedHatDisplay",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              
              // Tags
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildTag('Vegetarian'),
                  _buildTag('Solo Diner'),
                  _buildTag('Street Food Lover'),
                  _buildTag('Honest-Critic'),
                  _buildTag('Chinese'),
                  _buildTag('Food Blogger'),
                  _buildTag('Loves Rooftop Dining'),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Quote
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF990000), width: 1),
                ),
                child: const Text(
                  '"I\'m a true biryani lover—every bite feels like a celebration!"',
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF990000),
                    fontFamily: "RedHatDisplay",
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF990000),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: "RedHatDisplay",
        ),
      ),
    );
  }

  Widget _buildTopRestaurantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'My Top Restaurants',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF990000),
                fontFamily: "RedHatDisplay",
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.edit, color: Color(0xFF990000), size: 20),
          ],
        ),
        const SizedBox(height: 12),
        
        Column(
          children: [
            _buildRestaurantCard('Hadiqa', 'Italian', '1256', 1),
            const SizedBox(height: 8),
            _buildRestaurantCard('Grub Monkeys', 'American', '945', 2),
            const SizedBox(height: 8),
            _buildRestaurantCard('Blah!', 'Continental', '1934', 3),
            const SizedBox(height: 8),
            _buildRestaurantCard('Roy\'s Cafe', 'Bakery & Cafe', '1890', 4),
          ],
        ),
        
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'More',
              style: TextStyle(
                color: Color(0xFF990000),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: "RedHatDisplay",
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, color: Color(0xFF990000)),
          ],
        ),
      ],
    );
  }

  Widget _buildRestaurantCard(String name, String cuisine, String rating, int rank) {
    return GestureDetector(
      onTap: () {
        if (name == 'Hadiqa') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantDetailPage(
                restaurantName: name,
                cuisine: cuisine,
                rating: rating,
              ),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF4B2E19),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Rank
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFF990000),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  '$rank',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            
            const SizedBox(width: 12),
            
            // Restaurant Image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.restaurant, color: Colors.grey, size: 30),
              ),
            ),
            
            const SizedBox(width: 12),
            
            // Restaurant Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "RedHatDisplay",
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cuisine,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontFamily: "RedHatDisplay",
                    ),
                  ),
                ],
              ),
            ),
            
            // Rating
            Text(
              rating,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "RedHatDisplay",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.chat_bubble, color: Color(0xFF990000), size: 24),
            const SizedBox(width: 8),
            const Text(
              'My Reviews',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF990000),
                fontFamily: "RedHatDisplay",
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        Column(
          children: [
            _buildReviewCard(
              'Al Fahm at Hadiqa is an absolute delight! Crispy on the outside, perfectly juicy inside, and seasoned just right. Every bite is packed with flavor, and the tangy dip takes it to the next level. Can\'t wait to have it again!',
              '2:40 pm, 8th August 2024',
            ),
            const SizedBox(height: 8),
            _buildReviewCard(
              'Al Fahm at Hadiqa is an absolute delight! Crispy on the outside, perfectly juicy inside, and seasoned just right. Every bite is packed with flavor, and the tangy dip takes it to the next level. Can\'t wait to have it again!',
              '2:40 pm, 8th August 2024',
            ),
            const SizedBox(height: 8),
            _buildReviewCard(
              'Dum Biriyani at the Mill is an absolute banger! Must try!!',
              '8:45 pm, 27th July 2024',
            ),
          ],
        ),
        
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyReviewsPage(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'More',
                style: TextStyle(
                  color: Color(0xFF990000),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RedHatDisplay",
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down, color: Color(0xFF990000)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReviewCard(String review, String timestamp) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food Image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(Icons.restaurant, color: Colors.grey, size: 30),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Review Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontFamily: "RedHatDisplay",
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  timestamp,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
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
}