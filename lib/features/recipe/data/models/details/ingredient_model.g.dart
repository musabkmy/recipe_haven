// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) =>
    IngredientModel(
      id: json['id'] as String,
      name: json['name'] as String,
      baseUnit: json['baseUnit'] == null
          ? null
          : MeasuringUnitModel.fromJson(
              json['baseUnit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IngredientModelToJson(IngredientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'baseUnit': instance.baseUnit,
    };
