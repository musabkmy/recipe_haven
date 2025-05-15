import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/data/mocking_sources/recipe_mock_source.dart';
import 'package:recipe_haven/features/view_recipe/data/models/recipe_model.dart';
import 'package:recipe_haven/features/view_recipe/data/models/tag_model.dart';
import 'package:recipe_haven/features/view_recipe/view_recipe.dart';

@Injectable(as: RecipeRepository, env: [Env.dev])
class RecipeRepositoryTestImpl implements RecipeRepository {
  final recipeMockSource = RecipeMockSource();
  @factoryMethod
  RecipeRepositoryTestImpl();

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
}
