// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooking_step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CookingStepModel _$CookingStepModelFromJson(Map<String, dynamic> json) =>
    CookingStepModel(
      stepNumber: (json['stepNumber'] as num).toInt(),
      ingredientsID: (json['ingredientsID'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      utensilsID: (json['utensilsID'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imagesUrl:
          (json['imagesUrl'] as List<dynamic>).map((e) => e as String).toList(),
      fontSize: $enumDecode(_$FontSizeEnumMap, json['fontSize']),
      paragraph: json['paragraph'] as String,
    );

Map<String, dynamic> _$CookingStepModelToJson(CookingStepModel instance) =>
    <String, dynamic>{
      'stepNumber': instance.stepNumber,
      'ingredientsID': instance.ingredientsID,
      'utensilsID': instance.utensilsID,
      'imagesUrl': instance.imagesUrl,
      'fontSize': _$FontSizeEnumMap[instance.fontSize]!,
      'paragraph': instance.paragraph,
    };

const _$FontSizeEnumMap = {
  FontSize.small: 'small',
  FontSize.medium: 'medium',
  FontSize.large: 'large',
};
