import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/adapters/reviewer_model_adapter.dart';
import 'package:recipe_haven/core/services/cache/hive_cache_service.dart';
import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart';
import 'package:recipe_haven/features/recipe_review/data/repositories/reviewers_cache_service.dart';

@module
abstract class HiveModule {
  @preResolve
  Future<HiveCacheService<ReviewerModel>> provideReviewerCache() async {
    // Hive.registerAdapter(ReviewerModelAdapter());

    return HiveCacheService<ReviewerModel>(
      boxName: 'reviewers_box',
      adapter: ReviewerModelAdapter(),
    );
  }

  @preResolve
  Future<ReviewersCacheService> provideReviewersCache(
    HiveCacheService<ReviewerModel> hiveCache, // Injected automatically
  ) async {
    return await ReviewersCacheService.create(hiveCache);
  }
}
