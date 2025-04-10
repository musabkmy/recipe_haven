part of 'create_review_bloc.dart';

sealed class CreateReviewEvent extends Equatable {
  const CreateReviewEvent();

  @override
  List<Object> get props => [];
}

final class PreviousState extends CreateReviewEvent {}

final class AddImage extends CreateReviewEvent {
  const AddImage(this.image);
  final XFile image;
  @override
  List<Object> get props => [image];
}

final class RemoveImage extends CreateReviewEvent {
  const RemoveImage(this.removeImage);
  final XFile removeImage;
  @override
  List<Object> get props => [removeImage];
}

final class AddComment extends CreateReviewEvent {
  const AddComment(this.comment);
  final String comment;
  @override
  List<Object> get props => [comment];
}

final class AddRecipeReview extends CreateReviewEvent {
  const AddRecipeReview(this.userRef, this.recipeRef);
  final dynamic userRef;
  final dynamic recipeRef;

  @override
  List<Object> get props => [userRef, recipeRef];
}
