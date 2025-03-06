<<<<<<< Updated upstream
// import 'package:injectable/injectable.dart';
// import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
// import 'package:recipe_haven/features/recipe/data/testing_sources/recipe_testing_source.dart';
// import 'package:recipe_haven/features/recipe/recipe.dart';

// @Injectable(as: RecipeRepository, env: [Env.dev])
// class RecipeRepositoryTestImpl implements RecipeRepository {
//   final RecipeMockSource RecipeMockSource;
//   @factoryMethod
//   RecipeRepositoryTestImpl(this.RecipeMockSource);

//   @override
//   Stream<GetAllRecipesResponse> getAllRecipes() async* {
//     yield Success(RecipeMockSource.getAllRecipes().toEntity());
//   }

//   @override
//   Future<void> createRecipe(Map<String, dynamic> recipeData) async {}
// }
=======
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/data/mocking_sources/recipe_mock_source.dart';
import 'package:recipe_haven/core/data/models/tag_model.dart';
import 'package:recipe_haven/features/recipe/recipe.dart';

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
  Future<void> createRecipe(Map<String, dynamic> recipeData) async {}

  @override
  Future<GetAllTagsResponse> getTags() {
    return Future.value(Success(recipeMockSource.getAllTags.toEntity()));
  }

  @override
  Future<GetAllRecipesResponse> getTonightRecipes() {
    return Future.value(Success(recipeMockSource.getTonightRecipes.toEntity()));
  }
}
>>>>>>> Stashed changes
