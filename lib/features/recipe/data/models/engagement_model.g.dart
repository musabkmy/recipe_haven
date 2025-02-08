// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engagement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngagementModel _$EngagementModelFromJson(Map<String, dynamic> json) =>
    EngagementModel(
      rating: (json['rating'] as num).toDouble(),
      ratingCount: (json['ratingCount'] as num).toDouble(),
      likesCount: (json['likesCount'] as num).toInt(),
    );

Map<String, dynamic> _$EngagementModelToJson(EngagementModel instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'likesCount': instance.likesCount,
    };
