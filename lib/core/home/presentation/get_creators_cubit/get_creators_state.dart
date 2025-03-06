part of 'get_creators_cubit.dart';

sealed class GetCreatorsState extends Equatable {
  const GetCreatorsState();

  @override
  List<Object> get props => [];
}

final class GetCreatorsInitial extends GetCreatorsState {}

final class GetCreatorsLoading extends GetCreatorsState {}

final class GetCreatorsSuccess extends GetCreatorsState {
  final Creators creators;

  const GetCreatorsSuccess(this.creators);
  @override
  List<Object> get props => [creators];
}

final class GetCreatorsFailure extends GetCreatorsState {
  final String errorMsg;
  const GetCreatorsFailure(this.errorMsg);
  @override
  List<Object> get props => [errorMsg];
}
