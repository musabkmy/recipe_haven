import 'package:recipe_haven/features/recipe/recipe.dart';

abstract class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

class Failure<T> extends Result<T> {
  final Exception error;
  const Failure(this.error);
}

typedef GetAllRecipesResponse = Result<Recipes>;

abstract class RecipeRepository {
  Future<GetAllRecipesResponse> getAllRecipes();
}
