// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:recipe_haven/config/extensions/object_extension.dart';

import '../../../domain/entities/details/ingredient_entity.dart';
import 'measuring_unit_model.dart';

part 'ingredient_model.g.dart';

typedef IngredientModels = List<IngredientModel>;

@JsonSerializable()
class IngredientModel {
  final String id;
  final String name;
  @JsonKey(
    fromJson: MeasuringUnitModel.fromJson,
    toJson: MeasuringUnitModel.toJson,
  )
  final MeasuringUnitModel? baseUnit; // Nullable

  const IngredientModel({required this.id, required this.name, this.baseUnit});

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);

  factory IngredientModel.fromEntity(Ingredient entity) => IngredientModel(
    id: entity.id,
    name: entity.name,
    baseUnit: entity.baseUnit?.let(
      (value) => MeasuringUnitModel.fromEntity(value),
    ),
  );

  static IngredientModels fromEntities(Ingredients entities) =>
      entities.map((element) => IngredientModel.fromEntity(element)).toList();

  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);

  Ingredient toEntity() =>
      Ingredient(id: id, name: name, baseUnit: baseUnit?.toEntity());

  static IngredientModels fromJsonS(List<dynamic> json) {
    return json
        .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> toJsonS(IngredientModels ingredientModels) {
    return ingredientModels.map((e) => e.toJson()).toList();
  }

  @override
  String toString() =>
      'IngredientModel(id: $id, name: $name, baseUnit: $baseUnit)';
}

extension IngredientModelEx on IngredientModels {
  Ingredients toEntity() => map((element) => element.toEntity()).toList();
}
