part of 'create_review_bloc.dart';

sealed class CreateReviewState extends Equatable {
  const CreateReviewState(this.previousState);
  final CreateReviewState? previousState;

  @override
  List<Object?> get props => [previousState];
}

final class CreateReviewInitial extends CreateReviewState {
  const CreateReviewInitial({this.comment, this.images, this.isLoading = false})
    : super(null);
  final String? comment;
  final List<File>? images;
  final bool isLoading;

  CreateReviewInitial copyWith({
    String? comment,
    List<File>? images,
    bool? isLoading,
  }) {
    return CreateReviewInitial(
      comment: comment ?? comment,
      images: images ?? images,
      isLoading: isLoading ?? false,
    );
  }

  CreateReviewInitial addImage(File image) {
    return copyWith(
      images: images.letOrElse(
        (images) => [...images, image],
        orElse: () => [image],
      ),
    );
  }

  CreateReviewInitial removeImage(String imagePath) {
    // Logger logger = Logger('removeImage');
    // logger.info('remove: $imagePath');
    return copyWith(
      images: images.letOrElse((images) {
        final List<File> newImages = List.from(images)
          ..removeWhere((element) => element.path == imagePath);
        return newImages;
      }, orElse: () => images),
    );
  }

  @override
  List<Object?> get props => [comment, images];
}

final class CreateReviewFailure extends CreateReviewState {
  const CreateReviewFailure(super.previousState, this.message);
  final String message;
  @override
  List<Object?> get props => [previousState, message];
}

final class CreateReviewSuccess extends CreateReviewState {
  const CreateReviewSuccess(this.addedReview) : super(null);
  final Review addedReview;
  @override
  List<Object?> get props => [addedReview];
}
