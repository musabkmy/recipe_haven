// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portion_based_recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortionBasedRecipeModel _$PortionBasedRecipeModelFromJson(
  Map<String, dynamic> json,
) => PortionBasedRecipeModel(
  id: json['id'] as String,
  minPortionCount: (json['minPortionCount'] as num?)?.toInt(),
  maxPortionCount: (json['maxPortionCount'] as num?)?.toInt(),
  portionCount: (json['portionCount'] as num?)?.toInt(),
  difficulty: json['difficulty'] as String,
  preparationHumanTime: json['preparationHumanTime'] as String?,
  bakingHumanTime: json['bakingHumanTime'] as String?,
  restingHumanTime: json['restingHumanTime'] as String?,
  ingredients: WeightCountModel.fromJsonS(json['ingredients'] as List),
  nutritious: WeightCountModel.fromJsonS(json['nutritious'] as List),
);

Map<String, dynamic> _$PortionBasedRecipeModelToJson(
  PortionBasedRecipeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'minPortionCount': instance.minPortionCount,
  'maxPortionCount': instance.maxPortionCount,
  'portionCount': instance.portionCount,
  'difficulty': instance.difficulty,
  'preparationHumanTime': instance.preparationHumanTime,
  'bakingHumanTime': instance.bakingHumanTime,
  'restingHumanTime': instance.restingHumanTime,
  'ingredients': WeightCountModel.toJsonS(instance.ingredients),
  'nutritious': WeightCountModel.toJsonS(instance.nutritious),
};
