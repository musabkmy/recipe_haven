import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/extensions/object_extension.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/sub_review_entity.dart';
import 'package:recipe_haven/features/recipe_review/domain/repositories/review_repository.dart';

part 'get_reviews_data_event.dart';
part 'get_reviews_data_state.dart';
part 'sub_review_state.dart';

@lazySingleton
class GetReviewsDataBloc
    extends Bloc<GetReviewsDataEvent, GetReviewsDataState> {
  final ReviewRepository reviewRepository;

  GetReviewsDataBloc(this.reviewRepository) : super(GetReviewsDataState()) {
    // on<GetReviewsDataEvent>((event, emit) {});
    on<GetSubReviewsEvent>(_onGetSubReviewsEvent);
  }

  Future<void> _onGetSubReviewsEvent(
    GetSubReviewsEvent event,
    Emitter<GetReviewsDataState> emit,
  ) async {
    Logger logger = Logger('_onGetSubReviewsEvent');
    if (state.subReviewStates.containsKey(event.reviewId)) {
      logger.info('has the recipe sub reviews');
    }
    emit(
      state.copyWith(subReviewStates: {event.reviewId: SubReviewsLoading()}),
    );
    try {
      final subReviews = await reviewRepository.getSubReviews(
        event.reviewId,
        event.subsRef,
      );
      logger.info('subReviews: ${subReviews.toString()}');
      subReviews.when(
        success:
            (value) => emit(
              state.copyWith(
                subReviewStates: {event.reviewId: SubReviewsSuccess(value)},
              ),
            ),
        failure:
            (error) => state.copyWith(
              subReviewStates: {
                event.reviewId: SubReviewsFailure(error.message),
              },
            ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          subReviewStates: {event.reviewId: SubReviewsFailure(e.toString())},
        ),
      );
    }
  }
}
