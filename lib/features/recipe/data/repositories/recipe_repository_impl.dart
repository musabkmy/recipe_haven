import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/features/recipe/data/testing_sources/recipe_testing_source.dart';
import 'package:recipe_haven/features/recipe/recipe.dart';

@Injectable(as: RecipeRepository, env: [Env.prod])
class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeTestingSource recipeTestingSource;
  // @factoryMethod
  const RecipeRepositoryImpl(this.recipeTestingSource);
  @override
  Future<GetAllRecipesResponse> getAllRecipes() async {
    return Success<Recipes>(
        recipeTestingSource.getAllRecipes().toEntity().sublist(0, 1));
  }
}
