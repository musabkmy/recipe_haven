import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/tag_entity.dart';
import 'package:recipe_haven/features/view_recipe/domain/repositories/recipe_repository.dart';

part 'get_tags_state.dart';

@singleton
class GetTagsCubit extends Cubit<GetTagsState> {
  final RecipeRepository _recipeRepository;
  GetTagsCubit(this._recipeRepository) : super(GetTagsInitial());

  void getTags() async {
    emit(GetTagsLoading());
    try {
      final tags = await _recipeRepository.getTags();
      tags.when(
        success: (value) => emit(GetTagsSuccess(value)),
        failure: (error) => emit(GetTagsFailure(error.message)),
      );
    } catch (e) {
      emit(GetTagsFailure(e.toString()));
    }
  }
}
