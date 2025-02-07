import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/recipe/domain/entities/review_entity.dart';

part 'review_model.g.dart';

typedef ReviewModels = List<ReviewModel>;

@JsonSerializable()
class ReviewModel {
  final String id;
  final String userID;
  final String? userProfilePic;
  final String userName;
  final List<String> imagesUrl;
  final double rating;
  final DateTime publishedAt;
  final String description;

  const ReviewModel(
      {required this.id,
      required this.userID,
      required this.userName,
      this.userProfilePic,
      required this.imagesUrl,
      required this.rating,
      required this.publishedAt,
      required this.description});

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
      description: entity.description);

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
      description: description);
}

extension ReviewModelEx on ReviewModels {
  Reviews toEntity() => map((element) => element.toEntity()).toList();
}
