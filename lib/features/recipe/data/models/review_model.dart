import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

typedef ReviewModels = List<ReviewModel>;

@JsonSerializable()
class ReviewModel {
  final String id;
  final String userID;
  final String userName;
  final List<String> imagesUrl;
  final double rating;
  final DateTime publishedAt;
  final String description;

  const ReviewModel(
      {required this.id,
      required this.userID,
      required this.userName,
      required this.imagesUrl,
      required this.rating,
      required this.publishedAt,
      required this.description});

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
