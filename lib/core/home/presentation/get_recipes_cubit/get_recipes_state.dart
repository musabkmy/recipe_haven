part of 'get_recipes_cubit.dart';

sealed class GetRecipesState extends Equatable {
  const GetRecipesState();

  @override
  List<Object> get props => [];
}

final class GetRecipesInitial extends GetRecipesState {
  const GetRecipesInitial();
}

final class GetRecipesLoading extends GetRecipesState {
  const GetRecipesLoading();
}

final class GetRecipesSuccess extends GetRecipesState {
  final Recipes recipes;
  const GetRecipesSuccess(this.recipes);
  @override
  List<Object> get props => [recipes];
}

final class GetRecipesFailure extends GetRecipesState {
  final String errorMsg;
  const GetRecipesFailure(this.errorMsg);
  @override
  List<Object> get props => [errorMsg];
}
