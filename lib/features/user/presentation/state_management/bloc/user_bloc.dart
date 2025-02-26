import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/features/user/domain/repositories/repositories.dart';

part 'user_event.dart';
part 'user_state.dart';

@singleton
class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserDataInitial()) {
    on<UserEvent>((event, emit) {});
  }
}
