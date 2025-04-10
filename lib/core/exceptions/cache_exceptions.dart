sealed class CacheExceptions implements Exception {
  const CacheExceptions(this.message);
  final String message;
}

final class CacheNotFoundException extends CacheExceptions {
  const CacheNotFoundException(super.message);
}

final class CacheCantBeRemovedException extends CacheExceptions {
  const CacheCantBeRemovedException(super.message);
}

final class CacheCantBeAddedException extends CacheExceptions {
  const CacheCantBeAddedException(super.message);
}
