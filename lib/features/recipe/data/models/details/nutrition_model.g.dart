// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutritionModel _$NutritionModelFromJson(Map<String, dynamic> json) =>
    NutritionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      baseUnit: MeasuringUnitModel.fromJson(
        json['baseUnit'] as Map<String, dynamic>?,
      ),
    );

Map<String, dynamic> _$NutritionModelToJson(NutritionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'baseUnit': MeasuringUnitModel.toJson(instance.baseUnit),
    };
