import 'package:task_manger/src/data/errors/auth_validation_error.dart';
import 'package:validators/validators.dart';

AuthValidationError emailValidator(String? value) {
  if (value == null) {
    return AuthValidationError.none;
  }
  if (value.isEmpty) {
    return AuthValidationError.empty;
  }
  if (!isEmail(value)) {
    return AuthValidationError.invalid;
  }
  return AuthValidationError.none;
}

AuthValidationError passwordValidator(String? value) {
  if (value == null) {
    return AuthValidationError.none;
  }
  if (value.isEmpty) {
    return AuthValidationError.empty;
  }
  if (value.length < 8) {
    return AuthValidationError.tooShort;
  }
  return AuthValidationError.none;
}

AuthValidationError confirmPasswordValidator(String? value, String password) {
  if (value == null) {
    return AuthValidationError.none;
  }
  if (value.isEmpty) {
    return AuthValidationError.empty;
  }
  if (value != password) {
    return AuthValidationError.notMatch;
  }
  return AuthValidationError.none;
}
