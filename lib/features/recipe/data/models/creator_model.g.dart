// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatorModel _$CreatorModelFromJson(Map<String, dynamic> json) => CreatorModel(
  id: json['id'] as String,
  name: json['name'] as String,
  profilePic: json['profilePic'] as String,
  profession: json['profession'] as String,
  portfolioLink: json['portfolioLink'] as String,
);

Map<String, dynamic> _$CreatorModelToJson(CreatorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePic': instance.profilePic,
      'profession': instance.profession,
      'portfolioLink': instance.portfolioLink,
    };
