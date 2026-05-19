# 🚗 Car Parts Application

A modern Flutter e-commerce application for browsing and purchasing car parts with Firebase integration.

![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=flat-square&logo=firebase)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

## 📋 Overview

**Car Parts Application** is a full-featured Flutter e-commerce app that enables users to:
- 👤 Create and manage user accounts with Firebase Authentication
- 🛍️ Browse a curated catalog of car parts
- 🛒 Add items to cart and manage quantities
- 💳 Complete purchases with order tracking
- 📊 View order history on the Firebase dashboard

The app is built with a clean architecture using **Cloud Firestore** for real-time data management and **Firebase Analytics** for tracking user interactions.

## ✨ Features

- **User Authentication**
  - Secure Firebase Authentication
  - User registration and login
  - Session management

- **Product Catalog**
  - Browse car parts with smooth animations
  - Swipeable product carousel
  - Detailed product information
  - Real-time inventory from Cloud Firestore

- **Shopping Cart**
  - Add/remove items from cart
  - Update quantities
  - Cart persistence
  - Real-time total calculation

- **Order Management**
  - Complete checkout process
  - Order history tracking
  - User-specific order dashboard (Firebase)

- **Analytics**
  - Firebase Analytics integration
  - User behavior tracking
  - Purchase insights

## 🛠️ Tech Stack

### Frontend
- **Flutter** - UI Framework
- **Dart** - Programming Language
- **Google Fonts** - Typography

### Backend & Services
- **Firebase Authentication** - User management and security
- **Cloud Firestore** - Real-time database for products and orders
- **Firebase Analytics** - User analytics and event tracking
- **Firebase Core** - Core Firebase services

### Development
- **Flutter SDK** >=2.7.0 <3.0.0
- **Dart** >=2.7.0 <3.0.0

## 📦 Dependencies

```yaml
firebase_core: ^0.7.0
cloud_firestore: ^0.16.0+1
firebase_auth: ^0.20.1
firebase_analytics: ^7.0.1
google_fonts: ^1.1.0
cupertino_icons: ^0.1.3
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed ([Download here](https://flutter.dev/docs/get-started/install))
- Dart SDK (included with Flutter)
- Firebase project set up ([Firebase Console](https://console.firebase.google.com))
- Android Studio/Xcode for emulator support

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/IrunguNjagi/Car-Parts-Application.git
   cd Car-Parts-Application
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com)
   - Download your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate directories:
     - Android: `android/app/google-services.json`
     - iOS: `ios/Runner/GoogleService-Info.plist`

4. **Enable Firebase Services**
   - Enable Authentication (Email/Password)
   - Create a Firestore Database
   - Enable Analytics

5. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
Car-Parts-Application/
├── lib/                    # Main application code
│   ├── main.dart          # App entry point
│   ├── screens/           # UI screens
│   ├── models/            # Data models
│   ├── services/          # Firebase services
│   └── widgets/           # Reusable widgets
├── assets/
│   └── images/            # Image assets
├── android/               # Android-specific code
├── ios/                   # iOS-specific code
├── test/                  # Unit and widget tests
├── pubspec.yaml          # Flutter dependencies
└── README.md             # This file
```

## 💻 Usage

### User Registration
1. Launch the app
2. Tap "Sign Up" on the login screen
3. Enter email and password
4. Complete registration

### Browsing Products
1. After login, view the product catalog
2. Swipe left/right to browse car parts
3. Tap on a product to see details

### Adding to Cart
1. Select desired quantity
2. Tap "Add to Cart"
3. View cart summary

### Checkout
1. Review items in cart
2. Proceed to checkout
3. Confirm order
4. Order will be saved to Firebase with your user ID

## 🔐 Security

- Firebase Authentication handles secure user management
- Cloud Firestore security rules restrict data access by user ID
- All sensitive operations are validated server-side
- Environment variables are kept secure

## 📊 Firebase Collections

### Users Collection
- User profile information
- Account preferences

### Products Collection
- Product details (name, description, price)
- Inventory status
- Product images

### Orders Collection
- User ID (for filtering orders by user)
- Order items and quantities
- Timestamps
- Order status

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 🚢 Deployment

### Android
```bash
flutter build apk
```

### iOS
```bash
flutter build ios
```

### Web
```bash
flutter build web
```

## 🐛 Troubleshooting

### Firebase Connection Issues
- Verify your `google-services.json` and `GoogleService-Info.plist` are correctly placed
- Ensure Firebase project ID matches your configuration
- Check internet connectivity

### Build Errors
- Run `flutter clean` and `flutter pub get`
- Update SDK: `flutter upgrade`
- Check Flutter version compatibility

### Firestore Issues
- Verify Firestore database is enabled in Firebase Console
- Check Firestore security rules allow read/write operations
- Ensure correct collection and document names

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase for Flutter](https://firebase.flutter.dev)
- [Cloud Firestore Guide](https://firebase.google.com/docs/firestore)
- [Firebase Authentication](https://firebase.google.com/docs/auth)
- [Dart Language](https://dart.dev)

## 🤝 Contributing

Contributions are welcome! Feel free to:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the MIT License.

## 👤 Author

**Iringu Njagi**
- GitHub: [@IrunguNjagi](https://github.com/IrunguNjagi)
- Repository: [Car-Parts-Application](https://github.com/IrunguNjagi/Car-Parts-Application)

## 🙋 Support

For issues, questions, or suggestions, please:
- Open an [Issue](https://github.com/IrunguNjagi/Car-Parts-Application/issues)
- Check existing documentation
- Review [Flutter troubleshooting guide](https://flutter.dev/docs/testing/troubleshooting)

---

**Made with ❤️ using Flutter**
