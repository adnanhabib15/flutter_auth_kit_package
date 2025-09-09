import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth_kit_package/controllers/sign_up_controller.dart';
import 'package:flutter_auth_kit_package/wedgit/customeTextButton.dart';
import 'package:flutter_auth_kit_package/wedgit/customeTextField.dart';
import 'package:flutter_auth_kit_package/wedgit/utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Registeration"),
        backgroundColor: Colors.white,
      ),

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    SizedBox(height: 13),
                    CustomTextField(
                      controller: controller.confirmPasswordController,
                      hintText: "Confirm Password",
                      focusNode: controller.confirmPasswordFocusNode,
                      validator:
                          (value) => InputValidators.validateTextField(
                            value,
                            'Password is required',
                          ),
                      isPassword: true,
                    ),
                    SizedBox(height: 24),
                    Custometextbutton(
                      text: 'Registeration',
                      onPressed: () {
                        controller.formValidation(context);
                        // Your submit action
                      },
                    ),
                    
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
