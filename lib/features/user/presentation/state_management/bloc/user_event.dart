part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SignUpUser extends UserEvent {
  final String email;
  final String password;
  final String name;

  const SignUpUser({
    required this.email,
    required this.password,
    required this.name,
  });
}
