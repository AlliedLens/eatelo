# 🖼️ How to Add Images to Your Eatelo App

## 📁 Where to Place Images

### 1. **Assets Directory Structure**
```
eatelo/
├── assets/
│   ├── images/           # Create this folder for all images
│   │   ├── food/         # Food/dish images
│   │   ├── restaurants/  # Restaurant logos/interiors
│   │   ├── profiles/     # User profile pictures
│   │   └── icons/        # Custom icons
│   ├── fonts/            # Your existing fonts
│   └── eatelo_logo.png   # Your existing logo
```

### 2. **Create the Directories**
```bash
mkdir -p assets/images/food
mkdir -p assets/images/restaurants
mkdir -p assets/images/profiles
mkdir -p assets/images/icons
```

## 📝 Update pubspec.yaml

Add your image directories to the `pubspec.yaml` file:

```yaml
flutter:
  uses-material-design: true

  assets:
    # Existing assets
    - assets/fonts/RedHatDisplay-Regular.ttf
    - assets/fonts/RedHatDisplay-Bold.ttf
    - assets/fonts/RedHatDisplay-Medium.ttf
    - assets/fonts/RedHatDisplay-Light.ttf
    - assets/google_logo.png
    - assets/instagram_logo.png 
    - assets/eatelo_logo.png
    - assets/trophy.png
    - dotenv.Develop
    
    # New image directories
    - assets/images/food/
    - assets/images/restaurants/
    - assets/images/profiles/
    - assets/images/icons/
```

## 🖼️ How to Use Images in Code

### 1. **Basic Image Display**
```dart
// Display an image from assets
Image.asset(
  'assets/images/food/biryani.jpg',
  width: 200,
  height: 150,
  fit: BoxFit.cover,
)
```

### 2. **Image with Placeholder**
```dart
Image.asset(
  'assets/images/food/biryani.jpg',
  width: 200,
  height: 150,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) {
    return Container(
      width: 200,
      height: 150,
      color: Colors.grey[300],
      child: const Icon(Icons.restaurant, color: Colors.grey),
    );
  },
)
```

### 3. **Network Images (from URLs)**
```dart
// For images from the internet
Image.network(
  'https://example.com/food-image.jpg',
  width: 200,
  height: 150,
  fit: BoxFit.cover,
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Container(
      width: 200,
      height: 150,
      color: Colors.grey[300],
      child: const Center(child: CircularProgressIndicator()),
    );
  },
  errorBuilder: (context, error, stackTrace) {
    return Container(
      width: 200,
      height: 150,
      color: Colors.grey[300],
      child: const Icon(Icons.error, color: Colors.grey),
    );
  },
)
```

## 🍽️ Example: Adding Food Images to Review Cards

### 1. **Place your food images in `assets/images/food/`**
```
assets/images/food/
├── biryani.jpg
├── al-fahm.jpg
├── pizza.jpg
├── burger.jpg
└── pasta.jpg
```

### 2. **Update the Review Card Code**
```dart
Widget _buildDetailedReviewCard({
  required String username,
  required String timestamp,
  required String restaurantName,
  required String reviewText,
  required String rating,
  required bool hasImage,
  String? imagePath, // Add this parameter
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
              child: imagePath != null
                  ? Image.asset(
                      imagePath,
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
            ),
          ),
        // ... rest of the card content
      ],
    ),
  );
}
```

### 3. **Use the Updated Function**
```dart
_buildDetailedReviewCard(
  username: '@shreyyjn25',
  timestamp: '2:40 pm, 8th Aug 2024',
  restaurantName: 'Hadiqa',
  reviewText: 'Al Fahm at Hadiqa is an absolute delight!...',
  rating: '8.5',
  hasImage: true,
  imagePath: 'assets/images/food/al-fahm.jpg', // Add the image path
),
```

## 🏪 Example: Adding Restaurant Images

### 1. **Place restaurant images in `assets/images/restaurants/`**
```
assets/images/restaurants/
├── hadiqa.jpg
├── grub-monkeys.jpg
├── blah.jpg
└── roys-cafe.jpg
```

### 2. **Update Restaurant Card**
```dart
Widget _buildRestaurantCard(String name, String cuisine, String rating, int rank) {
  return GestureDetector(
    onTap: () {
      // ... navigation logic
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
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/restaurants/${name.toLowerCase().replaceAll(' ', '-')}.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.restaurant, color: Colors.grey, size: 30),
                    ),
                  );
                },
              ),
            ),
          ),
          
          // ... rest of the card
        ],
      ),
    ),
  );
}
```

## 👤 Example: Adding Profile Pictures

### 1. **Place profile images in `assets/images/profiles/`**
```
assets/images/profiles/
├── shreya.jpg
├── sarah.jpg
└── default.jpg
```

### 2. **Use in Profile Section**
```dart
CircleAvatar(
  radius: 40,
  backgroundImage: AssetImage('assets/images/profiles/shreya.jpg'),
  onBackgroundImageError: (exception, stackTrace) {
    // Handle error
  },
  child: const Icon(Icons.person, size: 40, color: Colors.grey),
),
```

## 🔄 After Adding Images

### 1. **Run flutter pub get**
```bash
flutter pub get
```

### 2. **Hot Restart Your App**
```bash
flutter run
```

## 📱 Image Best Practices

### 1. **Image Formats**
- **JPEG**: For photos (food, restaurants, profiles)
- **PNG**: For logos, icons, and images with transparency
- **WebP**: For better compression (supported by Flutter)

### 2. **Image Sizes**
- **Food images**: 400x300px or 800x600px
- **Restaurant logos**: 200x200px
- **Profile pictures**: 150x150px
- **Icons**: 64x64px or 128x128px

### 3. **File Naming**
- Use lowercase letters
- Separate words with hyphens: `al-fahm.jpg`
- Be descriptive: `hadiqa-restaurant.jpg`

### 4. **Optimization**
- Compress images to reduce app size
- Use appropriate formats for different use cases
- Consider using different sizes for different screen densities

## 🚀 Quick Start Checklist

1. ✅ Create image directories
2. ✅ Add directories to `pubspec.yaml`
3. ✅ Place your images in the correct folders
4. ✅ Run `flutter pub get`
5. ✅ Update your code to use the images
6. ✅ Test with `flutter run`

Now your app will have beautiful, real images instead of placeholder icons! 🎉 