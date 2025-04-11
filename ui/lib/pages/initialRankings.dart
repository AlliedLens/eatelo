import 'package:flutter/material.dart';

class InitialRankingPage extends StatefulWidget {
  const InitialRankingPage({super.key});

  @override
  _InitialRankingPageState createState() => _InitialRankingPageState();
  
}

class _InitialRankingPageState extends State<InitialRankingPage> {
  final TextEditingController searchController = TextEditingController();
  final List<String> allRestaurants = [
    'Pizza Hut',
    'McDonald\'s',
    'KFC',
    'Domino\'s',
    'Subway',
    'Starbucks',
    'Burger King',
    'Chipotle',
    'Taco Bell',
    'Wendy\'s'
  ];

  List<String> filteredRestaurants = [];
  List<String> rankedRestaurants = [];

  @override
  void initState() {
    super.initState();
    filteredRestaurants = allRestaurants;
  }

  void searchRestaurants(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredRestaurants = allRestaurants;
      } else {
        filteredRestaurants = allRestaurants
            .where((restaurant) =>
                restaurant.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void addRestaurantToRank(String restaurant) {
    if (!rankedRestaurants.contains(restaurant) && rankedRestaurants.length < 5) {
      setState(() {
        rankedRestaurants.add(restaurant);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can only rank up to 5 restaurants!')),
      );
    }
  }

  void reorderRestaurants(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final item = rankedRestaurants.removeAt(oldIndex);
      rankedRestaurants.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rank Your Top Restaurants(ChatGPTe\'ed to the max ion what here)'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Heading
            const Text(
              'Rank your top restaurants',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Search Bar
            TextField(
              controller: searchController,
              onChanged: searchRestaurants,
              decoration: InputDecoration(
                hintText: 'Search for restaurants',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),

            // Filtered Restaurants List
            Expanded(
              child: ListView.builder(
                itemCount: filteredRestaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = filteredRestaurants[index];
                  return ListTile(
                    title: Text(restaurant),
                    trailing: rankedRestaurants.contains(restaurant)
                        ? const Icon(Icons.check, color: Colors.green)
                        : IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => addRestaurantToRank(restaurant),
                          ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Ranked Restaurants with Numbers
            const Text(
              'Your Rankings:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            rankedRestaurants.isEmpty
                ? const Text('No restaurants ranked yet.')
                : Expanded(
                    child: ReorderableListView.builder(
                      shrinkWrap: true,
                      itemCount: rankedRestaurants.length,
                      onReorder: reorderRestaurants,
                      itemBuilder: (context, index) {
                        final restaurant = rankedRestaurants[index];
                        return ListTile(
                          key: ValueKey(restaurant),
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(restaurant),
                          trailing: const Icon(Icons.drag_handle),
                        );
                      },
                    ),
                  ),

            const SizedBox(height: 16),

            // Done Button
            ElevatedButton(
              onPressed: rankedRestaurants.isEmpty
                  ? null
                  : () {
                      // Handle submission or navigation to the next screen
                      print('Ranked Restaurants: $rankedRestaurants');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Ranking Submitted!')),
                      );
                    },
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
