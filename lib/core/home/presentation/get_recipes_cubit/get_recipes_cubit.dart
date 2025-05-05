import 'dart:async' show StreamSubscription;
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/core/data/mocking_sources/recipe_mock_source.dart';
import 'package:recipe_haven/features/view_recipe/view_recipe.dart';

part 'get_recipes_state.dart';

@singleton
class GetRecipesCubit extends Cubit<GetRecipesState> {
  final RecipeRepository _recipeRepository;
  GetRecipesCubit(this._recipeRepository) : super(GetRecipesInitial());

  StreamSubscription? _subscription;

  void getLatestRecipes() {
    // Logger logger = Logger('GetRecipesCubit');
    emit(GetRecipesLoading());
    _subscription?.cancel();
    //  emit.forEach(stream, onData: onData)

    _subscription = _recipeRepository.getAllRecipes().listen(
      (response) {
        // logger.info('response: ${response.toString()}');
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
    // final previousState = state;
    emit(GetRecipesLoading());

    final recipes = RecipeMockSource().getAllRecipes;

    final randomRecipe = Random().nextInt(recipes.length);
    // debugPrint('createRecipe, in index: $randomRecipe');
    await _recipeRepository.createRecipe(recipes[randomRecipe]);
    // emit(previousState);
  }

  @override
  Future<void> close() {
    // Cancel the subscription when the Cubit is closed
    _subscription?.cancel();
    return super.close();
  }
}
