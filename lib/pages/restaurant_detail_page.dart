import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatefulWidget {
  final String restaurantName;
  final String cuisine;
  final String rating;
  
  const RestaurantDetailPage({
    super.key,
    required this.restaurantName,
    required this.cuisine,
    required this.rating,
  });

  @override
  _RestaurantDetailPageState createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  int _selectedToolbarIndex = 0;

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
                  '12:30',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "RedHatDisplay",
                  ),
                ),
                const Spacer(),
                const Icon(Icons.signal_cellular_4_bar, size: 16),
                const SizedBox(width: 4),
                const Icon(Icons.wifi, size: 16),
                const SizedBox(width: 4),
                const Icon(Icons.battery_full, size: 16),
              ],
            ),
          ),
          
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
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Restaurant Image Carousel
                  _buildRestaurantImageCarousel(),
                  
                  // Restaurant Information
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Restaurant Name and Follow Button
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${widget.restaurantName}- The Egg Factory',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "RedHatDisplay",
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Follow',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "RedHatDisplay",
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 12),
                        
                        // Cuisine Tags
                        Wrap(
                          spacing: 8,
                          children: [
                            _buildCuisineTag('Italian'),
                            _buildCuisineTag('Continental'),
                            _buildCuisineTag('Local Cuisine'),
                          ],
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Contact Icons and Hours
                        Row(
                          children: [
                            const Icon(Icons.phone, color: Color(0xFF990000), size: 20),
                            const SizedBox(width: 16),
                            const Icon(Icons.email, color: Color(0xFF990000), size: 20),
                            const SizedBox(width: 16),
                            const Icon(Icons.chat_bubble, color: Color(0xFF990000), size: 20),
                            const Spacer(),
                            const Text(
                              'Sun - Mon: 10am - 11pm',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontFamily: "RedHatDisplay",
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Information Cards
                        _buildInformationCards(),
                        
                        const SizedBox(height: 24),
                        
                        // Best Deals & Offers
                        _buildDealsSection(),
                        
                        const SizedBox(height: 24),
                        
                        // Reviews Section
                        _buildReviewsSection(),
                        
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildFloatingToolbar(),
    );
  }

  Widget _buildRestaurantImageCarousel() {
    return Stack(
      children: [
        // Main Image
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: const Center(
            child: Icon(Icons.restaurant, size: 80, color: Colors.grey),
          ),
        ),
        
        // Open Badge
        Positioned(
          top: 16,
          left: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Open',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        
        // Rating
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.rating,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
        
        // Carousel Indicators
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCarouselIndicator(isActive: true),
              const SizedBox(width: 8),
              _buildCarouselIndicator(isActive: false),
              const SizedBox(width: 8),
              _buildCarouselIndicator(isActive: false),
              const SizedBox(width: 8),
              _buildCarouselIndicator(isActive: false),
              const SizedBox(width: 8),
              _buildCarouselIndicator(isActive: false),
              const SizedBox(width: 8),
              _buildCarouselIndicator(isActive: false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselIndicator({required bool isActive}) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF990000) : Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildCuisineTag(String cuisine) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF990000),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        cuisine,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: "RedHatDisplay",
        ),
      ),
    );
  }

  Widget _buildInformationCards() {
    return Column(
      children: [
        // ELO Rating Card
        _buildInfoCard(
          child: Row(
            children: [
              Container(
                width: 60,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'ELO',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.rating,
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 12),
        
        // Popular Dishes Card
        _buildInfoCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Popular Dishes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RedHatDisplay",
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Penne Alfredo Pesto Pasta',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "RedHatDisplay",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 12),
        
        // Location Map Card
        _buildInfoCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Location',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RedHatDisplay",
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Map View',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "RedHatDisplay",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Smrithi Bhavan, behind T.M.A. Pai Park, Eshwar Nagar, Manipal',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: "RedHatDisplay",
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Open in Maps >',
                  style: TextStyle(
                    color: Color(0xFF990000),
                    fontWeight: FontWeight.bold,
                    fontFamily: "RedHatDisplay",
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 12),
        
        // ELO Ranking History Card
        _buildInfoCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Elo Ranking History',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RedHatDisplay",
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Graph View',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "RedHatDisplay",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 12),
        
        // Seating & Ambience Card
        _buildInfoCard(
          child: const Text(
            'Seating: Outdoor, Ambience',
            style: TextStyle(
              fontSize: 14,
              fontFamily: "RedHatDisplay",
            ),
          ),
        ),
        
        const SizedBox(height: 12),
        
        // Real-time Crowd Card
        _buildInfoCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Real time Crowd',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "RedHatDisplay",
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.75,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        '75%',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 12),
        
        // Price Range Card
        _buildInfoCard(
          child: Row(
            children: [
              const Icon(Icons.monetization_on, color: Colors.amber, size: 24),
              const SizedBox(width: 8),
              const Text(
                'Rs 200 - 400',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RedHatDisplay",
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 12),
        
        // Ambience Card
        _buildInfoCard(
          child: const Text(
            'Ambience',
            style: TextStyle(
              fontSize: 14,
              fontFamily: "RedHatDisplay",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  Widget _buildDealsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Best Deals & Offers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF990000),
                fontFamily: "RedHatDisplay",
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFF990000), size: 16),
          ],
        ),
        const SizedBox(height: 12),
        
        Column(
          children: [
            _buildDealCard('Zomato'),
            const SizedBox(height: 8),
            _buildDealCard('Swiggy'),
            const SizedBox(height: 8),
            _buildDealCard('Uber Eats'),
          ],
        ),
      ],
    );
  }

  Widget _buildDealCard(String service) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                service[0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            service,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "RedHatDisplay",
            ),
          ),
        ],
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
              'Reviews',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF990000),
                fontFamily: "RedHatDisplay",
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        _buildReviewCard(),
      ],
    );
  }

  Widget _buildReviewCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, color: Colors.grey, size: 16),
              ),
              const SizedBox(width: 8),
              const Text(
                '@shreyyjn25',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RedHatDisplay",
                ),
              ),
              const Spacer(),
              const Text(
                '2:40 pm, 8th Aug 2024',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: "RedHatDisplay",
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Food Image
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'Al Fahm Dish Image',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "RedHatDisplay",
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Restaurant Name
          const Text(
            'Hadiqa',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "RedHatDisplay",
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Review Text
          const Text(
            'Al Fahm at Hadiqa is an absolute delight! Crispy on the outside, perfectly juicy inside, and seasoned just right. Every bite is packed with flavor, and the tangy dip takes it to the next level. Can\'t wait to have it again!',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontFamily: "RedHatDisplay",
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Rating
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF990000),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '8.5',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingToolbar() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildToolbarItem(Icons.location_on, 0),
          _buildToolbarItem(Icons.tag, 1),
          _buildToolbarItem(Icons.crop_square, 2),
          _buildToolbarItem(Icons.edit, 3),
        ],
      ),
    );
  }

  Widget _buildToolbarItem(IconData icon, int index) {
    bool isSelected = _selectedToolbarIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedToolbarIndex = index;
        });
      },
      child: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.grey,
        size: 24,
      ),
    );
  }
} 