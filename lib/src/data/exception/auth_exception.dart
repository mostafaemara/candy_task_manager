class AuthException implements Exception {}

enum AuthError { invalidEmailOrPassword, emailInUse, serverError }
