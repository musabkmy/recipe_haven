import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/exceptions/upload_exceptions.dart';
import 'package:recipe_haven/core/recourses/data_state.dart';
import 'package:recipe_haven/features/view_recipe/domain/repositories/recipe_upload_files_repository.dart';

@Injectable(as: RecipeUploadFilesRepository, env: [Env.prod])
class RecipeUploadFilesRepositorySupabaseImpl
    implements RecipeUploadFilesRepository {
  @override
  Future<GetUploadedImageUrl> uploadImages(List<File> images) {
    //TODO: supabaseImpl
    return Future.value(Failure(UploadException('un implemented')));
  }
}
