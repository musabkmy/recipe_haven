// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portion_based_recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortionBasedRecipeModel _$PortionBasedRecipeModelFromJson(
        Map<String, dynamic> json) =>
    PortionBasedRecipeModel(
      id: json['id'] as String,
      minPortionCount: (json['minPortionCount'] as num?)?.toInt(),
      maxPortionCount: (json['maxPortionCount'] as num?)?.toInt(),
      portionCount: (json['portionCount'] as num?)?.toInt(),
      difficulty: $enumDecode(_$DifficultyEnumMap, json['difficulty']),
      preparationHumanTime: json['preparationHumanTime'] as String,
      bakingHumanTime: json['bakingHumanTime'] as String,
      restingHumanTime: json['restingHumanTime'] as String,
      utensils: (json['utensils'] as List<dynamic>)
          .map((e) => UtensilModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => WeightCountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nutritious: (json['nutritious'] as List<dynamic>)
          .map((e) => WeightCountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PortionBasedRecipeModelToJson(
        PortionBasedRecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'minPortionCount': instance.minPortionCount,
      'maxPortionCount': instance.maxPortionCount,
      'portionCount': instance.portionCount,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
      'preparationHumanTime': instance.preparationHumanTime,
      'bakingHumanTime': instance.bakingHumanTime,
      'restingHumanTime': instance.restingHumanTime,
      'utensils': instance.utensils,
      'ingredients': instance.ingredients,
      'nutritious': instance.nutritious,
    };

const _$DifficultyEnumMap = {
  Difficulty.easy: 'easy',
  Difficulty.medium: 'medium',
  Difficulty.hard: 'hard',
  Difficulty.unknown: 'unknown',
};
