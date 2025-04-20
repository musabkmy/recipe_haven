import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/features/recipe_review/data/models/models.dart';
import 'package:recipe_haven/features/recipe_review/data/repositories/reviewers_cache_service.dart';
import 'package:recipe_haven/features/recipe_review/domain/repositories/review_repository.dart';

@Injectable(as: ReviewRepository, env: [Env.prod])
class ReviewRepositoryFirebaseImpl implements ReviewRepository {
  final ReviewersCacheService _reviewersCacheService;
  const ReviewRepositoryFirebaseImpl(this._reviewersCacheService);
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
    final SubReviewModelsMap subReviews = {};
    Logger logger = Logger('ReviewRepositoryFirebaseImpl/getSubReviews');
    try {
      for (final ref in subReviewsRef) {
        if (ref is DocumentReference) {
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
          // logger.info('subReviewData: $subReviewData');

          final subReviewModel = SubReviewModel.fromJson(subReviewData);

          subReviews[subReviewModel.id] = subReviewModel;
        }
      }
      return Success(subReviews.toEntityMap());
    } catch (e) {
      logger.log(Level.WARNING, 'Error: ${e.toString()}');
      return Success(subReviews.toEntityMap());
    }
  }

  Future<Map<String, dynamic>?> _getJsonReviewer(
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
      await _reviewersCacheService.add(reviewerData);
      return reviewerData;
    } else {
      return null;
    }
  }
}
