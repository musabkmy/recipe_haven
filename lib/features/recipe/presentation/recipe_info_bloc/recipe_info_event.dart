part of 'recipe_info_bloc.dart';

sealed class RecipeInfoEvent extends Equatable {
  const RecipeInfoEvent();

  @override
  List<Object> get props => [];
}

final class RecipeLoadEvent extends RecipeInfoEvent {
  const RecipeLoadEvent(this.recipe);
  final Recipe recipe;

  @override
  List<Object> get props => [recipe];
}

final class ChangeSelectedPortion extends RecipeInfoEvent {
  const ChangeSelectedPortion({required this.next});
  final bool next;

  @override
  List<Object> get props => [next];
}
