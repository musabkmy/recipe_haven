import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/recourses/data_state.dart';
import 'package:recipe_haven/features/view_recipe/domain/repositories/recipe_upload_files_repository.dart';

@Injectable(as: RecipeUploadFilesRepository, env: [Env.dev])
class RecipeUploadFilesRepositoryTestImpl
    implements RecipeUploadFilesRepository {
  @override
  Future<GetUploadedImageUrl> uploadImages(List<File> images) {
    return Future.value(Success([]));
  }
}
