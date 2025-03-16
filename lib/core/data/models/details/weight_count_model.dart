import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/config/extensions/object_extension.dart';
import '../../../../features/view_recipe/domain/entities/details/weight_count_entity.dart';
import 'measuring_unit_model.dart';

part 'weight_count_model.g.dart';

typedef WeightCountModels = List<WeightCountModel>;

@JsonSerializable()
class WeightCountModel {
  final String id;
  final double count;
  @JsonKey(
    fromJson: MeasuringUnitModel.fromJson,
    toJson: MeasuringUnitModel.toJson,
  )
  final MeasuringUnitModel? measuringUnit;

  const WeightCountModel({
    required this.id,
    required this.count,
    this.measuringUnit,
  });

  factory WeightCountModel.fromJson(Map<String, dynamic> json) =>
      _$WeightCountModelFromJson(json);

  factory WeightCountModel.fromEntity(WeightCount entity) => WeightCountModel(
    id: entity.id,
    count: entity.count,
    measuringUnit: entity.measuringUnit?.let(
      (value) => MeasuringUnitModel.fromEntity(value),
    ),
  );

  static WeightCountModels fromEntities(WeightCounts entities) =>
      entities.map((element) => WeightCountModel.fromEntity(element)).toList();

  Map<String, dynamic> toJson() => _$WeightCountModelToJson(this);

  WeightCount toEntity() => WeightCount(
    id: id,
    count: count,
    measuringUnit: measuringUnit?.toEntity(),
  );

  static WeightCountModels fromJsonS(List<dynamic> json) {
    return json
        .map((e) => WeightCountModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> toJsonS(
    WeightCountModels weightCountModels,
  ) {
    return weightCountModels.map((e) => e.toJson()).toList();
  }
}

extension WeightCountModelEx on WeightCountModels {
  WeightCounts toEntity() => map((element) => element.toEntity()).toList();
}
