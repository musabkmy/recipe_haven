import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/core/services/cache/hive_cache_service.dart';
import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart';

//injected using hive module
final class ReviewersCacheService {
  final HiveCacheService<ReviewerModel> _cacheService;
  final Map<String, ReviewerModel> _cache;
  final logger = Logger('ReviewersCacheService');

  ReviewersCacheService._(this._cacheService, this._cache);

  // Factory constructor with async initialization
  // @factoryMethod
  static Future<ReviewersCacheService> create(
    HiveCacheService<ReviewerModel> hiveCacheService,
  ) async {
    Logger logger = Logger('ReviewersCacheService/create');
    // assert(hiveCacheService != null, 'HiveCacheService must be provided');
    final initialData = await hiveCacheService.getAll();
    final cache = {for (final reviewer in initialData) reviewer.id: reviewer};
    logger.info('ReviewersCacheService initialized with $cache');
    return ReviewersCacheService._(hiveCacheService, cache);
  }

  Future<void> add(Map<String, dynamic> json) async {
    final reviewer = ReviewerModel.fromJson(json);
    final key = reviewer.id;
    logger.info('needs to add: $key');
    if (!_cache.containsKey(key)) {
      try {
        await _cacheService.save(key: key, data: reviewer);
        logger.info('added: $key');
        _cache.putIfAbsent(key, () => reviewer);
      } catch (e) {
        logger.warning(e.toString());
        rethrow;
      }
    }
  }

  Future<ReviewerModel?> get(String key) async {
    logger.info('hasKey: $key in $_cache');

    return _cache[key];
  }

  Future<void> remove(String key) async {
    _cache.remove(key);
  }

  Future<void> close() async {
    await _cacheService.close();
  }
}
