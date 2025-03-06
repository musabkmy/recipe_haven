// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recipe_info_bloc.dart';

sealed class RecipeInfoState extends Equatable {
  const RecipeInfoState();

  @override
  List<Object> get props => [];
}

final class RecipeInfoInitial extends RecipeInfoState {}

final class RecipeInfoLoading extends RecipeInfoState {}

class RecipeInfoSuccess extends RecipeInfoState {
  final Recipe recipe;
  final PortionBasedRecipe selectedPortion;
  final bool hasNext;
  final bool hasPrevious;
  const RecipeInfoSuccess(
    this.recipe, {
    required this.selectedPortion,
    required this.hasPrevious,
    required this.hasNext,
  });

  @override
  List<Object> get props => [recipe, selectedPortion];

  RecipeInfoSuccess copyWith({
    Recipe? recipe,
    PortionBasedRecipe? selectedPortion,
    bool? hasNext,
    bool? hasPrevious,
  }) {
    return RecipeInfoSuccess(
      recipe ?? this.recipe,
      selectedPortion: selectedPortion ?? this.selectedPortion,
      hasPrevious: hasPrevious ?? this.hasPrevious,
      hasNext: hasNext ?? this.hasNext,
    );
  }
}

final class RecipeInfoFailure extends RecipeInfoState {
  final String errorMsg;
  const RecipeInfoFailure(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
