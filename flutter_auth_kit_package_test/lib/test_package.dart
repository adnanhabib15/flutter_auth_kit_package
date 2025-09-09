import 'package:flutter/material.dart';
import 'package:flutter_auth_kit_package/flutter_auth_kit_package.dart';
import 'package:flutter_auth_kit_package_test/home_screen.dart';


class TestPackage extends StatefulWidget {
  const TestPackage({super.key});

  @override
  State<TestPackage> createState() => _TestPackageState();
}

class _TestPackageState extends State<TestPackage> {
 
  bool signInEmailPassword = false;
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _text1Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            SizedBox(
              height: 350,
              child: FlutterAuthKitPackage(
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
            ),
            textFormWithButton(context),
          ],
        ),
      ),
    );
  }

  Widget textFormWithButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter something',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _text1Controller,
              decoration: const InputDecoration(
                labelText: 'Enter something',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  
                  setState(() {
                    signInEmailPassword = true;
                  });
               
                }
              },
              child: const Text('Submit'),
            ),

            
          ],
        ),
      ),
    );
  }
}
