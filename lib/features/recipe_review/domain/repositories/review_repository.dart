export 'package:recipe_haven/core/exceptions/upload_exceptions.dart';
export '../../../../core/recourses/data_state.dart';

import 'package:cloud_firestore/cloud_firestore.dart' show DocumentReference;
import 'package:recipe_haven/core/exceptions/fetch_element_exceptions.dart';
import 'package:recipe_haven/core/exceptions/upload_exceptions.dart';
import 'package:recipe_haven/features/recipe_review/data/models/create_review_model.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/sub_review_entity.dart';
import 'package:recipe_haven/features/view_recipe/view_recipe.dart';

typedef GetIsReviewUploaded = Result<Review, UploadException>;
typedef GetSubReviewsUploaded = Result<SubReviewsMap, UploadException>;
typedef GetMapReview = Result<Map<String, dynamic>, FetchElementException>;
typedef GetReview = Result<Review, FetchElementException>;

abstract class ReviewRepository {
  Future<GetIsReviewUploaded> addRecipeReview(CreateReviewModel review);
  Future<GetSubReviewsUploaded> getSubReviews(
    String mainReviewId,
    List<dynamic> subReviewsRef,
  );
  Future<GetMapReview> getMapReview(
    DocumentReference<Map<String, dynamic>> reviewRef,
  );
  Future<GetReview> getReview(
    DocumentReference<Map<String, dynamic>> reviewRef,
  );
}
