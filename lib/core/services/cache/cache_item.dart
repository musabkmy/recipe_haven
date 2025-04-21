// import 'package:hive/hive.dart';

// /// Wrapper for cached items with expiration support
// @HiveType(typeId: 1, adapterName: 'CacheItemAdapter')
// class CacheItem<T> extends HiveObject {
//   @HiveField(0)
//   final T data;

//   @HiveField(1)
//   final DateTime? expiresAt;

//   CacheItem(this.data, this.expiresAt);

//   bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);
// }
