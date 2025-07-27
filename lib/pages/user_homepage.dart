import 'package:flutter/material.dart';
import 'package:eatelo/pages/explore_page.dart';
import 'package:eatelo/pages/profile_page.dart';

class UserHomePage extends StatefulWidget {
  final List<String> topRestaurants;
  
  const UserHomePage({
    super.key,
    required this.topRestaurants,
  });

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int _selectedIndex = 0;
  
  // Track likes for each card
  Map<int, bool> _likedCards = {};
  
  // Track comment counts for each card
  Map<int, int> _commentCounts = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEFD5),
      body: _getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF990000),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _getCurrentPage() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return const ExplorePage();
      case 2:
        return _buildSearchContent();
      case 3:
        return const ProfilePage();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildSearchContent() {
    return const Center(
      child: Text(
        'Search Page',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "RedHatDisplay",
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return Column(
      children: [
        // Top Bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              const Text(
                'Home',
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
        
        // Logo and Message Icon
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
            ],
          ),
        ),
        
        // Content Feed
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildFoodCard(
                0, // card index
                'Hadiqa',
                '@foodlover123',
                1,
                'Al Fahm at Hadiqa is an absolute delight! Crispy on the outside, perfectly juicy inside, and seasoned just right. Every bite is packed with flavor, and the tangy dip takes it to the next level. Can\'t wait to have it again!',
                hasShare: true,
              ),
              const SizedBox(height: 16),
              _buildFoodCard(
                1, // card index
                'Saiba',
                '@chef_sarah',
                2,
                'Delicious',
                hasShare: false,
              ),
              const SizedBox(height: 16),
              _buildFoodCard(
                2, // card index
                'Spice Garden',
                '@tastebuds',
                3,
                'Amazing biryani! The flavors are perfectly balanced and the rice is cooked to perfection.',
                hasShare: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFoodCard(int cardIndex, String restaurantName, String username, int ranking, String description, {bool hasShare = false}) {
    bool isLiked = _likedCards[cardIndex] ?? false;
    int commentCount = _commentCounts[cardIndex] ?? 0;
    
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food Image with Username overlay
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: Colors.grey[300],
                ),
                child: const Center(
                  child: Icon(Icons.restaurant, size: 50, color: Colors.grey),
                ),
              ),
              // Username overlay at top
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "RedHatDisplay",
                    ),
                  ),
                ),
              ),
              // Ranking badge at top right
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF990000),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'User ranked: $ranking',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Restaurant name with location
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Color(0xFF990000), size: 16),
                    const SizedBox(width: 4),
                    Text(
                      restaurantName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "RedHatDisplay",
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                // Description
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontFamily: "RedHatDisplay",
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Action buttons
                Row(
                  children: [
                    // Like button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _likedCards[cardIndex] = !isLiked;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(isLiked ? 'Removed from likes' : 'Added to likes'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? const Color(0xFF990000) : Colors.grey,
                            size: 20,
                          ),
                          if (isLiked) ...[
                            const SizedBox(width: 4),
                            const Text(
                              'Liked',
                              style: TextStyle(
                                color: Color(0xFF990000),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    
                    // Comment button
                    GestureDetector(
                      onTap: () {
                        _showCommentDialog(context, restaurantName, cardIndex);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 20),
                          if (commentCount > 0) ...[
                            const SizedBox(width: 4),
                            Text(
                              '$commentCount',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    
                    if (hasShare) ...[
                      const SizedBox(width: 16),
                      // Share button
                      GestureDetector(
                        onTap: () {
                          _showShareDialog(context, restaurantName, description);
                        },
                        child: const Icon(Icons.share, color: Colors.grey, size: 20),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCommentDialog(BuildContext context, String restaurantName, int cardIndex) {
    final TextEditingController commentController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Comment on $restaurantName'),
          content: TextField(
            controller: commentController,
            decoration: const InputDecoration(
              hintText: 'Write your comment...',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (commentController.text.trim().isNotEmpty) {
                  setState(() {
                    _commentCounts[cardIndex] = (_commentCounts[cardIndex] ?? 0) + 1;
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Comment added successfully!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              child: const Text('Post'),
            ),
          ],
        );
      },
    );
  }

  void _showShareDialog(BuildContext context, String restaurantName, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Share'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.copy),
                title: const Text('Copy Link'),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Link copied to clipboard!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share via...'),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Sharing $restaurantName...'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text('Send as Message'),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Sending $restaurantName as message...'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
} 