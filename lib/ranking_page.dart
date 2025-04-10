import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> restaurants = []; // This will store the ranked restaurants

  @override
  void dispose() {
    _searchController.dispose();
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Rank Your',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              fontFamily: "RedHatDisplay",
                            ),
                          ),
                          Text(
                            'Favourite Restaurant',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              fontFamily: "RedHatDisplay",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/trophy.png',
                      height: 80,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Search bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for Restaurants...',
                      prefixIcon: const Icon(Icons.menu),
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Ranking section
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 153, 144, 144),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ReorderableListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: restaurants.length,
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final item = restaurants.removeAt(oldIndex);
                    restaurants.insert(newIndex, item);
                  });
                },
                itemBuilder: (context, index) {
                  return Card(
                    key: Key('$index'),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: ListTile(
                      leading: Text(
                        '#${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      title: Text(
                        restaurants[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: const Icon(Icons.drag_handle),
                    ),
                  );
                },
              ),
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
                    _buildPageIndicator(isActive: false),
                    _buildPageIndicator(isActive: false),
                    _buildPageIndicator(isActive: false),
                    _buildPageIndicator(isActive: true),
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
                        // Handle next action
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
        ],
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
