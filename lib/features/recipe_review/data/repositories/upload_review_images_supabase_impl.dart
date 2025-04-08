import 'package:image_picker/image_picker.dart' show XFile;
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/features/recipe_review/domain/repositories/upload_review_images_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: UploadReviewImagesRepository, env: [Env.prod])
// @Injectable(as: RecipeUploadFilesRepository, env: [Env.prod])
class UploadReviewImagesSupabaseImpl implements UploadReviewImagesRepository {
  @override
  Future<GetUploadedImageUrl> uploadImages(
    String id,
    List<XFile> images,
  ) async {
    final responseUrls = <String>[];
    for (var element in images) {
      final url = await uploadImage(id, element);
      if (url != null) {
        responseUrls.add(url);
      } else {
        return Future.value(Failure(UploadException('un implemented')));
      }
    }

    return Future.value(Success(responseUrls));
  }

  Future<String?> uploadImage(String id, XFile imageFile) async {
    final Logger logger = Logger('uploadImage');
    try {
      final supabase = Supabase.instance.client;
      final user = supabase.auth.currentUser;
      if (user == null) {
        throw Exception("User not logged in");
      }
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
      final filePath = '$id/$fileName';
      // logger.info('uploading image: $filePath');

      await supabase.storage
          .from('recipes-images')
          .uploadBinary(
            filePath,
            bytes,
            fileOptions: FileOptions(contentType: imageFile.mimeType),
          );
      final imageUrlResponse = await supabase.storage
          .from('recipes-images')
          .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);
      logger.info('imageUrlResponse: $imageUrlResponse');
      return imageUrlResponse;
    } on StorageException catch (error) {
      logger.warning('error: ${error.message}');
    } catch (error) {
      logger.warning('error: ${error.toString()}');
    }
    return null;
  }
}
