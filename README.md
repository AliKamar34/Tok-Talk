# 💬 Tok Talk

**Tok Talk** is a modern chat application that enables real-time messaging, friend management, and personalized profiles with dark/light theme support.


---

## ✨ Features
- **Real-Time Chat**: Instant messaging with friends.
- **Friend Management**: Add/remove friends and view their profiles.
- **Theme Customization**: Switch between light/dark modes.
- **Profile Customization**: Edit profile picture and name.


---

## 🛠 Technologies Used
- **Flutter**: Cross-platform app development.
- **State Management**: [Bloc](https://pub.dev/packages/flutter_bloc) for state management.
- **Firebase**:
  - **Firestore**: Real-time database for messages.
  - **Authentication**: User sign-up/login.
  - **Storage**: Store profile pictures, chat pictures, and records.
- **UI**: Custom themes and animations.

---

## 📁 Folder Structure (MVVM Architecture)

```

lib/
├── core/
│ ├── utils/ 
│ ├── services/ 
│ ├── models/ 
│ ├── widgets/ 
│ └── error/ # Custom exceptions & error handling
├── features/
│ ├── chat/ # Chat functionality
│ │   ├── data/ # Repositories, models
│ │   └── presentation/
│ │     ├── views/ # Chat UI components
│ │     └── manager/ # Chat cubits
│ ├── friends/ # Friend management
│ │   ├── data/
│ │   └── presentation/
│ ├── profile/ # Profile customization
│ │   ├── data/
│ │   └── presentation/
│ └── theme/ # Theme switching
│   ├── data/
│   └── presentation/
├── app.dart # Main app config
└── main.dart # App entry

```

## OS Support

At present, we officially aim to support the last two versions of the following operating systems:

[<img src="https://raw.githubusercontent.com/creativetimofficial/ct-material-kit-pro-react-native/master/assets/android-logo.png" width="60" height="60" />](https://www.creative-tim.com/product/now-ui-pro-react-native)[<img src="https://raw.githubusercontent.com/creativetimofficial/ct-material-kit-pro-react-native/master/assets/apple-logo.png" width="60" height="60" />](https://www.creative-tim.com/product/now-ui-pro-react-native)
