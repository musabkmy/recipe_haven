import 'package:recipe_haven/core/services/cache/hive_cache_service.dart';
import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart';

final class ReviewersCacheService {
  final HiveCacheService<ReviewerModel> _hiveCacheService;
  final Map<String, ReviewerModel> _cache;

  // Factory constructor with async initialization
  // @factoryMethod
  static Future<ReviewersCacheService> create(
    HiveCacheService<ReviewerModel> hiveCacheService,
  ) async {
    // assert(hiveCacheService != null, 'HiveCacheService must be provided');
    final initialData = await hiveCacheService.getAll();
    final cache = {for (final reviewer in initialData) reviewer.id: reviewer};
    return ReviewersCacheService._(hiveCacheService, cache);
  }

  ReviewersCacheService._(this._hiveCacheService, this._cache);

  Future<void> add(Map<String, dynamic> json) async {
    final reviewer = ReviewerModel.fromJson(json);
    final key = reviewer.id;
    if (!_cache.containsKey(key)) {
      try {
        await _hiveCacheService.save(key: key, data: reviewer);
        _cache.putIfAbsent(key, () => reviewer);
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<Map<String, dynamic>?> hasData(String key) async {
    return _cache.containsKey(key) ? _cache[key]!.toJson() : null;
  }

  Future<void> remove(String key) async {
    _cache.remove(key);
  }
}
