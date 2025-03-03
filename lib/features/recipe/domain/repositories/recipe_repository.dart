import 'package:recipe_haven/core/exceptions/recipe_exceptions.dart';
import 'package:recipe_haven/features/recipe/domain/entities/tag_entity.dart';
import 'package:recipe_haven/features/recipe/recipe.dart';

typedef GetAllRecipesResponse = Result<Recipes, RecipeException>;
typedef GetAllTagsResponse = Result<Tags, RecipeException>;

abstract class RecipeRepository {
  Stream<GetAllRecipesResponse> getAllRecipes();
  Future<GetAllRecipesResponse> getTonightRecipes();
  Future<void> createRecipe(Map<String, dynamic> recipe);

  Future<GetAllTagsResponse> getTags();
}
