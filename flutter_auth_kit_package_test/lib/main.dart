import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth_kit_package_test/test_package.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyBpG1C80InSn9iO0ooh36s4nWxkmhCt3FE',
        appId: '1:596826675867:ios:19c3cd2e1ef8138a48043e',
        messagingSenderId: '596826675867',
        projectId: 'flutterauthkitpackage',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: TestPackage()),
    );
  }
}
