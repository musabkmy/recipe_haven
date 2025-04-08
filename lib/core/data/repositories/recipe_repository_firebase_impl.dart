import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/features/view_recipe/data/models/models.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/exceptions/recipe_exceptions.dart';
import 'package:recipe_haven/core/exceptions/upload_exceptions.dart';
import 'package:recipe_haven/features/view_recipe/view_recipe.dart';
import 'package:recipe_haven/features/user/data/models/user_fetch_model.dart';

@Injectable(as: RecipeRepository, env: [Env.prod])
class RecipeRepositoryFirebaseImpl implements RecipeRepository {
  // final RecipeMockSource RecipeMockSource;

  // @factoryMethod
  // const RecipeRepositoryFirebaseImpl(this.RecipeMockSource);
  @override
  Stream<GetAllRecipesResponse> getAllRecipes() async* {
    final Logger logger = Logger('RecipeRepositoryFirebaseImpl/getAllRecipes');
    final db = FirebaseFirestore.instance;
    try {
      await for (final querySnapshot
          in db.collection(RecipeModel.collectionId).snapshots()) {
        logger.info('added: ${querySnapshot.runtimeType}');

        yield await _getRecipeResponse(querySnapshot);
      }
    } catch (e) {
      logger.log(Level.WARNING, 'Error: ${e.toString()}');

      yield Failure(RecipeException(e.toString()));
    }
  }

  @override
  Future<void> createRecipe(RecipeModel recipeModel) async {
    final Logger logger = Logger('RecipeRepositoryFirebaseImpl/createRecipe');
    final recipe = recipeModel.toJson();
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw RecipeException('No authenticated user found.');
    }
    final db = FirebaseFirestore.instance;
    final creatorRef = db.collection('users').doc(user.uid);
    recipe['creatorRef'] = creatorRef;
    recipe['joinedDate'] = FieldValue.serverTimestamp();
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

  @override
  Future<GetAllRecipesResponse> getTonightRecipes() async {
    final Logger logger = Logger(
      'RecipeRepositoryFirebaseImpl/getTonightRecipes',
    );
    final db = FirebaseFirestore.instance;
    //get todays date to fetch
    final DateTime today = DateTime.now();
    final DateTime startOfDay = DateTime(today.year, today.month, today.day);

    try {
      final querySnapshot =
          await db
              .collection(RecipeModel.collectionId)
              .where(
                'joinedDate',
                isGreaterThan: Timestamp.fromDate(startOfDay),
              )
              .get();

      return await _getRecipeResponse(querySnapshot);
    } catch (e) {
      logger.info(e);
      return Failure(RecipeException(e.toString()));
    }
  }

  Future<GetAllRecipesResponse> _getRecipeResponse(
    QuerySnapshot<Map<String, dynamic>> querySnapshot,
  ) async {
    try {
      final List<RecipeModel> recipes = [];
      for (final doc in querySnapshot.docs) {
        final recipeData = doc.data();
        final creatorRef = recipeData['creatorRef'] as DocumentReference?;

        Map<String, dynamic>? userData;
        if (creatorRef != null) {
          final userDoc = await creatorRef.get();
          if (userDoc.exists) {
            userData = userDoc.data() as Map<String, dynamic>;

            recipeData['userData'] = userData;

            final recipe = RecipeModel.fromJson(recipeData);

            recipes.add(recipe);
          } else {
            return Failure(RecipeException('no user found.'));
          }
        }
      }
      return Success(recipes.toEntity());
    } catch (e) {
      return Failure(RecipeException(e.toString()));
    }
  }

  @override
  Future<GetAllTagsResponse> getTags() async {
    final Logger logger = Logger(
      'RecipeRepositoryFirebaseImpl/GetAllTagsResponse',
    );
    final db = FirebaseFirestore.instance;
    try {
      final tagsJson = await db.collection(TagModel.collectionId).get();
      if (tagsJson.docs.isNotEmpty) {
        final tags =
            tagsJson.docs
                .map((element) => TagModel.fromJson(element.data()))
                .toList();
        logger.info(tags.toEntity().toString());
        return Success(tags.toEntity());
      } else {
        return Failure(RecipeException('There is no tags'));
      }
    } catch (e) {
      return Failure(RecipeException(e.toString()));
    }
  }

  // final _cache = <String, Recipe>{};

  //   Future<Recipe> getRecipe(String id) async {
  //     if (_cache.containsKey(id)) {
  //       return _cache[id]!;
  //     }
}
