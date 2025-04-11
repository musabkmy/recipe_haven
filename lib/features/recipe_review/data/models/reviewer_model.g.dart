// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviewer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewerModel _$ReviewerModelFromJson(Map<String, dynamic> json) =>
    ReviewerModel(
      json['id'] as String,
      json['name'] as String,
      json['photoUrl'] as String?,
    );

Map<String, dynamic> _$ReviewerModelToJson(ReviewerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
    };
