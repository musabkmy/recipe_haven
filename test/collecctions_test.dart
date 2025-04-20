import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  QueueList withInternalGap() {
    var queue = QueueList.from(<dynamic>[null, null, null, null, 1, 2, 3, 4]);
    for (var i = 0; i < 4; i++) {
      queue.removeFirst();
    }
    for (var i = 5; i < 8; i++) {
      queue.addLast(i);
    }
    return queue[5];
  }

  test('queue list', () {
    int? _443;
    7.toString();
    // debugPrint('QueueList: ${withInternalGap()}');
  });
}
