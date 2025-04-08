import 'package:image_picker/image_picker.dart' show XFile;
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/features/recipe_review/domain/repositories/upload_review_images_repository.dart';

@Injectable(as: UploadReviewImagesRepository, env: [Env.dev])
class RecipeUploadFilesRepositoryTestImpl
    implements UploadReviewImagesRepository {
  @override
  Future<GetUploadedImageUrl> uploadImages(String id, List<XFile> images) {
    return Future.value(Success(['//']));
  }
}
