// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:recipe_haven/features/recipe_review/domain/entities/review_entity.dart';

part 'review_model.g.dart';

typedef ReviewModels = List<ReviewModel>;

//TODO: remove toJson when full migrate reviews to a feature
@JsonSerializable()
class ReviewModel {
  final String id;
  final String userID;
  final String? userProfilePic;
  final String userName;
  final List<String> imagesUrl;
  final double? rating;
  //change to hard typed
  //Ex: a month ago, a year ago
  final DateTime publishedAt;
  final String description;

  const ReviewModel({
    required this.id,
    required this.userID,
    required this.userName,
    this.userProfilePic,
    required this.imagesUrl,
    required this.rating,
    required this.publishedAt,
    required this.description,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  factory ReviewModel.fromEntity(Review entity) => ReviewModel(
    id: entity.id,
    userID: entity.userID,
    userName: entity.userName,
    userProfilePic: entity.userProfilePic,
    imagesUrl: entity.imagesUrl,
    rating: entity.rating,
    publishedAt: entity.publishedAt,
    description: entity.description,
  );

  static ReviewModels fromEntities(Reviews entities) =>
      entities.map((element) => ReviewModel.fromEntity(element)).toList();

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  Review toEntity() => Review(
    id: id,
    userID: userID,
    userName: userName,
    userProfilePic: userProfilePic,
    imagesUrl: imagesUrl,
    rating: rating,
    publishedAt: publishedAt,
    description: description,
  );

  static ReviewModels fromJsonS(List<dynamic> json) {
    return json
        .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> toJsonS(ReviewModels reviewModels) {
    return reviewModels.map((e) => e.toJson()).toList();
  }

  @override
  String toString() {
    return 'ReviewModel(id: $id, userID: $userID, userProfilePic: $userProfilePic, userName: $userName, imagesUrl: $imagesUrl, rating: $rating, publishedAt: $publishedAt, description: $description)';
  }
}

extension ReviewModelEx on ReviewModels {
  Reviews toEntity() => map((element) => element.toEntity()).toList();
}
