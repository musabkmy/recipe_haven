sealed class Result<T, K> {
  const Result();
  R when<R>({
    required R Function(T value) success,
    required R Function(K error) failure,
  });
}

class Success<T, K> extends Result<T, K> {
  final T value;
  const Success(this.value);

  @override
  R when<R>({
    required R Function(T value) success,
    required R Function(K error) failure,
  }) {
    return success(value);
  }
}

class Failure<T, K> extends Result<T, K> {
  final K error;
  const Failure(this.error);

  @override
  R when<R>({
    required R Function(T value) success,
    required R Function(K error) failure,
  }) {
    return failure(error);
  }
}
