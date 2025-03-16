import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/recipe_entity.dart';
import 'package:recipe_haven/features/view_recipe/domain/repositories/recipe_repository.dart';

part 'get_tonight_cook_state.dart';

@singleton
class GetTonightCookCubit extends Cubit<GetTonightCookState> {
  final RecipeRepository _recipeRepository;
  GetTonightCookCubit(this._recipeRepository) : super(GetTonightCookInitial());

  void getWhatToCookTonight() async {
    try {
      emit(GetTonightCookLoading());
      final result = await _recipeRepository.getTonightRecipes();
      debugPrint('cubit/getWhatToCookTonight: ${result.toString()}');
      result.when(
        success: (value) => emit(GetTonightCookSuccess(value)),
        failure: (error) => emit(GetTonightCookFailure(error.message)),
      );
    } catch (e) {
      emit(GetTonightCookFailure(e.toString()));
    }
  }
}
