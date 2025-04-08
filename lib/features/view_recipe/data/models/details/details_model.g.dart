// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsModel _$DetailsModelFromJson(Map<String, dynamic> json) => DetailsModel(
  baseIngredients: IngredientModel.fromJsonS(json['baseIngredients'] as List),
  baseNutritious: NutritionModel.fromJsonS(json['baseNutritious'] as List),
  servings: PortionBasedRecipeModel.fromJsonS(json['servings'] as List),
  defaultPortionBasedRecipeID: json['defaultPortionBasedRecipeID'] as String,
);

Map<String, dynamic> _$DetailsModelToJson(DetailsModel instance) =>
    <String, dynamic>{
      'baseIngredients': IngredientModel.toJsonS(instance.baseIngredients),
      'baseNutritious': NutritionModel.toJsonS(instance.baseNutritious),
      'servings': PortionBasedRecipeModel.toJsonS(instance.servings),
      'defaultPortionBasedRecipeID': instance.defaultPortionBasedRecipeID,
    };
