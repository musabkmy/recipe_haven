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
      details: DetailsModel.fromJson(json['details'] as Map<String, dynamic>),
      baseUtils: (json['baseUtils'] as List<dynamic>)
          .map((e) => UtensilModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cookingSteps: (json['cookingSteps'] as List<dynamic>)
          .map((e) => CookingStepModel.fromJson(e as Map<String, dynamic>))
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
      'details': instance.details,
      'baseUtils': instance.baseUtils,
      'tags': instance.tags,
      'reviews': instance.reviews,
      'cookingSteps': instance.cookingSteps,
    };
