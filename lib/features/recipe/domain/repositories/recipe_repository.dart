import 'package:recipe_haven/features/recipe/recipe.dart';

typedef GetAllRecipesResponse = Result<Recipes>;

abstract class RecipeRepository {
  Stream<GetAllRecipesResponse> getAllRecipes();
  Future<void> createRecipe(Map<String, dynamic> recipe);
}
