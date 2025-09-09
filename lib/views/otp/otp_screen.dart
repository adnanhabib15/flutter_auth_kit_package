import 'package:flutter/material.dart';
import 'package:flutter_auth_kit_package/controllers/otp_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
   final Function(String token) onLoginSuccessNavigate;
  const OtpScreen({
    super.key,
    required this.verificationId,
    required this.onLoginSuccessNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpController());
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP"), backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.otpController,
              decoration: InputDecoration(labelText: 'Enter OTP'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed:
                  () => controller.callOTP(
                    verificationId,
                    onLoginSuccessNavigate,
                    context,
                  ),
              child: Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
