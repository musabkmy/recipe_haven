import 'package:cloud_firestore/cloud_firestore.dart' show DocumentReference;
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/features/recipe_review/data/models/models.dart';
import 'package:recipe_haven/features/recipe_review/data/repositories/cache_repositories/reviewers_cache_service.dart';
import 'package:recipe_haven/features/recipe_review/data/repositories/cache_repositories/sub_reviews_cache_service.dart';
import 'package:recipe_haven/features/recipe_review/domain/repositories/review_repository.dart';

@Injectable(as: ReviewRepository, env: [Env.prod])
class ReviewRepositoryFirebaseImpl implements ReviewRepository {
  final SubReviewsCacheService _subReviewsCacheService;
  final ReviewersCacheService _reviewersCacheService;
  const ReviewRepositoryFirebaseImpl(
    this._subReviewsCacheService,
    this._reviewersCacheService,
  );
  @override
  Future<GetIsReviewUploaded> addRecipeReview(CreateReviewModel review) {
    //TODO: implement adding a review
    return Future.value(Failure(UploadException('unimplemented')));
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

  Future<Map<String, dynamic>?> _getJsonReviewer(
    DocumentReference<Object?> userRef,
  ) async {
    // Logger logger = Logger('RecipeRepositoryFirebaseImpl/_getJsonReviewer');
    final reviewerCacheData = await _reviewersCacheService.get(userRef.id);
    if (reviewerCacheData != null) {
      // logger.info('reviewerCacheData: $reviewerCacheData');
      return reviewerCacheData.toJson();
    }
    final reviewerDoc = await userRef.get();
    final reviewerData = reviewerDoc.data() as Map<String, dynamic>?;
    if (reviewerData != null) {
      await _reviewersCacheService.add(reviewerData);
      return reviewerData;
    } else {
      return null;
    }
  }
}
