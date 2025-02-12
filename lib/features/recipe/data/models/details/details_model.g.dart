// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsModel _$DetailsModelFromJson(Map<String, dynamic> json) => DetailsModel(
      baseIngredients: (json['baseIngredients'] as List<dynamic>)
          .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseNutritious: (json['baseNutritious'] as List<dynamic>)
          .map((e) => NutritionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      servings: (json['servings'] as List<dynamic>)
          .map((e) =>
              PortionBasedRecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultPortionBasedRecipeID:
          json['defaultPortionBasedRecipeID'] as String,
    );

Map<String, dynamic> _$DetailsModelToJson(DetailsModel instance) =>
    <String, dynamic>{
      'baseIngredients': instance.baseIngredients,
      'baseNutritious': instance.baseNutritious,
      'servings': instance.servings,
      'defaultPortionBasedRecipeID': instance.defaultPortionBasedRecipeID,
    };
