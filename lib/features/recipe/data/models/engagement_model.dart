import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/recipe/domain/entities/engagement_entity.dart';

part 'engagement_model.g.dart';

@JsonSerializable()
class EngagementModel {
  final double rating;
  final int ratingCount;
  final double likesCount;

  const EngagementModel(
      {required this.rating,
      required this.ratingCount,
      required this.likesCount});

  factory EngagementModel.fromJson(Map<String, dynamic> json) =>
      _$EngagementModelFromJson(json);

  Map<String, dynamic> toJson() => _$EngagementModelToJson(this);

  Engagement toEntity() => Engagement(
      rating: rating, ratingCount: ratingCount, likesCount: likesCount);
}
