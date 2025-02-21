import 'dart:async' show StreamSubscription;
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

  void getRecipes() {
    emit(GetRecipesLoading());
    _subscription?.cancel();

    _subscription = _recipeRepository.getAllRecipes().listen(
      (response) {
        if (response is Success<Recipes>) {
          emit(GetRecipesSuccess(response.value));
        } else if (response is Failure<Recipes>) {
          emit(GetRecipesFailure(response.error.toString()));
        }
      },
      onError: (error) {
        emit(GetRecipesFailure(error.toString()));
      },
    );
  }

  Future<void> createRecipe() async {
    await _recipeRepository.createRecipe(
      RecipeTestingSource().getAllRecipes()[0].toJson(),
    );
  }

  @override
  Future<void> close() {
    // Cancel the subscription when the Cubit is closed
    _subscription?.cancel();
    return super.close();
  }
}
