part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {}

class CreateAccountWithEmailAndPassword extends UserEvent {
  final String email;
  final String password;
  final String name;

  const CreateAccountWithEmailAndPassword({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object> get props => [email, password, name];
}
