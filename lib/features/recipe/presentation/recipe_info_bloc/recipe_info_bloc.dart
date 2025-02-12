import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/core/utils/find_id_index.dart';
import 'package:recipe_haven/features/recipe/domain/entities/entities.dart';

part 'recipe_info_event.dart';
part 'recipe_info_state.dart';

@singleton
class RecipeInfoBloc extends Bloc<RecipeInfoEvent, RecipeInfoState> {
  RecipeInfoBloc() : super(RecipeInfoInitial()) {
    on<RecipeInfoEvent>((event, emit) {
      debugPrint('in RecipeInfoEvent');
    });
    on<RecipeLoadEvent>(onLoadRecipe);
    on<ChangeSelectedPortion>(onChangeSelectedPortion);
  }

  void onLoadRecipe(RecipeLoadEvent event, Emitter<RecipeInfoState> emit) {
    final receiveDetails = event.recipe.details;
    final selectedPortion = receiveDetails.servings.firstWhere(
        (element) => element.id == receiveDetails.defaultPortionBasedRecipeID,
        orElse: () => receiveDetails.servings.first);
    final selectedPortionIndex =
        findIndex(receiveDetails.servings, selectedPortion.id);
    final hasPrevious = (selectedPortionIndex - 1) >= 0;
    final hasNext = (selectedPortionIndex + 1) < receiveDetails.servings.length;
    emit(
      RecipeInfoSuccess(
        event.recipe,
        selectedPortion: selectedPortion,
        hasPrevious: hasPrevious,
        hasNext: hasNext,
      ),
    );
  }

  void onChangeSelectedPortion(
      ChangeSelectedPortion event, Emitter<RecipeInfoState> emit) {
    if (state is! RecipeInfoSuccess) return;

    final successState = state as RecipeInfoSuccess;
    final currentSelectedId = successState.selectedPortion.id;
    final servings = successState.recipe.details.servings;
    final currentIndex = findIndex(servings, currentSelectedId);

    final newPortion = event.next
        ? (currentIndex != -1 && currentIndex < servings.length - 1)
            ? servings[currentIndex + 1]
            : servings.first
        : (currentIndex != -1 &&
                currentIndex > 1 &&
                currentIndex < servings.length)
            ? servings[currentIndex - 1]
            : servings.first;
    // Logger('on change selected portion, newPortion:')
    //     .info(newPortion.servingsCount);
    final hasPrevious = (findIndex(servings, newPortion.id) - 1) >= 0;
    final hasNext = (findIndex(servings, newPortion.id) + 1) < servings.length;
    event.next
        ? emit(successState.copyWith(
            selectedPortion: newPortion,
            hasPrevious: hasPrevious,
            hasNext: hasNext))
        : emit(successState.copyWith(
            selectedPortion: newPortion,
            hasPrevious: hasPrevious,
            hasNext: hasNext));
  }
}
