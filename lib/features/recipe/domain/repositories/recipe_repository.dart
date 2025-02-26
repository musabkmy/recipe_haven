import 'package:recipe_haven/core/exceptions/recipe_exceptions.dart';
import 'package:recipe_haven/features/recipe/recipe.dart';

typedef GetAllRecipesResponse = Result<Recipes, RecipeException>;

abstract class RecipeRepository {
  Stream<GetAllRecipesResponse> getAllRecipes();
  Future<void> createRecipe(Map<String, dynamic> recipe);
}
