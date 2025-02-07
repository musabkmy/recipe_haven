import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_recipes_state.dart';

class GetRecipesCubit extends Cubit<GetRecipesState> {
  GetRecipesCubit() : super(GetRecipesInitial());
}
