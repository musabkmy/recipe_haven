import 'package:recipe_haven/core/exceptions/recipe_exceptions.dart';
import 'package:recipe_haven/features/view_recipe/data/models/recipe_model.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/tag_entity.dart';
import 'package:recipe_haven/features/view_recipe/view_recipe.dart';

typedef GetAllRecipesResponse = Result<Recipes, RecipeException>;
typedef GetAllTagsResponse = Result<Tags, RecipeException>;

abstract class RecipeRepository {
  Stream<GetAllRecipesResponse> getAllRecipes();
  Future<GetAllRecipesResponse> getTonightRecipes();
  Future<void> createRecipe(RecipeModel recipe);

  Future<GetAllTagsResponse> getTags();
}
