import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/features/recipe/data/testing_sources/recipe_testing_source.dart';
import 'package:recipe_haven/features/recipe/recipe.dart';

@Injectable(as: RecipeRepository, env: [Env.prod])
class RecipeRepositoryFirebaseImpl implements RecipeRepository {
  final RecipeTestingSource recipeTestingSource;

  @factoryMethod
  const RecipeRepositoryFirebaseImpl(this.recipeTestingSource);
  @override
  Future<GetAllRecipesResponse> getAllRecipes() async {
    final db = FirebaseFirestore.instance;

    db.collection(RecipeModel.collectionId).get().then((recipe) {
      for (var doc in recipe.docs) {
        // final recipe = RecipeModel.fromJson(doc.data());
        debugPrint(doc.id);
      }
    });
    return Success<Recipes>(
        recipeTestingSource.getAllRecipes().toEntity().sublist(0, 1));
  }

  @override
  Future<void> createRecipe(Map<String, dynamic> recipe) async {
    final Logger logger = Logger('RecipeRepositoryFirebaseImpl');
    logger.info('in');

    final db = FirebaseFirestore.instance;
    db.collection(RecipeModel.collectionId).add(recipe).then(
        (DocumentReference doc) =>
            debugPrint('DocumentSnapshot added with ID: ${doc.id}'),
        onError: (error) => logger.warning('error adding recipe: $error'));
  }
}
