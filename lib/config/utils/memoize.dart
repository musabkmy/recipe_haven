// to prevent rebuilding same items in a list
// Define this once in a utility file (e.g., `memoize.dart`)
class Memoize<T, R> {
  final R Function(T) _function;
  R? _lastResult;
  T? _lastInput;

  Memoize(this._function);

  R call(T input) {
    if (input == _lastInput) {
      return _lastResult!; // Return cached result
    } else {
      _lastInput = input;
      _lastResult = _function(input);
      return _lastResult!;
    }
  }
}
