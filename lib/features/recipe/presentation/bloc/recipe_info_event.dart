part of 'recipe_info_bloc.dart';

sealed class RecipeInfoEvent extends Equatable {
  const RecipeInfoEvent();

  @override
  List<Object> get props => [];
}

final class RecipeLoadEvent extends RecipeInfoEvent {
  final Recipe recipe;
  const RecipeLoadEvent(this.recipe);

  @override
  List<Object> get props => [recipe];
}
