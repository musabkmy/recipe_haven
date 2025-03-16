// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/details/details_entity.dart';
import 'models_details.dart';

part 'details_model.g.dart';

@JsonSerializable()
class DetailsModel {
  @JsonKey(fromJson: IngredientModel.fromJsonS, toJson: IngredientModel.toJsonS)
  final IngredientModels baseIngredients;
  @JsonKey(fromJson: NutritionModel.fromJsonS, toJson: NutritionModel.toJsonS)
  final NutritionModels baseNutritious;
  @JsonKey(
    fromJson: PortionBasedRecipeModel.fromJsonS,
    toJson: PortionBasedRecipeModel.toJsonS,
  )
  final PortionBasedRecipeModels servings;
  final String defaultPortionBasedRecipeID;

  DetailsModel({
    required this.baseIngredients,
    required this.baseNutritious,
    required this.servings,
    required this.defaultPortionBasedRecipeID,
  }) : assert(servings.isNotEmpty);

  factory DetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsModelFromJson(json);

  factory DetailsModel.fromEntity(Details entity) => DetailsModel(
    baseIngredients: IngredientModel.fromEntities(entity.baseIngredients),
    baseNutritious: NutritionModel.fromEntities(entity.baseNutritious),
    servings: PortionBasedRecipeModel.fromEntities(entity.servings),
    defaultPortionBasedRecipeID: entity.defaultPortionBasedRecipeID,
  );

  // Map<String, dynamic> toJson() => _$DetailsModelToJson(this);

  static Map<String, dynamic> toJson(DetailsModel instance) {
    return _$DetailsModelToJson(instance);
  }

  Details toEntity() => Details(
    baseIngredients: baseIngredients.toEntity(),
    baseNutritious: baseNutritious.toEntity(),
    servings: servings.toEntity(),
    defaultPortionBasedRecipeID: defaultPortionBasedRecipeID,
  );

  @override
  String toString() {
    return 'DetailsModel(baseIngredients: $baseIngredients, baseNutritious: $baseNutritious, servings: $servings, defaultPortionBasedRecipeID: $defaultPortionBasedRecipeID)';
  }
}
