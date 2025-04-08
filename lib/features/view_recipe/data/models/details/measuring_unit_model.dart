import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/details/measuring_unit_entity.dart';

part 'measuring_unit_model.g.dart';

typedef MeasuringUnitModels = List<MeasuringUnitModel>;

@JsonSerializable()
class MeasuringUnitModel {
  final String name;
  final String abbreviation;

  const MeasuringUnitModel({required this.name, required this.abbreviation});

  factory MeasuringUnitModel.empty() {
    return MeasuringUnitModel(name: '', abbreviation: '');
  }
  factory MeasuringUnitModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      _$MeasuringUnitModelFromJson(json);
    }
    return MeasuringUnitModel.empty();
  }

  factory MeasuringUnitModel.fromEntity(MeasuringUnit entity) =>
      MeasuringUnitModel(name: entity.name, abbreviation: entity.abbreviation);

  static MeasuringUnitModels fromEntities(MeasuringUnits entities) =>
      entities
          .map((element) => MeasuringUnitModel.fromEntity(element))
          .toList();

  static Map<String, dynamic>? toJson(MeasuringUnitModel? instance) {
    if (instance != null) {
      return _$MeasuringUnitModelToJson(instance);
    }
    return null;
  }

  MeasuringUnit toEntity() =>
      MeasuringUnit(name: name, abbreviation: abbreviation);

  //  static MeasuringUnitModels fromJsonS(List<dynamic> json) {
  //   return json
  //       .map((e) => MeasuringUnitModel.fromJson(e as Map<String, dynamic>))
  //       .toList();
  // }

  // static List<Map<String, dynamic>> toJsonS(MeasuringUnitModels measuringUnitModels) {
  //   return measuringUnitModels.map(MeasuringUnitModel.toJson).toList();
  // }
}

// extension MeasuringUnitModelEx on MeasuringUnitModels {
//   MeasuringUnits toEntity() => map((element) =>
//           MeasuringUnit(name: element.name, abbreviation: element.abbreviation))
//       .toList();
// }
