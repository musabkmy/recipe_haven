part of 'get_reviews_data_bloc.dart';

sealed class GetReviewsDataEvent extends Equatable {
  const GetReviewsDataEvent();

  @override
  List<Object> get props => [];
}

final class GetSubReviewsEvent extends GetReviewsDataEvent {
  const GetSubReviewsEvent(this.reviewId, this.subsRef);
  final String reviewId;
  final List<dynamic> subsRef;
  @override
  List<Object> get props => [reviewId];
}
