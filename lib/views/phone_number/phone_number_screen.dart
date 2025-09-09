import 'package:flutter/material.dart';
import 'package:flutter_auth_kit_package/controllers/phone_number_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberScreen extends StatelessWidget {
  final Function(String token) onLoginSuccessNavigate;

  const PhoneNumberScreen({super.key, required this.onLoginSuccessNavigate});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneNumberController());
    //  PhoneNumber number = PhoneNumber(isoCode: 'PK');
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Enter Phone Number") ,backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
               
                IntlPhoneField(
                  focusNode: controller.focusNode,
                  controller: controller.phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  initialCountryCode: 'US', // You can change this
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  languageCode: 'en',
                  onChanged: (phone) {
                    controller.updatePhoneNumber(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ${country.name}');
                  },
                  validator: (value) {
                    if (value == null || value.number.isEmpty) {
                      return 'Enter phone number';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),
                
                ElevatedButton(
                  onPressed:
                      () =>
                          controller.verifyPhoneNumber(context, onLoginSuccessNavigate),
                  child: Text("Send OTP"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
