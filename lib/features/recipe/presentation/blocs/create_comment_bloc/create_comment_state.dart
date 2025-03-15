part of 'create_comment_bloc.dart';

sealed class CreateCommentState extends Equatable {
  const CreateCommentState();

  @override
  List<Object?> get props => [];
}

final class CreateCommentInitial extends CreateCommentState {
  const CreateCommentInitial({this.comment, this.images});
  final String? comment;
  final List<File>? images;

  CreateCommentInitial _copyWith({String? comment, List<File>? images}) {
    return CreateCommentInitial(
      comment: comment ?? comment,
      images: images ?? images,
    );
  }

  CreateCommentInitial addComment(String comment) {
    return _copyWith(comment: comment);
  }

  CreateCommentInitial addImage(File image) {
    return _copyWith(
      images: images.letOrElse(
        (images) => [...images, image],
        orElse: () => [image],
      ),
    );
  }

  CreateCommentInitial removeImage(String imagePath) {
    // Logger logger = Logger('removeImage');
    // logger.info('remove: $imagePath');
    return _copyWith(
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
