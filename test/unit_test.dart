import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_haven/config/extensions/duration_extension.dart';

void main() {
  test('from human Duration to Duration class', () {
    // debugPrint(parseHumanDuration('1h30m40s').toString());
    debugPrint(
      Duration(hours: 2, minutes: 3, seconds: 1).inJsonDuration().toString(),
    );
  });

  test('get recipes', () async {
    var url = Uri.parse(
      'https://45c0a0b7-bf37-4a43-b941-599f9b0358cc.mock.pstmn.io/recipes',
    );
    final response = await http.get(
      url,
      // headers: {
      //   'X-API-Key':
      //       'your_postman_api_key', // Replace with your actual Postman API Key
      //   'Content-Type': 'application/json',
      // },
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
    } else {
      debugPrint(response.reasonPhrase);
    }
  });
}
