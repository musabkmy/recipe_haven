extension ObjectExtensions<T> on T? {
  R? let<R>(R Function(T) operation, {R Function()? orElse}) {
    if (this == null || this == false) {
      return orElse?.call(); // Returns `null` if `orElse` is null
    }
    return operation(this as T);
  }
}
