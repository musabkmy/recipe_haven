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
    json['usersEngagement'] as Map<String, dynamic>,
  ),
  userData: CreatorModel.fromUser(json['userData'] as Map<String, dynamic>),
  utensils: UtensilModel.fromJsonS(json['utensils'] as List),
  details: DetailsModel.fromJson(json['details'] as Map<String, dynamic>),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  reviews: ReviewModel.fromJsonS(json['reviews'] as List),
  cookingStepsMap: CookingStepModel.fromJsonS(json['cookingStepsMap'] as List),
);

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'usersEngagement': EngagementModel.toJson(instance.usersEngagement),
      'utensils': UtensilModel.toJsonS(instance.utensils),
      'details': DetailsModel.toJson(instance.details),
      'tags': instance.tags,
      'reviews': ReviewModel.toJsonS(instance.reviews),
      'cookingStepsMap': CookingStepModel.toJsonS(instance.cookingStepsMap),
    };
