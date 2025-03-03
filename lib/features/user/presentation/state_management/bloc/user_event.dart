part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {}

class CreateAccountWithEmailAndPassword extends UserEvent {
  final UserCreationModel userCreation;

  const CreateAccountWithEmailAndPassword({required this.userCreation});

  @override
  List<Object> get props => [userCreation];
}
