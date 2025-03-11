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
  final Map<String, Review> reviewsMap;
  final PortionBasedRecipe selectedPortion;
  final bool hasNext;
  final bool hasPrevious;
  const RecipeInfoSuccess(
    this.recipe, {
    required this.reviewsMap,
    required this.selectedPortion,
    required this.hasPrevious,
    required this.hasNext,
  });

  @override
  List<Object> get props => [recipe, selectedPortion, reviewsMap];

  RecipeInfoSuccess copyWith({
    Recipe? recipe,
    Map<String, Review>? reviewsMap,
    PortionBasedRecipe? selectedPortion,
    bool? hasNext,
    bool? hasPrevious,
  }) {
    return RecipeInfoSuccess(
      recipe ?? this.recipe,
      reviewsMap: reviewsMap ?? this.reviewsMap,

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
