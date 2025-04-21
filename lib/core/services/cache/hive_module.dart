import 'package:injectable/injectable.dart';
import 'package:recipe_haven/core/services/cache/hive_cache_service.dart';
import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart';
import 'package:recipe_haven/features/recipe_review/data/models/sub_review_model.dart';
import 'package:recipe_haven/features/recipe_review/data/repositories/cache_repositories/reviewers_cache_service.dart';
import 'package:recipe_haven/features/recipe_review/data/repositories/cache_repositories/sub_reviews_cache_service.dart';

@module
abstract class HiveModule {
  @preResolve
  @singleton
  Future<HiveCacheService<ReviewerModel>> provideReviewersBox() async {
    return HiveCacheService<ReviewerModel>(boxName: 'reviewers_box');
  }

  @preResolve
  @singleton
  Future<HiveCacheService<SubReviewModel>> provideSubReviewsBox() async {
    return HiveCacheService<SubReviewModel>(boxName: 'sub_reviews_box');
  }

  @preResolve
  Future<ReviewersCacheService> provideReviewersCache(
    HiveCacheService<ReviewerModel> hiveCache, // Injected automatically
  ) async {
    return ReviewersCacheService.create(hiveCache);
  }

  @preResolve
  Future<SubReviewsCacheService> provideSubReviewsCache(
    HiveCacheService<SubReviewModel> hiveCache, // Injected automatically
  ) async {
    return SubReviewsCacheService.create(hiveCache);
  }
}
