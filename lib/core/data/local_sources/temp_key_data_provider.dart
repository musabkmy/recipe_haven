import 'package:flutter/foundation.dart';

abstract class TempDataProvider<T> extends ChangeNotifier {
  bool hasKey(String key);
  List<T> getAllData(String key);
  void addData(String key, T value);
  void restKeyData(String key);
  void resetAll();
}
