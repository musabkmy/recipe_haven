import 'package:json_annotation/json_annotation.dart';

part 'create_review_model.g.dart';

enum ReviewType { recipeReview, recipeReply }

@JsonSerializable(createFactory: false)
class CreateReviewModel {
  final String userRef;
  final String comment;
  final List<String> imagesUrl;
  final dynamic recipeRef;
  final List<dynamic> parentReviewRef;
  final double? rating;
  final ReviewType reviewType;
  // final DateTime publishedAt;

  CreateReviewModel._({
    required this.userRef,
    required this.comment,
    // required this.publishedAt,
    required this.imagesUrl,
    required this.recipeRef,
    required this.reviewType,
    required this.parentReviewRef,
  }) : assert(
         reviewType == ReviewType.recipeReply
             ? parentReviewRef.isNotEmpty
             : parentReviewRef.isEmpty,
       ),
       rating = null;

  factory CreateReviewModel.fromRecipeReview({
    required dynamic userRef,
    required String comment,
    required List<String> imagesUrl,
    required dynamic recipeRef,
  }) {
    return CreateReviewModel._(
      reviewType: ReviewType.recipeReview,
      parentReviewRef: [],
      userRef: userRef,
      comment: comment,
      imagesUrl: imagesUrl,
      recipeRef: recipeRef,
    );
  }

  //TODO: to json
  //TODO: factory CreateReviewModel.fromReviewReply
}
