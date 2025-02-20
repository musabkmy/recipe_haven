// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      usersEngagement: EngagementModel.fromJson(
          json['usersEngagement'] as Map<String, dynamic>),
      creator: CreatorModel.fromJson(json['creator'] as Map<String, dynamic>),
      utensils: (json['utensils'] as List<dynamic>)
          .map((e) => UtensilModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      details: DetailsModel.fromJson(json['details'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      CookingStepsMap: (json['CookingStepsMap'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : CookingStepModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'usersEngagement': instance.usersEngagement,
      'creator': instance.creator,
      'utensils': instance.utensils,
      'details': instance.details,
      'tags': instance.tags,
      'reviews': instance.reviews,
      'CookingStepsMap': instance.CookingStepsMap,
    };
