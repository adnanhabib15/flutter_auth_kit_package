
# auth_kit

A Flutter package that provides an authentication kit supporting multiple sign-in methods, including:

- ✅ Email & Password
- ✅ Google Sign-In
- ✅ Apple Sign-In
- ✅ Phone Number Authentication
- ✅ Anonymous Sign-In

## ✨ Features

- Email & Password Sign-in (UI optional, functions can be used directly)
- Apple Sign-in (UI optional, functions can be used directly)
- Phone Number Sign-in (UI optional, functions can be used directly)
## 🖥️ Platform Support

| Platform | Supported |
|----------|-----------|
| Android  | ✅        |
| iOS      | ✅        |
| Web      | ✅        |
| Windows  | ✅        |
| macOS    | ✅        |
| Linux    | ✅        |



## 🧰 Requirements

Flutter SDK: ≥ 3.32.6

Dart SDK: ≥ 3.8.1

## 🚀 Getting Started


1. Create a Firebase Project

     Go to Firebase Console and create a new project.

2. Register Your App

     Register your Android and/or iOS app with the Firebase project.

3. Add Configuration Files

     Download and place the following config files in your Flutter project:

       google-services.json in android/app/

       GoogleService-Info.plist in ios/Runner/

4. Initialize Firebase

In your main.dart, ensure Firebase is initialized

       import 'package:firebase_core/firebase_core.dart';

       void main() async {
       WidgetsFlutterBinding.ensureInitialized();
       await Firebase.initializeApp();
       runApp(MyApp());}


## 🧩 Usage

 ➕ Add to pubspec.yaml:
   
       dependencies:

       firebase_auth: ^5.5.0
       google_sign_in: ^6.3.0
       sign_in_with_apple: ^7.0.1
       intl_phone_field: ^3.2.0


 📦 Import and initialize:
     
       import 'package:flutter_auth_kit_package/flutter_auth_kit_package.dart';

       FlutterAuthKitPackage(
                onLoginSuccessNavigate: (token) {
                 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },

                signInWithEmailAndPassword: true,
                signInWithGmail: true,
                signInWithApple: true,
                signInWithPhoneNumber: true,
                signInWithAnonymously: true,

                signInCallsFunctionality: false,
                emailAndPasswordDone: signInEmailPassword,
                signInWithEmailAndPasswordFunctional: (token) {
              
                },
                email: _textController.text,
                password: _text1Controller.text,
              ),