import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/features/recipe/data/testing_sources/recipe_testing_source.dart';
import 'package:recipe_haven/features/recipe/recipe.dart';

part 'get_recipes_state.dart';

@singleton
class GetRecipesCubit extends Cubit<GetRecipesState> {
  final RecipeRepository _recipeRepository;
  GetRecipesCubit(this._recipeRepository) : super(GetRecipesInitial());

  Future<void> getRecipes() async {
    emit(GetRecipesLoading());
    try {
      final result = await _recipeRepository.getAllRecipes();
      debugPrint(result.toString());
      if (result case Success<Recipes> success) {
        emit(GetRecipesSuccess(success.value));
      } else if (result case Failure<Exception> failure) {
        emit(GetRecipesFailure(failure.error.toString()));
      } else {
        emit(GetRecipesFailure('Unknown'));
      }
    } catch (e) {
      emit(GetRecipesFailure(e.toString()));
    }
  }

  Future<void> createRecipe() async {
    await _recipeRepository
        .createRecipe(RecipeTestingSource().getAllRecipes().first.toJson());
  }
}
