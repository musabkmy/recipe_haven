// import 'package:hive/hive.dart';
// import 'package:recipe_haven/core/services/cache/cache_item.dart';

// class CacheItemAdapter extends TypeAdapter<CacheItem> {
//   @override
//   final int typeId = 1;

//   @override
//   CacheItem read(BinaryReader reader) {
//     final data = reader.read();
//     final expiresAt = reader.read() as DateTime?;
//     return CacheItem(data, expiresAt);
//   }

//   @override
//   void write(BinaryWriter writer, CacheItem obj) {
//     writer.write(obj.data);
//     writer.write(obj.expiresAt);
//   }
// }
