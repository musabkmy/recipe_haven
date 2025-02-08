import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/config/extensions/object_extensions.dart';
import '../../../domain/entities/details/nutrition_entity.dart';
import 'measuring_unit_model.dart';

part 'nutrition_model.g.dart';

typedef NutritionModels = List<NutritionModel>;

@JsonSerializable()
class NutritionModel {
  final String id;
  final String name;
  final MeasuringUnitModel? baseUnit;

  const NutritionModel({required this.id, required this.name, this.baseUnit});

  factory NutritionModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionModelFromJson(json);

  factory NutritionModel.fromEntity(Nutrition entity) => NutritionModel(
      id: entity.id,
      name: entity.name,
      baseUnit: entity.baseUnit
          ?.let((value) => MeasuringUnitModel.fromEntity(value)));

  static NutritionModels fromEntities(Nutritious entities) =>
      entities.map((element) => NutritionModel.fromEntity(element)).toList();

  Map<String, dynamic> toJson() => _$NutritionModelToJson(this);

  Nutrition toEntity() =>
      Nutrition(id: id, name: name, baseUnit: baseUnit?.toEntity());
}

extension NutritionModelEx on NutritionModels {
  Nutritious toEntity() => map((element) => element.toEntity()).toList();
}
