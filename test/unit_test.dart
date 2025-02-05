import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_haven/config/utils/duration_utils.dart';

void main() {
  test('from human Duration to Duration class', () {
    // debugPrint(parseHumanDuration('1h30m40s').toString());
    debugPrint(
        toHumanDuration(Duration(hours: 2, minutes: 3, seconds: 1)).toString());
  });
}
