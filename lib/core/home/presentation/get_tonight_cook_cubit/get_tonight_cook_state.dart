part of 'get_tonight_cook_cubit.dart';

sealed class GetTonightCookState extends Equatable {
  const GetTonightCookState();

  @override
  List<Object> get props => [];
}

final class GetTonightCookInitial extends GetTonightCookState {}

final class GetTonightCookLoading extends GetTonightCookState {}

final class GetTonightCookSuccess extends GetTonightCookState {
  final Recipes recipes;

  const GetTonightCookSuccess(this.recipes);
  @override
  List<Object> get props => [recipes];
}

final class GetTonightCookFailure extends GetTonightCookState {
  final String errorMsg;
  const GetTonightCookFailure(this.errorMsg);
  @override
  List<Object> get props => [errorMsg];
}
