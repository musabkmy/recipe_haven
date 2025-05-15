import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/data/mocking_sources/recipe_mock_source.dart';
import 'package:recipe_haven/features/recipe_review/data/models/models.dart';
import 'package:recipe_haven/features/recipe_review/domain/repositories/repositories.dart';

@Injectable(as: ReviewRepository, env: [Env.dev])
class ReviewRepositoryTestImpl implements ReviewRepository {
  final recipeMockSource = RecipeMockSource();
  @factoryMethod
  ReviewRepositoryTestImpl();

  @override
  Future<GetIsReviewUploaded> addRecipeReview(CreateReviewModel review) {
    return Future.value(
      Success(recipeMockSource.createReviews(review).toEntity()),
    );
  }

  @override
  Future<GetSubReviewsUploaded> getSubReviews(
    String mainReviewId,
    List<dynamic> subReviewsRef,
  ) {
    return Future.value(Success(recipeMockSource.getSubReviews.toEntityMap()));
  }

  @override
  Future<GetMapReview> getMapReview(
    DocumentReference<Map<String, dynamic>> reviewRef,
  ) {
    // TODO: implement getMapReview
    throw UnimplementedError();
  }

  @override
  Future<GetReview> getReview(
    DocumentReference<Map<String, dynamic>> reviewRef,
  ) {
    // TODO: implement getReview
    throw UnimplementedError();
  }
}
