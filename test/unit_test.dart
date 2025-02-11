import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_haven/config/extensions/duration_extensions.dart';

void main() {
  test('from human Duration to Duration class', () {
    // debugPrint(parseHumanDuration('1h30m40s').toString());
    debugPrint(Duration(hours: 2, minutes: 3, seconds: 1)
        .toHumanDuration()
        .toString());
  });
}
