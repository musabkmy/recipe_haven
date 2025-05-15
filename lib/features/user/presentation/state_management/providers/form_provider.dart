import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/core/enums/validation_type.dart';

@lazySingleton
class FormProvider with ChangeNotifier {
  final Logger _logger = Logger('FormProvider');
  String _username = '';
  String _email = '';
  String _password = '';
  bool _isPasswordShown = false;

  ValidationType _usernameValidationType = ValidationType.unset;
  ValidationType _emailValidationType = ValidationType.unset;
  ValidationType _passwordValidationType = ValidationType.unset;

  String get username => _username;
  String get email => _email;
  String get password => _password;

  ValidationType get usernameValidationType => _usernameValidationType;
  ValidationType get emailValidationType => _emailValidationType;
  ValidationType get passwordValidationType => _passwordValidationType;

  bool get isPasswordShown => _isPasswordShown;

  set username(String value) {
    _username = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  void setIsPasswordShown() {
    _isPasswordShown = !_isPasswordShown;
    notifyListeners();
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      _usernameValidationType = ValidationType.unset;
      return 'username is required';
    }
    if (value.length < 2) {
      _usernameValidationType = ValidationType.invalid;
      return 'username must be at least 2 characters long';
    }
    final usernameRegex = RegExp(r'^[a-zA-Z ]+$');
    if (!usernameRegex.hasMatch(value)) {
      _usernameValidationType = ValidationType.invalid;
      return 'username can only contain letters and spaces';
    }
    _usernameValidationType = ValidationType.valid;
    return null;
  }

  String? validateEmail(String? value) {
    _logger.info('at validateEmail');
    if (value == null || value.isEmpty) {
      _emailValidationType = ValidationType.unset;
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      _emailValidationType = ValidationType.invalid;
      return 'Enter a valid email address';
    }
    _emailValidationType = ValidationType.valid;
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      _passwordValidationType = ValidationType.unset;
      return 'Password is required';
    }
    if (value.length < 8) {
      _passwordValidationType = ValidationType.invalid;
      return 'Password must be at least 8 characters long';
    }
    final passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    if (!passwordRegex.hasMatch(value)) {
      _passwordValidationType = ValidationType.invalid;
      return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
    }
    _passwordValidationType = ValidationType.valid;
    return null;
  }

  // Method to validate the entire form
  bool validateForm() {
    return validateUsername(_username) == null &&
        validateEmail(_email) == null &&
        validatePassword(_password) == null;
  }
}
