//final
sealed class UserException implements Exception {
  const UserException(this.message);
  final String message;
}

final class NoUserFoundException extends UserException {
  NoUserFoundException(super.message);
}

final class NoUserRecordFoundException extends UserException {
  NoUserRecordFoundException(super.message);
}

final class UnknownUserException extends UserException {
  UnknownUserException(super.message);
}

final class UserCreationException extends UserException {
  UserCreationException(super.message);
}

final class WrongUserFieldsException extends UserException {
  WrongUserFieldsException(super.message);
}
