//final
class UserException implements Exception {
  UserException(this.message);
  final String message;
}

// class AuthenticationFailureException extends UserException {
//   AuthenticationFailureException(super.message);
// }

// class CreateUserFailureException extends UserException {
//   CreateUserFailureException(super.message);
// }

// class UnknownUserException extends UserException {
//   UnknownUserException(super.message);
// }
