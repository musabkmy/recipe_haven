import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/details/measuring_unit_entity.dart';

part 'measuring_unit_model.g.dart';

typedef MeasuringUnitModels = List<MeasuringUnitModel>;

@JsonSerializable()
class MeasuringUnitModel {
  final String name;
  final String abbreviation;

  const MeasuringUnitModel({
    required this.name,
    required this.abbreviation,
  });
  factory MeasuringUnitModel.fromJson(Map<String, dynamic> json) =>
      _$MeasuringUnitModelFromJson(json);

  factory MeasuringUnitModel.fromEntity(MeasuringUnit entity) =>
      MeasuringUnitModel(name: entity.name, abbreviation: entity.abbreviation);

  static MeasuringUnitModels fromEntities(MeasuringUnits entities) => entities
      .map((element) => MeasuringUnitModel.fromEntity(element))
      .toList();

  Map<String, dynamic> toJson() => _$MeasuringUnitModelToJson(this);

  MeasuringUnit toEntity() =>
      MeasuringUnit(name: name, abbreviation: abbreviation);
}

extension MeasuringUnitModelEx on MeasuringUnitModels {
  MeasuringUnits toEntity() => map((element) =>
          MeasuringUnit(name: element.name, abbreviation: element.abbreviation))
      .toList();
}
