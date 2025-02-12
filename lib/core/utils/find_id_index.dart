import 'package:recipe_haven/core/support_classes/has_id.dart';

int findIndex<T extends HasId>(List<T> list, String id) {
  return list.indexWhere((item) => item.id == id);
}
