import 'package:recipe_haven/features/recipe/data/testing_sources/testing_sources.dart';

import '../../domain/repositories/repositories.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeTestingSource recipeTestingSource;
  RecipeRepositoryImpl(this.recipeTestingSource);

  @override
  Future<GetAllRecipesResponse> getAllRecipes() {
    throw UnimplementedError();
  }
}
