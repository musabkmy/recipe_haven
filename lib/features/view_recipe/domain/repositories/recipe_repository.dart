import 'package:recipe_haven/core/exceptions/recipe_exceptions.dart';
import 'package:recipe_haven/core/exceptions/upload_exceptions.dart';
import 'package:recipe_haven/core/data/models/create_review_model.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/tag_entity.dart';
import 'package:recipe_haven/features/view_recipe/recipe.dart';

typedef GetAllRecipesResponse = Result<Recipes, RecipeException>;
typedef GetAllTagsResponse = Result<Tags, RecipeException>;
typedef GetIsReviewUploaded = Result<Review, UploadException>;

abstract class RecipeRepository {
  Stream<GetAllRecipesResponse> getAllRecipes();
  Future<GetAllRecipesResponse> getTonightRecipes();
  Future<void> createRecipe(RecipeModel recipe);
  Future<GetIsReviewUploaded> addRecipeReview(CreateReviewModel review);

  Future<GetAllTagsResponse> getTags();
}
