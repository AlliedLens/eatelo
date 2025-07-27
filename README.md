# Eatelo - Restaurant Review App

A modern, social restaurant review application built with Flutter and Node.js that revolutionizes how people discover, review, and share their dining experiences.

## 🍽️ About

Eatelo is a comprehensive restaurant review platform that goes beyond traditional rating systems. It combines social networking features with personalized recommendations, allowing users to rank their favorite restaurants, share detailed reviews with photos, and discover new dining spots based on their preferences.

## ✨ Features

### Core Features
- **Restaurant Ranking System**: Rank your top 5 favorite restaurants with drag-and-drop functionality
- **Social Reviews**: Share detailed reviews with photos, ratings, and descriptions
- **Personalized Recommendations**: Get restaurant suggestions based on your preferences and dining style
- **User Profiles**: Create personalized profiles with dietary preferences and review styles
- **Explore Feed**: Discover restaurants and reviews from other users
- **Search & Filter**: Find restaurants by name, cuisine, or location

### User Experience
- **Preference Selection**: Choose from 12 different restaurant preferences (Ambience, Food Quality, Service, Price, etc.)
- **Dining Style Profiles**: Identify as Solo Diner, Foodie Explorer, Street Food Lover, and more
- **Review Styles**: Choose your review approach (Honest-Critic, Picture-First, Detailed Reviewer, etc.)
- **Interactive Feed**: Like, comment, and share restaurant reviews
- **Beautiful UI**: Modern design with Red Hat Display font and intuitive navigation

## 🛠️ Tech Stack

### Frontend
- **Flutter** (v3.5.4+) - Cross-platform mobile app development
- **Dart** - Programming language
- **Material Design** - UI/UX framework
- **Red Hat Display** - Custom typography

### Backend
- **Node.js** - Server runtime
- **Express.js** - Web framework
- **MongoDB** - Database with Mongoose ODM
- **Firebase** - Authentication and cloud services

### Key Dependencies
- `image_picker` - Photo selection and upload
- `google_fonts` - Typography
- `flutter_dotenv` - Environment configuration
- `http` - API communication
- `cors` - Cross-origin resource sharing
- `mongoose` - MongoDB object modeling

## 📱 Screenshots

The app features a clean, modern interface with:
- Onboarding flow with preference selection
- Restaurant ranking interface
- Social feed with reviews and photos
- Detailed restaurant pages
- User profiles with review history

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (v3.5.4 or higher)
- Node.js (v14 or higher)
- MongoDB database
- Firebase project setup

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd eatelo
   ```

2. **Frontend Setup (Flutter)**
   ```bash
   # Install Flutter dependencies
   flutter pub get
   
   # Set up environment variables
   cp dotenv.Develop .env
   # Edit .env with your configuration
   ```

3. **Backend Setup (Node.js)**
   ```bash
   cd backend
   npm install
   
   # Set up environment variables
   cp .env.example .env
   # Edit .env with your MongoDB URI and other configs
   ```

4. **Database Setup**
   - Create a MongoDB database
   - Update the connection string in `backend/.env`

5. **Firebase Setup**
   - Create a Firebase project
   - Add your Firebase configuration to `lib/firebase_options.dart`

### Running the Application

1. **Start the backend server**
   ```bash
   cd backend
   npm start
   ```

2. **Run the Flutter app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
eatelo/
├── lib/                    # Flutter app source code
│   ├── pages/             # App screens and pages
│   ├── components/        # Reusable UI components
│   ├── models/           # Data models
│   ├── api/              # API service classes
│   └── constants/        # App constants
├── backend/              # Node.js server
│   ├── routes/           # API routes
│   ├── models/           # Database models
│   └── server.js         # Main server file
├── assets/               # Images, fonts, and other assets
├── android/              # Android-specific configuration
├── ios/                  # iOS-specific configuration
└── web/                  # Web platform configuration
```

## 🔧 Configuration

### Environment Variables

**Frontend (.env)**
```
API_BASE_URL=your_backend_url
FIREBASE_API_KEY=your_firebase_key
```

**Backend (.env)**
```
PORT=3000
MONGODB_URI=your_mongodb_connection_string
```

## 🎯 Key Features Explained

### Restaurant Ranking
Users can rank their top 5 restaurants using an intuitive drag-and-drop interface. This ranking system helps the app understand user preferences and provide better recommendations.

### Preference-Based Matching
The app uses a sophisticated preference system with 12 different categories:
- Ambience, Food Quality, Service, Price
- Location, Hygiene, Speed of Service
- Portion Size, Affordability, Multi-Cuisine
- Outdoor Seating, Beverage Selection

### Social Features
- Like and comment on reviews
- Share restaurant experiences
- Follow other food enthusiasts
- Build a community around dining experiences

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Team

Eatelo is developed by a passionate team focused on revolutionizing the restaurant review experience.

## 📞 Support

For support, email support@eatelo.com or create an issue in this repository.

---

**Eatelo** - Restaurant Reviews Reinvented 🍽️✨
