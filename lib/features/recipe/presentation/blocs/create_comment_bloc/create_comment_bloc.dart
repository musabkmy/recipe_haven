import 'dart:io' show File;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';

part 'create_comment_event.dart';
part 'create_comment_state.dart';

class CreateCommentBloc extends Bloc<CreateCommentEvent, CreateCommentState> {
  CreateCommentBloc() : super(CreateCommentInitial()) {
    on<CreateCommentEvent>((event, emit) {});
    on<AddComment>(_onAddComment);
    on<AddImage>(_onAddImage);
    on<RemoveImage>(_onRemoveImage);
  }

  void _onAddComment(AddComment event, Emitter<CreateCommentState> emit) {
    if (state case CreateCommentInitial state) {
      final newState = state.addComment(event.comment);
      emit(newState);
    } else {
      emit(CreateCommentInitial(comment: event.comment));
    }
  }

  void _onAddImage(AddImage event, Emitter<CreateCommentState> emit) {
    if (state case CreateCommentInitial state) {
      final newState = state.addImage(event.image);
      emit(newState);
    } else {
      emit(CreateCommentInitial(images: [event.image]));
    }
  }

  void _onRemoveImage(RemoveImage event, Emitter<CreateCommentState> emit) {
    if (state case CreateCommentInitial state) {
      final newState = state.removeImage(event.removeImage.path);
      emit(newState);
    }
  }
}
