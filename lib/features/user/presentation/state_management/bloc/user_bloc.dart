import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/features/user/data/models/user_creation_model.dart';
import 'package:recipe_haven/features/user/domain/entities/user_data_entity.dart';
import 'package:recipe_haven/features/user/domain/repositories/repositories.dart';

part 'user_event.dart';
part 'user_state.dart';

@singleton
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserDataInitial()) {
    on<CreateAccountWithEmailAndPassword>(_onCreateAccountWithEmailAndPassword);
    on<GetUser>(_onGetUser);
  }

  Future<void> _onGetUser(GetUser event, Emitter<UserState> emit) async {
    final userData = await _userRepository.getUserData();
    userData.when(
      success: (value) => emit(UserDataSuccess(value)),
      failure: (error) => emit(UserDataFailure(error.message)),
    );
  }

  Future<void> _onCreateAccountWithEmailAndPassword(
    CreateAccountWithEmailAndPassword event,
    Emitter<UserState> emit,
  ) async {
    //TODO: uncomment
    // if (!(state is UserDataInitial || state is UserDataFailure)) {
    //   return;
    // }
    Logger logger = Logger('_onCreateAccountWithEmailAndPassword');
    emit(UserDataLoading());

    final userData = await _userRepository.createUserWithEmailAndPassword(
      event.userCreation,
    );
    userData.when(
      success: (value) {
        logger.info(value.toString());
        emit(UserDataSuccess(value));
      },
      failure: (error) {
        logger.warning(error.message);
        emit(UserDataFailure(error.message));
      },
    );
  }
}
