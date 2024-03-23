mixin ValidatorMixin {
  String? validatePassword(String val) {
    if (val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    bool hasLowercase = false;
    bool hasUppercase = false;
    bool hasDigit = false;
    bool hasSpecialChar = false;

    for (int i = 0; i < val.length; i++) {
      if (val[i].contains(RegExp(r'[a-z]'))) {
        hasLowercase = true;
      }
      if (val[i].contains(RegExp(r'[A-Z]'))) {
        hasUppercase = true;
      }
      if (val[i].contains(RegExp(r'[0-9]'))) {
        hasDigit = true;
      }
      if (val[i].contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialChar = true;
      }
    }

    if (!(hasLowercase)) {
      return 'Password must contain at least one lowercase';
    }
    if (!(hasUppercase)) {
      return 'Password must contain at least one uppercase';
    }
    if (!(hasDigit)) {
      return 'Password must contain at least one digit';
    }
    if (!(hasSpecialChar)) {
      return 'Password must contain at least one character';
    }
    return null; // Password is valid
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password is required';
    }

    if (confirmPassword != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  String? validateEmail(String val) {
    if (val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
      return 'Invalid email format';
    }

    return null; // Email is valid
  }

  String? validatePhoneNumber(String val) {
    if (val.isEmpty) {
      return 'Phone number is required';
    }

    if (!RegExp(r'^[0-9]{11}$').hasMatch(val)) {
      return 'Invalid phone number format';
    }

    return null; // Phone number is valid
  }

  String? validateTextField(String val) {
    if (val.isEmpty) {
      return 'This field is required';
    }

    return null; // Field is valid
  }

  /// Validates a student code based on the specified format.
  String? validateStudentCode(String val) {
    if (val.isEmpty) {
      return 'Student code is required';
    }

    final regex = RegExp(r"^(SAGM|SAFM|SAXM|SAFE|SAGE)([0-9]{5,})$");
    if (!regex.hasMatch(val)) {
      return 'Invalid student code format';
    }

    return null; // Valid student code
  }

  /// Validates a student code based on the specified format.
  String? validateSurnameAsPasswordCode(String val) {
    if (val.isEmpty) {
      return 'Password is required';
    }

    final regex = RegExp(r"^[a-z]+$");

    if (regex.hasMatch(val)) {
      return null;
    } else {
      return ("Invalid input: Must contain only lowercase letters");
    }
  }
}
