import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart' show XFile;
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/features/recipe_review/data/models/create_review_model.dart';
import 'package:recipe_haven/features/recipe_review/domain/repositories/repositories.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/entities.dart';

part 'create_review_event.dart';
part 'create_review_state.dart';

@lazySingleton
class CreateReviewBloc extends Bloc<CreateReviewEvent, CreateReviewState> {
  final ReviewRepository reviewRepository;
  final UploadReviewImagesRepository uploadRepository;
  CreateReviewBloc(this.reviewRepository, this.uploadRepository)
    : super(CreateReviewInitial()) {
    // on<CreateReviewEvent>((event, emit) {});
    on<PreviousState>(_onPreviousState);
    on<AddComment>(_onAddComment);
    on<AddImage>(_onAddImage);
    on<RemoveImage>(_onRemoveImage);
    on<AddRecipeReview>(_onAddRecipeReview);
  }

  void _onPreviousState(PreviousState event, Emitter<CreateReviewState> emit) {
    (state) => switch (state) {
      CreateReviewFailure failure => emit(failure.previousState!),
      CreateReviewSuccess _ => emit(CreateReviewInitial()),
      _ => null,
    };
  }

  void _onAddComment(AddComment event, Emitter<CreateReviewState> emit) {
    Logger logger = Logger('_onAddComment');
    if (state case CreateReviewInitial state) {
      logger.info('add: ${event.comment}');
      final newState = state.copyWith(comment: event.comment);
      emit(newState);
    } else {
      emit(CreateReviewInitial(comment: event.comment));
    }
  }

  void _onAddImage(AddImage event, Emitter<CreateReviewState> emit) {
    if (state case CreateReviewInitial state) {
      final newState = state.addImage(event.image);
      emit(newState);
    } else {
      emit(CreateReviewInitial(images: [event.image]));
    }
  }

  void _onRemoveImage(RemoveImage event, Emitter<CreateReviewState> emit) {
    if (state case CreateReviewInitial state) {
      final newState = state.removeImage(event.removeImage.path);
      emit(newState);
    }
  }

  Future<void> _onAddRecipeReview(
    AddRecipeReview event,
    Emitter<CreateReviewState> emit,
  ) async {
    Logger logger = Logger('_onAddRecipeReview');
    if (state case CreateReviewInitial state) {
      final previousState = state;
      emit(CreateReviewLoading());

      // await Future.delayed(Duration(seconds: 1));
      try {
        if (state.comment == null) {
          emit(CreateReviewFailure(previousState, 'add a comment'));
        } else {
          final uploadResult = await _uploadImages(
            event.recipeRef.toString(),
            state.images,
          );
          if (uploadResult.isFailure) {
            emit(CreateReviewFailure(state, 'unable to upload'));
          } else {
            final review = CreateReviewModel.fromRecipeReview(
              userRef: event.userRef,
              comment: state.comment!,
              imagesUrl: uploadResult.successData,
              recipeRef: event.recipeRef,
            );
            final result = await reviewRepository.addRecipeReview(review);
            result.when(
              success: (value) => emit(CreateReviewSuccess(value)),
              failure:
                  (error) =>
                      emit(CreateReviewFailure(previousState, error.message)),
            );
          }
        }
      } catch (e) {
        emit(CreateReviewFailure(previousState, e.toString()));
      }
    } else {
      emit(CreateReviewFailure(state, 'unexpected error occurred'));
    }
  }

  Future<GetUploadedImageUrl> _uploadImages(
    String id,
    List<XFile>? imagesFile,
  ) async {
    if (imagesFile != null && imagesFile.isNotEmpty) {
      try {
        final imagesUrl = await uploadRepository.uploadImages(id, imagesFile);
        return imagesUrl;
      } catch (e) {
        return Future.value(Failure(UploadException(e.toString())));
      }
    } else {
      return Future.value(Success(<String>[]));
    }
  }
}
