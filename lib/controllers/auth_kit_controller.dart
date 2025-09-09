// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_kit_package/service/auth_service.dart';
import 'package:flutter_auth_kit_package/wedgit/custome_errors.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AuthKitController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obscurePassword = true.obs;
  var emailError = RxnString();
  var passwordError = RxnString();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  void formValidation(
    Function(String token) onLoginSuccess,
    BuildContext context,
  ) {
    print('scdvfdsfgewrtger');
    final isValid = formKey.currentState?.validate() ?? false;

    if (isValid) {
      signupWithEmailAndPassword(onLoginSuccess, context);
    } else {}
  }

  Future<void> signupWithEmailAndPassword(
    Function(String token) onLoginSuccess,
    BuildContext context, {
    String? email,
    String? password,
    bool onlyFuntioncall = false,
  }) async {
    final UserCredential? userCredential;
    print('sdfgdsfghy');
    try {
      if (onlyFuntioncall == true) {
 
        userCredential = await authService.signInWithEmailAndPassword(
          email: email ?? '',
          password: password ?? '',
        );
      
      } else {
        userCredential = await authService.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
       
      }
      if (userCredential != null) {
        final user = userCredential.user;

        // Get the ID token
        final token = await user?.getIdToken();
        onLoginSuccess.call(token ?? '');
      } else {
        SnackbarHelper.showError(
          context,
          "Login failed: No user credential returned",
        );
      }
    } catch (e) {
      SnackbarHelper.showError(context, "Login failed:  ${e.toString()}");
    }
  }

  Future<void> signInGoogle(
    Function(String token) onLoginSuccess,
    BuildContext context,
  ) async {
    try {
      final userCredential = await authService.signInWithGoogle();

      if (userCredential != null) {
        final user = userCredential.user;
        final token = await user?.getIdToken();
        onLoginSuccess.call(token ?? '');
      }
    } catch (e) {
      SnackbarHelper.showError(
        context,
        "Error during Google sign-in: ${e.toString()}",
      );
    }
  }

  Future<void> signInWithApple(
    Function(String token) onLoginSuccess,
    BuildContext context,
  ) async {
    try {
      final userCredential = await authService.signInWithApple();

      if (userCredential != null) {
        final idToken = await userCredential.user?.getIdToken();

        if (idToken != null) {
          onLoginSuccess.call(idToken);
        } else {
          SnackbarHelper.showError(context, "Failed to get ID token.");
        }
      } else {
        SnackbarHelper.showError(context, "Apple sign-in returned null.");
      }
    } catch (e) {
      SnackbarHelper.showError(
        context,
        "Error during Apple Sign-In: ${e.toString()}",
      );
    }
  }

  Future<void> loginAnonymously(
    Function(String token) onLoginSucces,
    BuildContext context,
  ) async {
    final userCredential = await authService.signInAnonymously();
    try {
      if (userCredential != null) {
        final idToken = await userCredential.user?.getIdToken();

        onLoginSucces.call(idToken ?? '');
        //  print('Signed in anonymously as: ${userCredential.user?.uid}');
      }
    } catch (e) {
      SnackbarHelper.showError(
        context,
        "Anonymous sign-in failed: ${e.toString()}",
      );
    }

    // You can navigate or update UI state here
  }
}
