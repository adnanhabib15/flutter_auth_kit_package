<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->
<!-- 
TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more. -->
# auth_kit

A Flutter package that provides an authentication kit supporting multiple sign-in methods, including:

- ✅ Email & Password
- ✅ Google Sign-In
- ✅ Apple Sign-In
- ✅ Phone Number Authentication
- ✅ Anonymous Sign-In

## ✨ Features

- Unified interface for multiple authentication providers
- Easy integration with Firebase Authentication
- Built-in validation and form handling
- Extensible and modular design
- GetX-compatible (or optionally provider/BLoC-friendly)

## 🚀 Getting Started

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  firebase_auth: ^5.5.0
  google_sign_in: ^6.3.0
  sign_in_with_apple: ^7.0.1
  intl_phone_field: ^3.2.0
