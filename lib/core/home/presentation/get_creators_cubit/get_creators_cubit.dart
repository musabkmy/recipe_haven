import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/features/recipe/domain/entities/creator_entity.dart';
import 'package:recipe_haven/features/user/domain/repositories/user_repository.dart';

part 'get_creators_state.dart';

@singleton
class GetCreatorsCubit extends Cubit<GetCreatorsState> {
  final UserRepository _userRepository;
  GetCreatorsCubit(this._userRepository) : super(GetCreatorsInitial());

  void getBestCreators() async {
    emit(GetCreatorsLoading());
    try {
      final creators = await _userRepository.getCreators();
      creators.when(
        success: (value) => emit(GetCreatorsSuccess(value)),
        failure: (error) => emit(GetCreatorsFailure(error.message)),
      );
    } catch (e) {
      emit(GetCreatorsFailure(e.toString()));
    }
  }
}
