import 'package:flutter/material.dart';
import 'package:flutter_auth_kit_package/service/auth_service.dart';
import 'package:flutter_auth_kit_package/wedgit/custome_errors.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var obscurePassword = true.obs;
  var emailError = RxnString();
  var passwordError = RxnString();
  var confirmPasswordError = RxnString();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();
  void formValidation(BuildContext context) {
    final isValid = formKey.currentState?.validate() ?? false;

    if (isValid) {
      if (passwordController.text == confirmPasswordController.text) {
        signupWithEmailAndPassword(context);
      } else {
        SnackbarHelper.showError(
          context,
          "Password and Confirm password not match",
        );
      }
    } else {}
  }

  Future<void> signupWithEmailAndPassword(BuildContext context) async {
    try {
      final userCredential = await authService.signupWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential != null) {
       
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      SnackbarHelper.showError(context, "Signup failed: ${e.toString()}");
    }
  }
}
