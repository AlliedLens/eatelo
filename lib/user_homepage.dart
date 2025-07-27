import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  final List<String> topRestaurants;
  const UserHomePage({Key? key, required this.topRestaurants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEFD5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Image.asset(
          "assets/eatelo_logo.png",
          height: 35,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile header (placeholder)
              Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.person, size: 32, color: Colors.black),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Shreya Sharma',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "RedHatDisplay",
                        ),
                      ),
                      Text(
                        '@everypic',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontFamily: "RedHatDisplay",
                        ),
                      ),
                      Text(
                        'Bengaluru, Karnataka',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontFamily: "RedHatDisplay",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // My Top Restaurants Section
              const Text(
                'My Top Restaurants',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF990000),
                  fontFamily: "RedHatDisplay",
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: topRestaurants.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFF4B2E19),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFF990000),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        topRestaurants[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "RedHatDisplay",
                        ),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xFFE5C97B),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '1234', // Placeholder for score
                          style: const TextStyle(
                            color: Color(0xFF4B2E19),
                            fontWeight: FontWeight.bold,
                            fontFamily: "RedHatDisplay",
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
} 