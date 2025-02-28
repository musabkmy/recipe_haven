import 'dart:async' show StreamSubscription;
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/features/recipe/data/testing_sources/recipe_testing_source.dart';
import 'package:recipe_haven/features/recipe/recipe.dart';

part 'get_recipes_state.dart';

@singleton
class GetRecipesCubit extends Cubit<GetRecipesState> {
  final RecipeRepository _recipeRepository;
  GetRecipesCubit(this._recipeRepository) : super(GetRecipesInitial());

  StreamSubscription? _subscription;

  void getLatestRecipes() {
    emit(GetRecipesLoading());
    _subscription?.cancel();
    //  emit.forEach(stream, onData: onData)

    _subscription = _recipeRepository.getAllRecipes().listen(
      (response) {
        response.when(
          success: (value) => emit(GetRecipesSuccess(value)),
          failure: (error) => emit(GetRecipesFailure(error.message)),
        );
      },
      onError: (error) {
        emit(GetRecipesFailure(error.toString()));
      },
    );
  }

  Future<void> createRecipe() async {
    final recipes = RecipeTestingSource.getAllRecipes();
    await _recipeRepository.createRecipe(
      recipes[Random(4).nextInt(recipes.length)].toJson(),
    );
  }

  @override
  Future<void> close() {
    // Cancel the subscription when the Cubit is closed
    _subscription?.cancel();
    return super.close();
  }
}
