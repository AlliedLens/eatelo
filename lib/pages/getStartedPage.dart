import 'package:flutter/material.dart';
import 'dart:io';
import './initialRankings.dart';
import 'package:image_picker/image_picker.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  final List<String> restaurantPreferences = [
    'Ambience',
    'Food Quality',
    'Service',
    'Price',
    'Location',
    'Cleanliness',
    'Menu Variety'
  ];
  final List<String> selectedPreferences = [];
  File? profileImage;
  File? bannerImage;

  final ImagePicker _picker = ImagePicker();

  // Function to pick profile picture
  Future<void> pickProfilePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  // Function to pick banner image
  Future<void> pickBannerImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        bannerImage = File(pickedFile.path);
      });
    }
  }

  // Function to handle preference selection
  void togglePreference(String preference) {
    setState(() {
      if (selectedPreferences.contains(preference)) {
        selectedPreferences.remove(preference);
      } else if (selectedPreferences.length < 3) {
        selectedPreferences.add(preference);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You can only select 3 preferences.')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Started'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            const Text(
              'Click any 3:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Preferences Grid
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: restaurantPreferences.map((preference) {
                final isSelected = selectedPreferences.contains(preference);
                return ChoiceChip(
                  label: Text(preference),
                  selected: isSelected,
                  onSelected: (_) => togglePreference(preference),
                  selectedColor: Colors.blue,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // Profile Picture Upload
            const Text(
              'Profile Picture:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: pickProfilePicture,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                backgroundImage: profileImage != null
                    ? FileImage(profileImage!)
                    : null,
                child: profileImage == null
                    ? const Icon(Icons.camera_alt, size: 30, color: Colors.grey)
                    : null,
              ),
            ),
            const SizedBox(height: 24),

            // Banner Upload
            const Text(
              'Choose Banner:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: pickBannerImage,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                  color: Colors.grey[200],
                  image: bannerImage != null
                      ? DecorationImage(
                          image: FileImage(bannerImage!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: bannerImage == null
                    ? const Center(
                        child: Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: Colors.grey,
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 24),

            // Done Button
            ElevatedButton(
              onPressed: selectedPreferences.length == 3
                  ? () {
                      // Navigate to the next page or perform an action
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const InitialRankingPage(), // Replace with your next screen
                        ),
                      );
                    }
                  : null,
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
