part of 'get_tags_cubit.dart';

sealed class GetTagsState extends Equatable {
  const GetTagsState();

  @override
  List<Object> get props => [];
}

final class GetTagsInitial extends GetTagsState {}

final class GetTagsLoading extends GetTagsState {}

final class GetTagsSuccess extends GetTagsState {
  final Tags tags;
  const GetTagsSuccess(this.tags);
  @override
  List<Object> get props => [tags];
}

final class GetTagsFailure extends GetTagsState {
  final String message;
  const GetTagsFailure(this.message);
  @override
  List<Object> get props => [message];
}
