import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/core/utils/find_id_index.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/entities.dart';

part 'recipe_info_event.dart';
part 'recipe_info_state.dart';

@lazySingleton
class RecipeInfoBloc extends Bloc<RecipeInfoEvent, RecipeInfoState> {
  RecipeInfoBloc() : super(RecipeInfoInitial()) {
    on<RecipeLoadEvent>(_onLoadRecipe);
    on<FetchRecipe>(_onFetchRecipe);
    on<ChangeSelectedPortion>(_onChangeSelectedPortion);
  }

  void _onLoadRecipe(RecipeLoadEvent event, Emitter<RecipeInfoState> emit) {
    // Logger logger = Logger('_onLoadRecipe');
    emit(RecipeInfoLoading());
    final receiveDetails = event.recipe.details;
    final selectedPortion = event.recipe.selectedPortion;
    final selectedPortionIndex = findIndex(
      receiveDetails.servings,
      selectedPortion.id,
    );
    final hasPrevious = (selectedPortionIndex - 1) >= 0;
    final hasNext = (selectedPortionIndex + 1) < receiveDetails.servings.length;
    final reviewsMap = _getReviewsMap(event.recipe.reviews);
    // logger.info(reviewsMap.toString());
    emit(
      RecipeInfoSuccess(
        event.recipe,
        reviewsMap: reviewsMap,
        selectedPortion: selectedPortion,
        hasPrevious: hasPrevious,
        hasNext: hasNext,
      ),
    );
  }

  void _onFetchRecipe(FetchRecipe event, Emitter<RecipeInfoState> emit) {
    //TODO: fetch when recip not passed
    emit(RecipeInfoFailure('Not implemented yet'));
  }

  void _onChangeSelectedPortion(
    ChangeSelectedPortion event,
    Emitter<RecipeInfoState> emit,
  ) {
    if (state is! RecipeInfoSuccess) return;

    final successState = state as RecipeInfoSuccess;
    final currentSelectedId = successState.selectedPortion.id;
    final servings = successState.recipe.details.servings;
    final currentIndex = findIndex(servings, currentSelectedId);

    final newPortion =
        event.next
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
        ? emit(
          successState.copyWith(
            selectedPortion: newPortion,
            hasPrevious: hasPrevious,
            hasNext: hasNext,
          ),
        )
        : emit(
          successState.copyWith(
            selectedPortion: newPortion,
            hasPrevious: hasPrevious,
            hasNext: hasNext,
          ),
        );
  }

  void initRecipe(String id, Recipe? recipe) {
    if (recipe != null) {
      add(RecipeLoadEvent(recipe));
    } else {
      // Fetch from Firestore
      add(FetchRecipe(id));
    }
  }

  Map<String, Review> _getReviewsMap(Reviews reviews) {
    final Map<String, Review> reviewsMap = {};
    for (var element in reviews) {
      reviewsMap[element.id] = element;
    }
    return reviewsMap;
  }
}
