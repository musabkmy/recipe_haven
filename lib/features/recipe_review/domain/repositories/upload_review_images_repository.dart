export 'package:recipe_haven/core/exceptions/upload_exceptions.dart';
export '../../../../core/recourses/data_state.dart';

import 'package:image_picker/image_picker.dart' show XFile;
import 'package:recipe_haven/core/exceptions/upload_exceptions.dart';
import 'package:recipe_haven/core/recourses/data_state.dart';

typedef GetUploadedImageUrl = Result<List<String>, UploadException>;

abstract class UploadReviewImagesRepository {
  Future<GetUploadedImageUrl> uploadImages(String id, List<XFile> images);
}
