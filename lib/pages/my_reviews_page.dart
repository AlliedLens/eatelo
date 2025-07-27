import 'package:flutter/material.dart';
import 'package:eatelo/pages/new_review_page.dart';

class MyReviewsPage extends StatefulWidget {
  const MyReviewsPage({super.key});

  @override
  _MyReviewsPageState createState() => _MyReviewsPageState();
}

class _MyReviewsPageState extends State<MyReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEFD5),
      body: Column(
        children: [
          // Back Arrow and Profile Picture
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF990000)),
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, color: Colors.grey),
                ),
              ],
            ),
          ),
          
          // Page Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.chat_bubble, color: Color(0xFF990000), size: 24),
                const SizedBox(width: 8),
                const Text(
                  'My Reviews',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF990000),
                    fontFamily: "RedHatDisplay",
                  ),
                ),
              ],
            ),
          ),
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // First Review Card
                  _buildDetailedReviewCard(
                    username: '@shreyyjn25',
                    timestamp: '2:40 pm, 8th Aug 2024',
                    restaurantName: 'Hadiqa',
                    reviewText: 'Al Fahm at Hadiqa is an absolute delight! Crispy on the outside, perfectly juicy inside, and seasoned just right. Every bite is packed with flavor, and the tangy dip takes it to the next level. Can\'t wait to have it again!',
                    rating: '8.5',
                    hasImage: true,
                    imagePath: 'assets/images/hadiqa.jpg',
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Second Review Card
                  _buildDetailedReviewCard(
                    username: '@shreyyjn25',
                    timestamp: '8:45 pm, 27th July 2024',
                    restaurantName: 'The Mill',
                    reviewText: 'Dum Biriyani at the Mill is an absolute banger! Must try!!',
                    rating: '9.0',
                    hasImage: true,
                    imagePath: 'assets/images/the_mill.jpg',
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Third Review Card (if needed)
                  _buildDetailedReviewCard(
                    username: '@shreyyjn25',
                    timestamp: '1:20 pm, 15th July 2024',
                    restaurantName: 'Grub Monkeys',
                    reviewText: 'Amazing burgers and fries! The patty was juicy and the bun was perfectly toasted. Highly recommend the loaded fries with extra cheese.',
                    rating: '7.8',
                    hasImage: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedReviewCard({
    required String username,
    required String timestamp,
    required String restaurantName,
    required String reviewText,
    required String rating,
    required bool hasImage,
    String? imagePath,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food Image
          if (hasImage)
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Stack(
                  children: [
                    // Food image or placeholder
                    imagePath != null
                        ? Image.asset(
                            imagePath,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: const Center(
                                  child: Icon(Icons.restaurant, size: 50, color: Colors.grey),
                                ),
                              );
                            },
                          )
                        : Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.restaurant, size: 50, color: Colors.grey),
                            ),
                          ),
                    
                    // User info overlay at top left
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey[300],
                              child: const Icon(Icons.person, color: Colors.grey, size: 16),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              username,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: "RedHatDisplay",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
          // Review Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Restaurant Name
                Text(
                  restaurantName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "RedHatDisplay",
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Review Text
                Text(
                  reviewText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontFamily: "RedHatDisplay",
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Bottom Row with engagement and rating
                Row(
                  children: [
                    // Engagement Icons
                    Row(
                      children: [
                        const Icon(Icons.favorite_border, color: Colors.grey, size: 20),
                        const SizedBox(width: 16),
                        const Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 20),
                      ],
                    ),
                    
                    const Spacer(),
                    
                    // Rating
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF990000),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        rating,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                // Timestamp
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