part of 'recipe_info_bloc.dart';

sealed class RecipeInfoState extends Equatable {
  const RecipeInfoState();

  @override
  List<Object> get props => [];
}

final class RecipeInfoInitial extends RecipeInfoState {}

final class RecipeInfoSuccess extends RecipeInfoState {
  final Recipe recipe;
  const RecipeInfoSuccess(this.recipe);

  @override
  List<Object> get props => [recipe];
}

final class RecipeInfoFailure extends RecipeInfoState {
  final String errorMsg;
  const RecipeInfoFailure(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
