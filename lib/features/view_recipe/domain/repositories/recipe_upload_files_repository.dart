import 'dart:io' show File;

import 'package:recipe_haven/core/exceptions/upload_exceptions.dart';
import 'package:recipe_haven/core/recourses/data_state.dart';

typedef GetUploadedImageUrl = Result<List<String>, UploadException>;

abstract class RecipeUploadFilesRepository {
  Future<GetUploadedImageUrl> uploadImages(List<File> images);
}
