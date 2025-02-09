import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/features/recipe/domain/entities/recipe_entity.dart';

part 'recipe_info_event.dart';
part 'recipe_info_state.dart';

@singleton
class RecipeInfoBloc extends Bloc<RecipeInfoEvent, RecipeInfoState> {
  RecipeInfoBloc() : super(RecipeInfoInitial()) {
    on<RecipeInfoEvent>((event, emit) {
      debugPrint('in RecipeInfoEvent');
    });
    on<RecipeLoadEvent>(onLoadRecipe);
  }

  void onLoadRecipe(RecipeLoadEvent event, Emitter<RecipeInfoState> emit) {
    emit(RecipeInfoSuccess(event.recipe));
  }
}
