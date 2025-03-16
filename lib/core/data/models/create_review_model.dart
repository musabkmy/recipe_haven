import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/user/domain/entities/user_data_entity.dart';

part 'create_review_model.g.dart';

enum ReviewType { recipeReview, recipeReply }

@JsonSerializable(createFactory: false)
class CreateReviewModel {
  final String userID;
  final String? userPhotoUrl;
  final String userName;
  final String comment;
  final List<String> imagesUrl;
  final dynamic recipeRef;
  final List<dynamic> parentReviewRef;
  final double? rating;
  final ReviewType reviewType;
  // final DateTime publishedAt;

  CreateReviewModel._({
    required this.userID,
    required this.userPhotoUrl,
    required this.userName,
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
    required UserData userData,
    required String comment,
    required List<String> imagesUrl,
    required dynamic recipeRef,
  }) {
    return CreateReviewModel._(
      reviewType: ReviewType.recipeReview,
      parentReviewRef: [],
      userID: userData.id,
      userPhotoUrl: userData.photoUrl,
      userName: userData.name,
      comment: comment,
      imagesUrl: imagesUrl,
      recipeRef: recipeRef,
    );
  }

  //TODO: factory CreateReviewModel.fromReviewReply
}
