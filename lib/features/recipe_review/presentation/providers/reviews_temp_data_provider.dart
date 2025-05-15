import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/core/data/local_sources/temp_key_data_provider.dart';

@lazySingleton
class ReviewsTempDataProvider<Review> extends TempDataProvider<Review> {
  ///key: recipeId
  final Map<String, List<Review>> _data = {};
  final Logger logger = Logger('ReviewsTempDataProvider');

  @override
  ///key: recipeId
  bool hasKey(String key) {
    logger.info('Key: ${_data.containsKey(key)}');
    return _data.containsKey(key);
  }

  @override
  ///key: recipeId
  void addData(String key, Review value) {
    logger.info('add: $value to $key');
    // _data.update(
    //   key,
    //   (existingList) => existingList..add(value),
    //   ifAbsent: () => [value],
    // );
    updateReviews(key, [..._data[key] ?? [], value]);
  }

  void updateReviews(String recipeId, List<Review> newList) {
    if (!const ListEquality().equals(_data[recipeId], newList)) {
      _data[recipeId] = newList;
      notifyListeners(); // Force notify even for order changes
    }
  }

  @override
  ///key: recipeId
  List<Review> getAllData(String key) {
    logger.info('values: ${_data[key] ?? []}');
    return _data[key] ?? [];
  }

  @override
  ///key: recipeId
  void restKeyData(String key) {
    logger.info('remove $key');
    _data.remove(key);
    notifyListeners();
  }

  @override
  void resetAll() {
    logger.info('clear _data');
    _data.clear();
    notifyListeners();
  }
}
