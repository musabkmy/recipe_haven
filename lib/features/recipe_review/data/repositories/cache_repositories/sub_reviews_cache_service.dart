import 'package:logging/logging.dart';
import 'package:recipe_haven/core/services/cache/hive_cache_service.dart';
import 'package:recipe_haven/features/recipe_review/data/models/sub_review_model.dart';

//injected using hive module
final class SubReviewsCacheService {
  final HiveCacheService<SubReviewModel> _cacheService;
  final Map<String, SubReviewModel> _cache;
  final logger = Logger('SubReviewsCacheService');

  SubReviewsCacheService._(this._cacheService, this._cache);

  static Future<SubReviewsCacheService> create(
    HiveCacheService<SubReviewModel> hiveCacheService,
  ) async {
    Logger logger = Logger('ReviewersCacheService/create');
    // assert(hiveCacheService != null, 'HiveCacheService must be provided');
    final initialData = await hiveCacheService.getAll();
    final cache = {
      for (final subReview in initialData) subReview.id: subReview,
    };
    logger.info('subReviewCacheService initialized with $cache');
    return SubReviewsCacheService._(hiveCacheService, cache);
  }

  Future<void> add(Map<String, dynamic> json) async {
    final subReview = SubReviewModel.fromJson(json);
    final key = subReview.id;
    logger.info('needs to add: $key');
    if (!_cache.containsKey(key)) {
      try {
        await _cacheService.save(key: key, data: subReview);
        logger.info('added: $key');
        _cache.putIfAbsent(key, () => subReview);
      } catch (e) {
        logger.warning(e.toString());
        rethrow;
      }
    }
  }

  Future<SubReviewModel?> get(String key) async {
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
