import 'package:flutter/material.dart';
import 'package:flutter_auth_kit_package/controllers/auth_kit_controller.dart';
import 'package:flutter_auth_kit_package/views/phone_number/phone_number_screen.dart';
import 'package:flutter_auth_kit_package/views/signup/sign_up_screen.dart';

import 'package:flutter_auth_kit_package/wedgit/customeSignInButton.dart';
import 'package:flutter_auth_kit_package/wedgit/customeTextButton.dart';
import 'package:flutter_auth_kit_package/wedgit/customeTextField.dart';
import 'package:flutter_auth_kit_package/wedgit/utils.dart';
import 'package:get/get.dart';

class FlutterAuthKitPackage extends StatefulWidget {
  final Function(String token) onLoginSuccessNavigate;

  final bool signInWithEmailAndPassword;
  final bool signInWithGmail;
  final bool signInWithApple;
  final bool signInWithPhoneNumber;
  final bool signInWithAnonymously;

  final bool signInCallsFunctionality;
  final Function(String tokek)? signInWithEmailAndPasswordFunctional;
  final bool emailAndPasswordDone;
  final String? email;
  final String? password;

  const FlutterAuthKitPackage({
    super.key,
    required this.onLoginSuccessNavigate,

    this.signInWithEmailAndPassword = true,
    this.signInWithGmail = true,
    this.signInWithApple = true,
    this.signInWithPhoneNumber = true,
    this.signInWithAnonymously = true,

    this.signInCallsFunctionality = true,
    this.signInWithEmailAndPasswordFunctional,
    this.emailAndPasswordDone = false,
    this.email,
    this.password,
  });

  @override
  State<FlutterAuthKitPackage> createState() => _FlutterAuthKitPackageState();
}

class _FlutterAuthKitPackageState extends State<FlutterAuthKitPackage> {
  final controller = Get.put(AuthKitController());

  @override
  Widget build(BuildContext context) {
    if (widget.signInCallsFunctionality == true) {
      if (widget.emailAndPasswordDone == true) {
        print('fdgdsghbv');

        controller.signupWithEmailAndPassword(
          widget.onLoginSuccessNavigate,
          context,
          email: widget.email,
          password: widget.password,
          onlyFuntioncall: true,
        );
      }
      // Don't render any UI
      return const SizedBox.shrink();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 29),
                    SizedBox(
                      height: 72,
                      child: Row(
                        children: [
                          const Icon(Icons.close), // Cross icon at the start
                          Expanded(
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 18,
                                  //  color: ksSignINTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.signInWithEmailAndPassword == true) ...[
                      CustomTextField(
                        controller: controller.emailController,
                        hintText: "Email",
                        validator: InputValidators.validateEmailAddress,
                        focusNode: controller.emailFocusNode,
                      ),
                      SizedBox(height: 13),
                      CustomTextField(
                        controller: controller.passwordController,
                        hintText: "Password",
                        focusNode: controller.passwordFocusNode,
                        validator:
                            (value) => InputValidators.validateTextField(
                              value,
                              'Password is required',
                            ),
                        isPassword: true,
                      ),

                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 14,
                              //     color: kcLoginForgotPasswordColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Text('Sign up'),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Custometextbutton(
                        text: 'Login',
                        onPressed: () {
                          controller.formValidation(
                            (token) => widget.onLoginSuccessNavigate(token),
                            context,
                          );

                          // Your submit action
                        },
                      ),
                    ],

                    const Spacer(),
                    if (widget.signInWithGmail == true) ...[
                      SizedBox(height: 20),
                      CustomeSignInButton(
                        image: 'assets/images/google.jpg',
                        text: 'Continue with Gmail',
                        onPressed: () {
                          controller.signInGoogle(
                            widget.onLoginSuccessNavigate,
                            context,
                          );
                          // Handle sign-in logic
                        },
                      ),
                    ],
                    if (widget.signInWithApple == true) ...[
                      SizedBox(height: 20),
                      CustomeSignInButton(
                        image: 'assets/images/apple.png',
                        text: 'Continue with Apple',
                        onPressed: () {
                          controller.signInWithApple(
                            widget.onLoginSuccessNavigate,
                            context,
                          );
                        },
                      ),
                    ],
                    if (widget.signInWithPhoneNumber == true) ...[
                      SizedBox(height: 20),
                      CustomeSignInButton(
                        image: 'assets/images/mobile.png',
                        text: 'Continue with Phone Number',
                        onPressed: () {
                          //   Get.to(() => const PhoneNumberScreen());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => PhoneNumberScreen(
                                    onLoginSuccessNavigate:
                                        widget.onLoginSuccessNavigate,
                                  ),
                            ),
                          );
                        },
                      ),
                    ],
                    if (widget.signInWithAnonymously == true) ...[
                      SizedBox(height: 20),
                      CustomeSignInButton(
                        image: 'assets/images/anonyms_image.jpg',
                        text: 'Continue with Anonymously',
                        onPressed: () {
                          controller.loginAnonymously(
                            widget.onLoginSuccessNavigate,
                            context,
                          );
                        },
                      ),
                    ],
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
