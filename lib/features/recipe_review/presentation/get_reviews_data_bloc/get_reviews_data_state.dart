// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_reviews_data_bloc.dart';

final class GetReviewsDataState extends Equatable {
  final Map<String, SubReviewsState>
  subReviewStates; // Track each review's state
  final bool isOverallLoading; // For global loading (if needed)

  const GetReviewsDataState({
    this.subReviewStates = const {},
    this.isOverallLoading = false,
  });

  SubReviewsState getSubReviewState(String reviewId) {
    return subReviewStates[reviewId] ?? SubReviewsInitial();
  }

  @override
  List<Object?> get props => [subReviewStates, isOverallLoading];

  GetReviewsDataState copyWith({
    Map<String, SubReviewsState>? subReviewStates,
    bool? isOverallLoading,
  }) {
    return GetReviewsDataState(
      subReviewStates: subReviewStates.letOrElse(
        (newState) => {...this.subReviewStates, ...newState},
        orElse: () => this.subReviewStates,
      ),
      isOverallLoading: isOverallLoading ?? this.isOverallLoading,
    );
  }
}
