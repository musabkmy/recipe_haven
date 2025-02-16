import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/details/utensil_entity.dart';
part 'utensil_model.g.dart';

typedef UtensilModels = List<UtensilModel>;

@JsonSerializable()
class UtensilModel {
  final String id;
  final String name;

  const UtensilModel({
    required this.id,
    required this.name,
  });

  factory UtensilModel.fromJson(Map<String, dynamic> json) =>
      _$UtensilModelFromJson(json);

  factory UtensilModel.fromEntity(Utensil entity) =>
      UtensilModel(id: entity.id, name: entity.name);

  static UtensilModels fromEntities(Utensils entities) =>
      entities.map((element) => UtensilModel.fromEntity(element)).toList();

  Map<String, dynamic> toJson() => _$UtensilModelToJson(this);

  Utensil toEntity() => Utensil(id: id, name: name);

  static UtensilModels fromJsonS(List<dynamic> json) {
    return json
        .map((e) => UtensilModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> toJsonS(UtensilModels utensilModels) {
    return utensilModels.map((e) => e.toJson()).toList();
  }
}

extension UtensilModelEx on UtensilModels {
  Utensils toEntity() => map((element) => element.toEntity()).toList();
}
