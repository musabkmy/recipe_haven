import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/features/recipe/data/testing_sources/testing_sources.dart';
import 'package:recipe_haven/features/recipe/recipe.dart';

@Injectable(as: RecipeRepository, env: [Env.dev])
class RecipeRepositoryTestImpl implements RecipeRepository {
  final RecipeTestingSource recipeTestingSource;
  @factoryMethod
  RecipeRepositoryTestImpl(this.recipeTestingSource);

  @override
  Future<GetAllRecipesResponse> getAllRecipes() async {
    return Success<Recipes>(recipeTestingSource.getAllRecipes().toEntity());
  }
}
