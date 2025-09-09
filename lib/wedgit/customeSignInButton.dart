import 'package:flutter/material.dart';

class CustomeSignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  final String text;
  const CustomeSignInButton({
    super.key,
    required this.onPressed,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      child: Row(
       // mainAxisSize: MainAxisSize.m,
        children: [
          Image.asset(
            image,

            ///   'assets/images/facebookLogo.png',
            width: 100,
            height: 56,
            fit: BoxFit.contain,
            package: 'flutter_auth_kit_package',
          ),

          const SizedBox(width: 5),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
