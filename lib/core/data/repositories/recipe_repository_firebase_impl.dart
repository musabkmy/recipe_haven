import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/features/recipe_review/domain/repositories/review_repository.dart';
import 'package:recipe_haven/features/view_recipe/data/models/models.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/exceptions/fetch_element_exceptions.dart';
import 'package:recipe_haven/features/view_recipe/view_recipe.dart';
import 'package:recipe_haven/features/user/data/models/user_fetch_model.dart';
// import 'package:test/scaffolding.dart';

@Injectable(as: RecipeRepository, env: [Env.prod])
class RecipeRepositoryFirebaseImpl implements RecipeRepository {
  // final RecipeMockSource RecipeMockSource;
  // final ReviewersCacheService _reviewersCacheService;
  final ReviewRepository _reviewRepository;
  RecipeRepositoryFirebaseImpl(this._reviewRepository);

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

      yield Failure(FetchElementException(e.toString()));
    }
  }

  @override
  Future<void> createRecipe(RecipeModel recipeModel) async {
    // final Logger logger = Logger('RecipeRepositoryFirebaseImpl/createRecipe');
    final recipe = recipeModel.toJson();
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw FetchElementException('No authenticated user found.');
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
      // logger.info('ADDED RECIPE: ${recipeRef.id}');
    } catch (e) {
      throw Exception(e.toString());
      // logger.log(Level.WARNING, 'e.code: ${e.toString()}');
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
      return Failure(FetchElementException(e.toString()));
    }
  }

  Future<GetAllRecipesResponse> _getRecipeResponse(
    QuerySnapshot<Map<String, dynamic>> querySnapshot,
  ) async {
    // Logger logger = Logger('RecipeRepositoryFirebaseImpl/_getRecipeResponse');
    try {
      final List<RecipeModel> recipes = [];
      for (final doc in querySnapshot.docs) {
        // logger.info('added recipe: ${doc.id}');
        final recipeData = doc.data() as Map<String, dynamic>? ?? {};

        final creatorRef =
            recipeData['creatorRef'] is DocumentReference
                ? recipeData['creatorRef'] as DocumentReference
                : null;

        final reviewsRef =
            (recipeData['reviewsRef'] is List)
                ? (recipeData['reviewsRef'] as List)
                    .whereType<DocumentReference<Map<String, dynamic>>>()
                    .toList()
                : <DocumentReference<Map<String, dynamic>>>[];

        Map<String, dynamic>? creatorData;
        List<Map<String, dynamic>> reviewsData;
        if (creatorRef != null) {
          final creatorDoc = await creatorRef.get();
          reviewsData =
              reviewsRef.isNotEmpty ? await _getJsonReviews(reviewsRef) : [];
          // logger.info('reviewsData: $reviewsData');

          if (creatorDoc.exists) {
            creatorData = creatorDoc.data() as Map<String, dynamic>;

            recipeData['id'] = doc.id;
            recipeData['userData'] = creatorData;
            recipeData['reviews'] = reviewsData;

            // logger.info('userData: $userData');

            // logger.info('usersEngagement: ${recipeData['usersEngagement']}');
            // logger.info('userData: ${recipeData['userData']}');
            // logger.info('utensils: ${recipeData['utensils']}');
            // logger.info('details: ${recipeData['details']}');
            // logger.info('tags: ${recipeData['tags']}');
            // logger.info(
            //   'reviews: ${ReviewModel.fromJsonS(recipeData['reviews']).toString()}',
            // );
            // logger.info('cookingStepsMap: ${recipeData['cookingStepsMap']}');

            final recipe = RecipeModel.fromJson(recipeData);
            // logger.info('got recipe: ${recipe.toString()}');
            recipes.add(recipe);
          }
        }
      }
      return Success(recipes.toEntity());
    } catch (e) {
      return Failure(FetchElementException(e.toString()));
    }
  }

  Future<List<Map<String, dynamic>>> _getJsonReviews(
    List<DocumentReference<Map<String, dynamic>>> reviewsRef,
  ) async {
    final Logger logger = Logger(
      'RecipeRepositoryFirebaseImpl/_getJsonReviews',
    );
    // logger.info('entered');
    final List<Map<String, dynamic>> reviewsData = [];
    for (final reviewRef in reviewsRef) {
      final reviewData = await _reviewRepository.getMapReview(reviewRef);
      reviewData.when(
        success: (value) => reviewsData.add(value),
        failure: (_) {},
      );
    }
    for (var element in reviewsData) {
      logger.info('added: ${element['id']}');
    }
    return reviewsData;
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
        return Failure(FetchElementException('There is no tags'));
      }
    } catch (e) {
      return Failure(FetchElementException(e.toString()));
    }
  }

  // final _cache = <String, Recipe>{};

  //   Future<Recipe> getRecipe(String id) async {
  //     if (_cache.containsKey(id)) {
  //       return _cache[id]!;
  //     }
}
