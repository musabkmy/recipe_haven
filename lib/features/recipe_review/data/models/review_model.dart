import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/config/firestore_config/convertors.dart';
import 'package:recipe_haven/features/recipe_review/data/models/review_base_model.dart';
import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart';
import 'package:recipe_haven/features/recipe_review/data/models/sub_review_model.dart';

import 'package:recipe_haven/features/recipe_review/domain/entities/review_entity.dart';

part 'review_model.g.dart';

typedef ReviewModels = List<ReviewModel>;

@JsonSerializable(createToJson: false)
class ReviewModel extends ReviewBaseModel {
  final List<String> imagesUrl;
  final List<dynamic> subsRef;
  @JsonKey(includeFromJson: false)
  final SubReviewModelMaps subReviews;
  final double? rating;

  ReviewModel({
    required String id,
    required ReviewerModel reviewerModel,
    required dynamic publishedAt,
    required String comment,
    required this.imagesUrl,
    required this.rating,
    this.subsRef = const [],
    this.subReviews = const {},
  }) : super(
         id,
         reviewerModel,
         publishedAt is Timestamp
             ? Convertors.fromTimestamp(publishedAt)
             : publishedAt,
         comment,
       );

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  factory ReviewModel.fromEntity(Review entity) => ReviewModel(
    id: entity.id,
    reviewerModel: ReviewerModel.fromReviewEntity(entity),
    publishedAt: Convertors.toTimestamp(entity.publishedAt),
    comment: entity.comment,
    imagesUrl: entity.imagesUrl,
    rating: entity.rating,
    subsRef: [],
  );

  static ReviewModels fromEntities(Reviews entities) =>
      entities.map((element) => ReviewModel.fromEntity(element)).toList();

  // Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  Review toEntity() => Review(
    id: id,
    userID: reviewerModel.id,
    userName: reviewerModel.name,
    userProfilePic: reviewerModel.photoUrl,
    imagesUrl: imagesUrl,
    rating: rating,
    publishedAt: publishedAt,
    comment: comment,
  );

  static ReviewModels fromJsonS(List<dynamic> json) {
    return json
        .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // static List<Map<String, dynamic>> toJsonS(ReviewModels reviewModels) {
  //   return reviewModels.map((e) => e.toJson()).toList();
  // }

  @override
  String toString() {
    return 'ReviewModel(id: $id, reviewerModel: ${reviewerModel.toString()}, imagesUrl: $imagesUrl, rating: $rating, publishedAt: $publishedAt, comment: $comment)';
  }
}

extension ReviewModelEx on ReviewModels {
  Reviews toEntity() => map((element) => element.toEntity()).toList();
}
