// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightCountModel _$WeightCountModelFromJson(Map<String, dynamic> json) =>
    WeightCountModel(
      id: json['id'] as String,
      count: (json['count'] as num).toDouble(),
      measuringUnit: json['measuringUnit'] == null
          ? null
          : MeasuringUnitModel.fromJson(
              json['measuringUnit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeightCountModelToJson(WeightCountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'measuringUnit': instance.measuringUnit,
    };
