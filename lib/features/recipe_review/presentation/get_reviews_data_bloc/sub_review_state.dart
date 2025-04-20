part of 'get_reviews_data_bloc.dart';

sealed class SubReviewsState extends Equatable {
  const SubReviewsState();
  @override
  List<Object?> get props => [];
}

class SubReviewsInitial extends SubReviewsState {}

class SubReviewsLoading extends SubReviewsState {}

class SubReviewsSuccess extends SubReviewsState {
  final SubReviewsMap subReviewsMap;
  const SubReviewsSuccess(this.subReviewsMap);
  @override
  List<Object?> get props => [subReviewsMap];
}

class SubReviewsFailure extends SubReviewsState {
  final String error;
  const SubReviewsFailure(this.error);
  @override
  List<Object?> get props => [error];
}
