// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:recipe_haven/features/view_recipe/domain/entities/engagement_entity.dart';

part 'engagement_model.g.dart';

@JsonSerializable()
class EngagementModel {
  final double rating;
  final double ratingCount;
  final int likesCount;

  const EngagementModel({
    required this.rating,
    required this.ratingCount,
    required this.likesCount,
  });

  factory EngagementModel.fromJson(Map<String, dynamic> json) =>
      _$EngagementModelFromJson(json);

  factory EngagementModel.fromEntity(Engagement entity) => EngagementModel(
    rating: entity.rating,
    ratingCount: entity.ratingCount,
    likesCount: entity.likesCount,
  );

  // Map<String, dynamic> toJson() => _$EngagementModelToJson(this);

  static Map<String, dynamic> toJson(EngagementModel instance) {
    return _$EngagementModelToJson(instance);
  }

  Engagement toEntity() => Engagement(
    rating: rating,
    ratingCount: ratingCount,
    likesCount: likesCount,
  );

  @override
  String toString() =>
      'EngagementModel(rating: $rating, ratingCount: $ratingCount, likesCount: $likesCount)';
}
