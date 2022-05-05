import 'package:flutter/cupertino.dart';
import 'package:task_manger/src/data/errors/auth_validation_error.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AuthValidationErrorHelper on AuthValidationError {
  String? translateForEmail(BuildContext context) {
    if (this == AuthValidationError.invalid) {
      return AppLocalizations.of(context)!.emailInvalid;
    }
    if (this == AuthValidationError.empty) {
      return AppLocalizations.of(context)!.emailRequired;
    }

    return null;
  }

  String? translateForPassword(BuildContext context) {
    if (this == AuthValidationError.empty) {
      return AppLocalizations.of(context)!.passwordRequired;
    }
    if (this == AuthValidationError.tooShort) {
      return AppLocalizations.of(context)!.passwordTooShort;
    }

    return null;
  }

  String? translateForConfirmPassword(BuildContext context) {
    if (this == AuthValidationError.empty) {
      return AppLocalizations.of(context)!.confrimPasswordRequired;
    }
    if (this == AuthValidationError.notMatch) {
      return AppLocalizations.of(context)!.passwordNotMatch;
    }

    return null;
  }
}
