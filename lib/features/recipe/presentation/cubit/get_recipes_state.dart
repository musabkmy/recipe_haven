part of 'get_recipes_cubit.dart';

sealed class GetRecipesState extends Equatable {
  const GetRecipesState();

  @override
  List<Object> get props => [];
}

final class GetRecipesInitial extends GetRecipesState {}
