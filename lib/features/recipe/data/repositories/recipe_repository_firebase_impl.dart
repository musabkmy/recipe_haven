import 'package:cloud_firestore/cloud_firestore.dart';
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
  Stream<GetAllRecipesResponse> getAllRecipes() async* {
    final Logger logger = Logger('RecipeRepositoryFirebaseImpl/getAllRecipes');
    final db = FirebaseFirestore.instance;
    logger.info('in firebase getAllRecipes');
    try {
      // Listen to the Firestore collection for real-time updates
      await for (final querySnapshot
          in db.collection(RecipeModel.collectionId).snapshots()) {
        final recipes =
            querySnapshot.docs
                .map((doc) => RecipeModel.fromJson(doc.data()))
                .toList();
        logger.info('RETRIEVED RECIPES: ${recipes.length}');

        yield Success<Recipes>(recipes.toEntity());
      }
    } catch (e) {
      logger.log(Level.WARNING, 'Error: ${e.toString()}');

      yield Failure<Recipes>(Exception(e.toString()));
    }
  }

  @override
  Future<void> createRecipe(Map<String, dynamic> recipe) async {
    final Logger logger = Logger('RecipeRepositoryFirebaseImpl/createRecipe');

    final db = FirebaseFirestore.instance;

    final creatorRef = FirebaseFirestore.instance.doc('creators/creator1');
    try {
      await db
          .collection(RecipeModel.collectionId)
          .doc(recipe['id'])
          .set(recipe);
      logger.info('ADDED RECIPE: ${recipe['id']}');
    } catch (e) {
      logger.log(Level.WARNING, 'e.code: ${e.toString()}');
    }
  }
}
