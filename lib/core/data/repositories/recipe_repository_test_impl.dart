import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/data/mocking_sources/recipe_mock_source.dart';
import 'package:recipe_haven/core/data/models/create_review_model.dart';
import 'package:recipe_haven/core/data/models/tag_model.dart';
import 'package:recipe_haven/features/view_recipe/recipe.dart';

@Injectable(as: RecipeRepository, env: [Env.dev])
class RecipeRepositoryTestImpl implements RecipeRepository {
  final RecipeMockSource recipeMockSource;
  @factoryMethod
  RecipeRepositoryTestImpl(this.recipeMockSource);

  @override
  Stream<GetAllRecipesResponse> getAllRecipes() async* {
    yield Success(recipeMockSource.getAllRecipes.toEntity());
  }

  @override
  Future<void> createRecipe(RecipeModel recipeData) async {}

  @override
  Future<GetAllTagsResponse> getTags() {
    return Future.value(Success(recipeMockSource.getAllTags.toEntity()));
  }

  @override
  Future<GetAllRecipesResponse> getTonightRecipes() {
    return Future.value(Success(recipeMockSource.getTonightRecipes.toEntity()));
  }

  @override
  Future<GetIsReviewUploaded> addRecipeReview(CreateReviewModel review) {
    return Future.value(
      Success(
        Review(
          id: Random().nextInt(44).toString(),
          userID: review.userID,
          userName: review.userName,
          userProfilePic: review.userPhotoUrl,
          imagesUrl: review.imagesUrl,
          publishedAt: DateTime.now(),
          description: review.comment,
        ),
      ),
    );
  }
}
