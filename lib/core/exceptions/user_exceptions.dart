//EXCEPTIONS

class UserException implements Exception {
  UserException();
}

class AuthenticationFailureException extends UserException {
  AuthenticationFailureException();
}

class CreateUserFailureException extends UserException {
  CreateUserFailureException();
}

class UnknownUserException implements UserException {
  UnknownUserException();
}
