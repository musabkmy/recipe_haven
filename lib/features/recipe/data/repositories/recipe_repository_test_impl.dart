// import 'package:injectable/injectable.dart';
// import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
// import 'package:recipe_haven/features/recipe/data/testing_sources/recipe_testing_source.dart';
// import 'package:recipe_haven/features/recipe/recipe.dart';

// @Injectable(as: RecipeRepository, env: [Env.dev])
// class RecipeRepositoryTestImpl implements RecipeRepository {
//   final RecipeTestingSource recipeTestingSource;
//   @factoryMethod
//   RecipeRepositoryTestImpl(this.recipeTestingSource);

//   @override
//   Stream<GetAllRecipesResponse> getAllRecipes() async* {
//     yield Success(recipeTestingSource.getAllRecipes().toEntity());
//   }

//   @override
//   Future<void> createRecipe(Map<String, dynamic> recipeData) async {}
// }
