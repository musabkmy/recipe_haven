import 'package:json_annotation/json_annotation.dart';

part 'create_review_model.g.dart';

@JsonSerializable(createFactory: false)
class CreateReviewModel {
  final dynamic userRef;
  final String comment;
  final List<String> imagesUrl;
  @JsonKey(includeToJson: false)
  final String recipeId;
  final List<dynamic> subsRef;
  double? rating;
  // final DateTime publishedAt;

  CreateReviewModel._({
    required this.userRef,
    required this.comment,
    // required this.publishedAt,
    required this.imagesUrl,
    required this.recipeId,
    required this.subsRef,
  });

  factory CreateReviewModel.fromRecipeReview({
    required dynamic userRef,
    required String comment,
    required List<String> imagesUrl,
    required String recipeId,
  }) {
    return CreateReviewModel._(
      subsRef: [],
      userRef: userRef,
      comment: comment,
      imagesUrl: imagesUrl,
      recipeId: recipeId,
    );
  }

  Map<String, dynamic> toJson() => _$CreateReviewModelToJson(this);
}
