part of 'create_comment_bloc.dart';

sealed class CreateCommentEvent extends Equatable {
  const CreateCommentEvent();

  @override
  List<Object> get props => [];
}

final class AddImage extends CreateCommentEvent {
  const AddImage(this.image);
  final File image;
  @override
  List<Object> get props => [image];
}

final class RemoveImage extends CreateCommentEvent {
  const RemoveImage(this.removeImage);
  final File removeImage;
  @override
  List<Object> get props => [removeImage];
}

final class AddComment extends CreateCommentEvent {
  const AddComment(this.comment);
  final String comment;
  @override
  List<Object> get props => [comment];
}
