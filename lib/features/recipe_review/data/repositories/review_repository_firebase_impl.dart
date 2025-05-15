import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentReference, FieldValue, FirebaseFirestore;
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/exceptions/fetch_element_exceptions.dart';
import 'package:recipe_haven/features/recipe_review/data/models/models.dart';
import 'package:recipe_haven/features/recipe_review/data/repositories/cache_repositories/reviewers_cache_service.dart';
import 'package:recipe_haven/features/recipe_review/data/repositories/cache_repositories/sub_reviews_cache_service.dart';
import 'package:recipe_haven/features/recipe_review/domain/repositories/review_repository.dart';
import 'package:recipe_haven/features/view_recipe/data/models/recipe_model.dart';

@Injectable(as: ReviewRepository, env: [Env.prod])
class ReviewRepositoryFirebaseImpl implements ReviewRepository {
  final SubReviewsCacheService _subReviewsCacheService;
  final ReviewersCacheService _reviewersCacheService;
  const ReviewRepositoryFirebaseImpl(
    this._subReviewsCacheService,
    this._reviewersCacheService,
  );
  @override
  Future<GetIsReviewUploaded> addRecipeReview(CreateReviewModel review) async {
    Logger logger = Logger('ReviewRepositoryFirebaseImpl/addRecipeReview');
    final db = FirebaseFirestore.instance;
    final reviewJson = review.toJson();
    reviewJson['publishedAt'] = FieldValue.serverTimestamp();
    try {
      final reviewRef = await db
          .collection('${ReviewModel.collectionId}/${review.recipeId}/main')
          .add(reviewJson);
      logger.info('ADDED REVIEW: ${reviewRef.id}');
      // final reviewDoc = await reviewRef.get();
      final reviewData = await getReview(reviewRef);

      return reviewData.when(
        success: (value) async {
          final isRecipeReviewsUpdated = await updateRecipeReviews(
            review.recipeId,
            reviewRef,
          );
          if (isRecipeReviewsUpdated) {
            return Success(value);
          }
          return Failure(UploadException('recipe reviews did not updated'));
        },
        failure: (_) => Failure(UploadException('something went wrong')),
      );
    } catch (e) {
      return Failure(UploadException(e.toString()));
    }
  }

  @override
  Future<GetSubReviewsUploaded> getSubReviews(
    String mainReviewId,
    List<dynamic> subReviewsRef,
  ) async {
    if (subReviewsRef.isEmpty) {
      return Future.value(Success({}));
    }
    Logger logger = Logger('ReviewRepositoryFirebaseImpl/getSubReviews');
    final SubReviewModelsMap subReviews = {};
    try {
      for (final ref in subReviewsRef) {
        final cachedSubReview = await _subReviewsCacheService.get(ref.id);
        if (cachedSubReview != null) {
          subReviews[cachedSubReview.id] = cachedSubReview;
        } else if (ref is DocumentReference) {
          final subReview = await ref.get();

          if (!subReview.exists) {
            // logger.info('SubReview does not exist: ${ref.path}');
            continue;
          }
          final subReviewData = subReview.data() as Map<String, dynamic>;
          final reviewerRef = subReviewData['userRef'];
          final reviewerData = await _getJsonReviewer(reviewerRef);
          if (reviewerData == null) {
            continue;
          }
          subReviewData['id'] = subReview.id;
          subReviewData['mainReviewId'] = mainReviewId;
          subReviewData['reviewerModel'] = reviewerData;

          final subReviewModel = SubReviewModel.fromJson(subReviewData);
          subReviews[subReviewModel.id] = subReviewModel;

          await _subReviewsCacheService.add(subReviewData);
        }
      }
      return Success(subReviews.toEntityMap());
    } catch (e) {
      logger.log(Level.WARNING, 'Error: ${e.toString()}');
      return Success(subReviews.toEntityMap());
    } finally {
      try {
        await _reviewersCacheService.close();
      } catch (e) {
        return Failure(UploadException('Failed to close cache service: $e'));
      }
    }
  }

  @override
  Future<GetReview> getReview(
    DocumentReference<Map<String, dynamic>> reviewRef,
  ) async {
    final reviewStatus = await getMapReview(reviewRef);
    return reviewStatus.when(
      success: (value) => Success(ReviewModel.fromJson(value).toEntity()),
      failure: (error) => Failure(error),
    );
  }

  @override
  Future<GetMapReview> getMapReview(
    DocumentReference<Map<String, dynamic>> reviewRef,
  ) async {
    final Logger logger = Logger('RecipeRepositoryFirebaseImpl/getMapReview');
    final reviewDoc = await reviewRef.get();
    final reviewData = reviewDoc.data();
    // logger.info('reviewDoc.exists: ${reviewDoc.exists}');
    // logger.info('reviewData: $reviewData');
    if (reviewData != null) {
      final ref = reviewDoc.reference;
      final reviewerRef = reviewData['userRef'];
      final reviewerData = await _getJsonReviewer(reviewerRef);
      logger.info(reviewerData);
      reviewData['id'] = reviewDoc.id;
      reviewData['ref'] = ref;
      reviewData['reviewerModel'] = reviewerData;
      return Success(reviewData);
    }
    return Failure(FetchElementException(''));
  }

  Future<Map<String, dynamic>> _getJsonReviewer(
    DocumentReference<Map<String, dynamic>> userRef,
  ) async {
    // Logger logger = Logger('RecipeRepositoryFirebaseImpl/_getJsonReviewer');
    final reviewerCacheData = await _reviewersCacheService.get(userRef.id);
    if (reviewerCacheData != null) {
      // logger.info('reviewerCacheData: $reviewerCacheData');
      return reviewerCacheData.toJson();
    }
    final reviewerDoc = await userRef.get();
    final reviewerData = reviewerDoc.data();
    if (reviewerData != null) {
      // logger.info('reviewerData: ${reviewerData['id']}');
      await _reviewersCacheService.add(reviewerData);
      return reviewerData;
    } else {
      // logger.info('no reviewer found');
      throw FetchElementException('no reviewer found.');
    }
  }

  // Future<Map<String, dynamic>?> _getJsonReviewer(
  //   DocumentReference<Object?> userRef,
  // ) async {
  //   // Logger logger = Logger('RecipeRepositoryFirebaseImpl/_getJsonReviewer');
  //   final reviewerCacheData = await _reviewersCacheService.get(userRef.id);
  //   if (reviewerCacheData != null) {
  //     // logger.info('reviewerCacheData: $reviewerCacheData');
  //     return reviewerCacheData.toJson();
  //   }
  //   final reviewerDoc = await userRef.get();
  //   final reviewerData = reviewerDoc.data() as Map<String, dynamic>?;
  //   if (reviewerData != null) {
  //     await _reviewersCacheService.add(reviewerData);
  //     return reviewerData;
  //   } else {
  //     return null;
  //   }
  // }

  Future<bool> updateRecipeReviews(
    String recipeId,
    DocumentReference reviewRef,
  ) async {
    try {
      final db = FirebaseFirestore.instance;
      await db.collection(RecipeModel.collectionId).doc(recipeId).update({
        'reviewsRef': FieldValue.arrayUnion([reviewRef]),
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
