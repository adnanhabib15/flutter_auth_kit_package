// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_auth_kit_package/service/auth_service.dart';
import 'package:flutter_auth_kit_package/views/otp/otp_screen.dart';
import 'package:flutter_auth_kit_package/wedgit/custome_errors.dart';
import 'package:get/get.dart';

class PhoneNumberController extends GetxController {
  final phoneController = TextEditingController();

  final AuthService authService = AuthService();
final FocusNode focusNode = FocusNode();
  RxString fullPhoneNumber = ''.obs;
  void updatePhoneNumber(String number) {
    fullPhoneNumber.value = number;
    update();
    
  }

  void verifyPhoneNumber(BuildContext context ,Function(String token) onLoginSucces) async {
    if (fullPhoneNumber.isNotEmpty) {
      

      try {
        final verificationId = await authService.sendOTP(fullPhoneNumber.value);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(verificationId: verificationId ,onLoginSuccessNavigate:onLoginSucces ,),
          ),
        );
      } catch (e) {
       
         SnackbarHelper.showError(
        context,
        "Error   OTP Error: ${e.toString()}",
      );
      }
    } else {

       SnackbarHelper.showError(
          context,
          "Please enter a valid phone number",
        );
      
    }
  }
}
