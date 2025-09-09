// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_auth_kit_package/service/auth_service.dart';
import 'package:flutter_auth_kit_package/wedgit/custome_errors.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OtpController extends GetxController {
  final otpController = TextEditingController();
  AuthService authService = AuthService();

  Future<void> callOTP(
    String verificationId,
   Function(String token) onLoginSuccess,
    BuildContext context
  ) async {
    try {
       await authService.verifyOTP(verificationId, otpController.text.trim());
     
    

      onLoginSuccess.call('csdcvdwvfwef');
    } catch (e) {
     
      SnackbarHelper.showError(context, "rror during OTP verification: ${e.toString()}");

    }
  }
}
