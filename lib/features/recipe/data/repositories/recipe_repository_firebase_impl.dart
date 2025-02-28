import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/exceptions/recipe_exceptions.dart';
import 'package:recipe_haven/features/recipe/recipe.dart';
import 'package:recipe_haven/features/user/data/models/user_fetch_model.dart';

@Injectable(as: RecipeRepository, env: [Env.prod])
class RecipeRepositoryFirebaseImpl implements RecipeRepository {
  // final RecipeTestingSource recipeTestingSource;

  // @factoryMethod
  // const RecipeRepositoryFirebaseImpl(this.recipeTestingSource);
  @override
  Stream<GetAllRecipesResponse> getAllRecipes() async* {
    final Logger logger = Logger('RecipeRepositoryFirebaseImpl/getAllRecipes');
    final db = FirebaseFirestore.instance;
    logger.info('in firebase getAllRecipes');
    try {
      await for (final querySnapshot
          in db.collection(RecipeModel.collectionId).snapshots()) {
        final List<RecipeModel> recipes = [];

        for (final doc in querySnapshot.docs) {
          final recipeData = doc.data();
          final creatorRef = recipeData['creatorRef'] as DocumentReference?;

          Map<String, dynamic>? userData;
          if (creatorRef != null) {
            final userDoc = await creatorRef.get();
            if (userDoc.exists) {
              userData = userDoc.data() as Map<String, dynamic>;
            }
          }
          logger.info(' userData: $userData');
          recipeData['userData'] = userData;
          logger.info('recipeData: ${recipeData['userData']}');

          final recipe = RecipeModel.fromJson(recipeData);

          recipes.add(recipe);
        }

        logger.info('RETRIEVED RECIPES: ${recipes.length}');

        yield Success(recipes.toEntity());
      }
    } catch (e) {
      logger.log(Level.WARNING, 'Error: ${e.toString()}');

      yield Failure(RecipeException(e.toString()));
    }
  }

  @override
  Future<void> createRecipe(Map<String, dynamic> recipe) async {
    final Logger logger = Logger('RecipeRepositoryFirebaseImpl/createRecipe');
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw RecipeException('No authenticated user found.');
    }
    final db = FirebaseFirestore.instance;
    final creatorRef = db.collection('users').doc(user.uid);
    recipe['creatorRef'] = creatorRef;
    try {
      final recipeRef = await db
          .collection(RecipeModel.collectionId)
          .add(recipe);

      await db.collection(UserFetchModel.collectionId).doc(user.uid).update({
        'createdRecipes': FieldValue.arrayUnion([recipeRef.id]),
      });
      logger.info('ADDED RECIPE: ${recipeRef.id}');
    } catch (e) {
      logger.log(Level.WARNING, 'e.code: ${e.toString()}');
    }
  }
}
