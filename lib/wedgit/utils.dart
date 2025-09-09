class InputValidators {
  static String? validateEmailAddress(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+",
    ).hasMatch(email)) {
      return 'Enter a valid email';
    }
    return null;
  }
   static String? validateTextField(String? value, String validationMsg) {
    if (value == null || value.isEmpty) {
      return validationMsg;
    }
    return null;
  }
}