extension ObjectExtensions<T> on T? {
  R? let<R>(R Function(T) operation) {
    if (this == null || this == false) {
      return null;
    }
    return operation(this as T);
  }

  R letOrElse<R>(R Function(T) operation, {required R Function() orElse}) {
    if (this == null || this == false) {
      return orElse();
    }
    return operation(this as T);
  }
}
