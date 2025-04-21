import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/core/services/cache/cache_item.dart';
import 'package:recipe_haven/core/services/cache/cache_service.dart';
import 'package:synchronized/synchronized.dart';

/// Main Hive-based cache service
final class HiveCacheService<T extends HiveObject> implements CacheService<T> {
  final String boxName;
  // To prevent race conditions
  final Lock _lock = Lock();
  Box<T>? _box;

  HiveCacheService({required this.boxName});

  // Lazy initialization of the Hive box
  // The Hive box opens only on first use
  // Thread-safe initialization with synchronized
  Future<Box<T>> get _boxInternal async {
    return await _lock.synchronized(() async {
      _box ??= await Hive.openBox<T>(boxName);
      return _box!;
    });
  }

  @override
  Future<void> save({
    required String key,
    required T data,
    // Duration? ttl,
  }) async {
    try {
      // final expiresAt = ttl != null ? DateTime.now().add(ttl) : null;
      await (await _boxInternal).put(key, data);
    } catch (e) {
      Logger(
        'Hive cache/save',
      ).warning('Failed to save "$key": ${e.toString()}');
    }
  }

  @override
  Future<T?> get(String key) async {
    try {
      final item = (await _boxInternal).get(key);
      if (item == null) {
        await remove(key);
        return null;
      }
      return item;
    } catch (e) {
      throw CacheNotFoundException('Failed to get "$key": ${e.toString()}');
    }
  }

  @override
  Future<List<T>> getAll() async {
    try {
      final box = await _boxInternal;
      return box.values.map((item) => item).toList();
    } on HiveError catch (e) {
      // Critical failure
      throw CacheNotFoundException('Hive error: ${e.message}');
    } catch (e) {
      debugPrint('Error: $e');
      // Return empty list for non-critical issues (e.g., no items)
      return [];
    }
  }

  @override
  Future<void> remove(String key) async {
    try {
      await (await _boxInternal).delete(key);
    } catch (e) {
      throw CacheCantBeRemovedException(
        'Failed to remove "$key": ${e.toString()}',
      );
    }
  }

  /// Closes the underlying Hive box (call this when done)
  @override
  Future<void> close() async {
    await _box?.close();
    _box = null;
  }
}
