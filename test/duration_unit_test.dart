import 'package:test/test.dart';
import 'package:recipe_haven/config/utils/duration_utils.dart';

void main() {
  group('parseHumanDuration', () {
    test('should return Duration.zero for null input', () {
      final result = parseHumanDuration(null);
      expect(result, Duration.zero);
    });

    test('should parse hours correctly', () {
      final result = parseHumanDuration('2h');
      expect(result, Duration(hours: 2));
    });

    test('should parse minutes correctly', () {
      final result = parseHumanDuration('30m');
      expect(result, Duration(minutes: 30));
    });

    test('should parse seconds correctly', () {
      final result = parseHumanDuration('45s');
      expect(result, Duration(seconds: 45));
    });

    test('should parse combined hours, minutes, and seconds correctly', () {
      final result = parseHumanDuration('2h30m45s');
      expect(result, Duration(hours: 2, minutes: 30, seconds: 45));
    });

    test('should handle missing hours', () {
      final result = parseHumanDuration('30m45s');
      expect(result, Duration(minutes: 30, seconds: 45));
    });

    test('should handle missing minutes', () {
      final result = parseHumanDuration('2h45s');
      expect(result, Duration(hours: 2, seconds: 45));
    });

    test('should handle missing seconds', () {
      final result = parseHumanDuration('2h30m');
      expect(result, Duration(hours: 2, minutes: 30));
    });

    test('should handle invalid input (non-numeric)', () {
      final result = parseHumanDuration('abc');
      expect(result, Duration.zero);
    });

    test('should handle partial invalid input', () {
      final result = parseHumanDuration('2habc30m');
      expect(result, Duration(hours: 2, minutes: 0)); // Minutes part is invalid
    });

    test('should handle empty input', () {
      final result = parseHumanDuration('');
      expect(result, Duration.zero);
    });

    test('should handle input with no units', () {
      final result = parseHumanDuration('123');
      expect(result, Duration.zero);
    });

    test('should handle input with extra characters', () {
      final result = parseHumanDuration('2h30m45sxyz');
      expect(result, Duration(hours: 2, minutes: 30, seconds: 45));
    });
  });
}
