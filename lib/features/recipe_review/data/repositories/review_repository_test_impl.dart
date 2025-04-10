import 'dart:math' show Random;
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/entities.dart';
import 'package:recipe_haven/features/recipe_review/data/models/models.dart';
import 'package:recipe_haven/features/recipe_review/domain/repositories/repositories.dart';

@Injectable(as: ReviewRepository, env: [Env.dev])
class ReviewRepositoryTestImpl implements ReviewRepository {
  @override
  Future<GetIsReviewUploaded> addRecipeReview(CreateReviewModel review) {
    return Future.value(
      Success(
        Review(
          id: Random().nextInt(44).toString(),
          userID: 'Ahmed',
          userName: 'Ali',
          userProfilePic: null,
          imagesUrl: review.imagesUrl,
          publishedAt: DateTime.now(),
          comment: review.comment,
        ),
      ),
    );
  }
}
