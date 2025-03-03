part of 'base_bloc.dart';

sealed class BaseState<T, K> extends Equatable {
  const BaseState({this.data, this.errorException, this.isLoading = false});
  final T? data;
  final K? errorException;
  final bool isLoading;

  @override
  List<Object?> get props => [data, errorException, isLoading];
}

final class InitialState<T, K> extends BaseState<T, K> {
  const InitialState() : super();
}

final class LoadingState<T, K> extends BaseState<T, K> {
  const LoadingState() : super(isLoading: true);
}

final class SuccessState<T, K> extends BaseState<T, K> {
  const SuccessState(T data) : super(data: data);
}

final class ErrorState<T, K> extends BaseState<T, K> {
  const ErrorState(K errorException) : super(errorException: errorException);
}
