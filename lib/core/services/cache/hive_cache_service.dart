import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/adapters/reviewer_model_adapter.dart';
import 'package:recipe_haven/core/services/cache/cache_service.dart';
import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart';
import 'package:recipe_haven/features/recipe_review/data/repositories/reviewers_cache_service.dart';

final class HiveCacheService<T extends HiveObject> implements CacheService<T> {
  final String boxName;
  final TypeAdapter<T>? adapter;

  HiveCacheService({required this.boxName, this.adapter}) {
    if (adapter != null) {
      Hive.registerAdapter(adapter!);
    }
  }

  Future<Box<T>> get _box async => await Hive.openBox(boxName);

  @override
  Future<void> save({required String key, required T data}) async {
    try {
      final box = await _box;
      await box.put(key, data);
    } catch (e) {
      throw CacheCantBeAddedException(e.toString());
    }
  }

  @override
  Future<T?> get(String key) async {
    final box = await _contains(key);
    if (box == null) return null;
    try {
      final item = box.get(key);
      if (item == null) return null;
      return item;
    } catch (e) {
      throw CacheNotFoundException(e.toString());
    }
  }

  @override
  Future<List<T>> getAll() async {
    try {
      final box = await _box;
      return box.values.toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> remove(String key) async {
    final box = await _contains(key);
    if (box == null) return;
    try {
      await box.delete(key);
    } catch (e) {
      throw CacheCantBeRemovedException(e.toString());
    }
  }

  Future<Box<T>?> _contains(String key) async {
    try {
      final box = await _box;
      if (!box.containsKey(key)) return box;
      return null;
    } catch (e) {
      throw CacheNotFoundException(e.toString());
    }
  }

  // class T {
  //   final T data;
  //   final DateTime? expiresAt;

  //   _CacheItem(this.data, this.expiresAt);

  //   bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);}
}

@module
abstract class HiveModule {
  @preResolve
  Future<HiveCacheService<ReviewerModel>> provideReviewerCache() async {
    Hive.registerAdapter(ReviewerModelAdapter());

    return HiveCacheService<ReviewerModel>(
      boxName: 'reviewers_box',
      adapter: ReviewerModelAdapter(),
    );
  }

  @preResolve
  Future<ReviewersCacheService> provideReviewersCache(
    HiveCacheService<ReviewerModel> hiveCache, // Injected automatically
  ) async {
    return ReviewersCacheService.create(hiveCache);
  }
}
