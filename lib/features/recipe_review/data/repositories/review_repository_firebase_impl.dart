import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/features/recipe_review/data/models/models.dart';
import 'package:recipe_haven/features/recipe_review/domain/repositories/review_repository.dart';

@Injectable(as: ReviewRepository, env: [Env.prod])
class ReviewRepositoryFirebaseImpl implements ReviewRepository {
  @override
  Future<GetIsReviewUploaded> addRecipeReview(CreateReviewModel review) {
    //TODO: implement adding a review
    return Future.value(Failure(UploadException('unimplemented')));
  }
}
