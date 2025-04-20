import 'dart:math' show Random;
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/data/mocking_sources/recipe_mock_source.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/entities.dart';
import 'package:recipe_haven/features/recipe_review/data/models/models.dart';
import 'package:recipe_haven/features/recipe_review/domain/repositories/repositories.dart';

@Injectable(as: ReviewRepository, env: [Env.dev])
class ReviewRepositoryTestImpl implements ReviewRepository {
  final RecipeMockSource recipeMockSource;
  @factoryMethod
  ReviewRepositoryTestImpl(this.recipeMockSource);

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
}
