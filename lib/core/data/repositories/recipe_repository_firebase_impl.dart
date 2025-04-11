import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/features/recipe_review/data/repositories/reviewers_cache_service.dart';
import 'package:recipe_haven/features/view_recipe/data/models/models.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/exceptions/recipe_exceptions.dart';
import 'package:recipe_haven/core/exceptions/upload_exceptions.dart';
import 'package:recipe_haven/features/view_recipe/view_recipe.dart';
import 'package:recipe_haven/features/user/data/models/user_fetch_model.dart';

@Injectable(as: RecipeRepository, env: [Env.prod])
class RecipeRepositoryFirebaseImpl implements RecipeRepository {
  // final RecipeMockSource RecipeMockSource;
  final ReviewersCacheService _reviewersCacheService;
  RecipeRepositoryFirebaseImpl(this._reviewersCacheService);

  // @factoryMethod
  // const RecipeRepositoryFirebaseImpl(this.RecipeMockSource);
  @override
  Stream<GetAllRecipesResponse> getAllRecipes() async* {
    final Logger logger = Logger('RecipeRepositoryFirebaseImpl/getAllRecipes');
    final db = FirebaseFirestore.instance;
    try {
      await for (final querySnapshot
          in db.collection(RecipeModel.collectionId).snapshots()) {
        logger.info('added: ${querySnapshot.docs.first.reference.path}');

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
    Logger logger = Logger('RecipeRepositoryFirebaseImpl/_getRecipeResponse');
    try {
      final List<RecipeModel> recipes = [];
      for (final doc in querySnapshot.docs) {
        final recipeData = doc.data() as Map<String, dynamic>? ?? {};

        final creatorRef =
            recipeData['creatorRef'] is DocumentReference
                ? recipeData['creatorRef'] as DocumentReference
                : null;

        final reviewsRef =
            (recipeData['reviewsRef'] is List)
                ? (recipeData['reviewsRef'] as List)
                    .whereType<DocumentReference>()
                    .toList()
                : <DocumentReference>[];

        Map<String, dynamic>? creatorData;
        List<Map<String, dynamic>> reviewsData;
        if (creatorRef != null) {
          final creatorDoc = await creatorRef.get();
          reviewsData =
              reviewsRef.isNotEmpty ? await _getJsonReviews(reviewsRef) : [];
          // logger.info('reviewsData: $reviewsData');

          if (creatorDoc.exists) {
            creatorData = creatorDoc.data() as Map<String, dynamic>;

            recipeData['userData'] = creatorData;
            recipeData['reviews'] = reviewsData;
            // logger.info('userData: $userData');

            // logger.info('usersEngagement: ${recipeData['usersEngagement']}');
            // logger.info('userData: ${recipeData['userData']}');
            // logger.info('utensils: ${recipeData['utensils']}');
            // logger.info('details: ${recipeData['details']}');
            // logger.info('tags: ${recipeData['tags']}');
            logger.info(
              'reviews: ${ReviewModel.fromJsonS(recipeData['reviews']).toString()}',
            );
            // logger.info('cookingStepsMap: ${recipeData['cookingStepsMap']}');

            final recipe = RecipeModel.fromJson(recipeData);
            // logger.info('got recipe: ${recipe.toString()}');
            recipes.add(recipe);
          }
        }
      }
      return Success(recipes.toEntity());
    } catch (e) {
      return Failure(RecipeException(e.toString()));
    }
  }

  Future<List<Map<String, dynamic>>> _getJsonReviews(
    List<DocumentReference> reviewsRef,
  ) async {
    // final Logger logger = Logger(
    //   'RecipeRepositoryFirebaseImpl/_getJsonReviews',
    // );
    // logger.info('entered');
    final List<Map<String, dynamic>> reviewsData = [];
    for (final reviewRef in reviewsRef) {
      final reviewDoc = await reviewRef.get();
      final reviewData = reviewDoc.data() as Map<String, dynamic>?;
      // logger.info('reviewDoc.exists: ${reviewDoc.exists}');
      // logger.info('reviewData: $reviewData');
      if (reviewData != null) {
        final reviewerRef = reviewData['userRef'];
        final reviewerData = await _getJsonReviewer(reviewerRef);
        // logger.info(reviewerData);
        reviewData['reviewerModel'] = reviewerData;

        reviewsData.add(reviewData);
        // logger.info(ReviewModel.fromJson(reviewData).toString());
      }
    }
    return reviewsData;
  }

  Future<Map<String, dynamic>> _getJsonReviewer(
    DocumentReference<Object?> userRef,
  ) async {
    Logger logger = Logger('RecipeRepositoryFirebaseImpl/_getJsonReviewer');
    final reviewerCacheData = await _reviewersCacheService.hasData(
      userRef.toString(),
    );
    if (reviewerCacheData != null) {
      logger.info('reviewerCacheData: ${reviewerCacheData['id']}');
      return reviewerCacheData;
    }
    final reviewerDoc = await userRef.get();
    final reviewerData = reviewerDoc.data() as Map<String, dynamic>?;
    if (reviewerData != null) {
      logger.info('reviewerData: ${reviewerData['id']}');
      return reviewerData;
    } else {
      logger.info('no reviewer found');
      throw RecipeException('no reviewer found.');
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
