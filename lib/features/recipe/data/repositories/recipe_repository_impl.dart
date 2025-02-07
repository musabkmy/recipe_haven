import 'package:recipe_haven/features/recipe/data/testing_sources/testing_sources.dart';
import 'package:recipe_haven/features/recipe/recipe.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeTestingSource recipeTestingSource;
  RecipeRepositoryImpl(this.recipeTestingSource);

  @override
  Future<GetAllRecipesResponse> getAllRecipes() async {
    return Success(recipeTestingSource.getAllRecipes().toEntity());
  }
}
