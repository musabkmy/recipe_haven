export 'package:recipe_haven/core/exceptions/cache_exceptions.dart';

abstract class CacheService<T> {
  Future<void> save({
    required String key,
    required T data,
    // Duration? ttl,
  });

  Future<T?> get(String key);

  Future<List<T>?> getAll();

  // Future<bool> _contains(String key);

  Future<void> remove(String key);
  Future<void> close();
}
