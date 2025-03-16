part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserDataInitial extends UserState {}

final class UserDataLoading extends UserState {}

final class UserDataFetched extends UserState {
  final UserData userData;
  const UserDataFetched(this.userData);

  @override
  List<Object> get props => [userData];
}

final class UserDataFailure extends UserState {
  final String error;
  const UserDataFailure(this.error);

  @override
  List<Object> get props => [error];
}
