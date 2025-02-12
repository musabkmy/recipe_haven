import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/recipe/domain/entities/details/details_entity.dart';
import 'models_details.dart';

part 'details_model.g.dart';

@JsonSerializable()
class DetailsModel {
  final IngredientModels baseIngredients;
  final NutritionModels baseNutritious;
  final PortionBasedRecipeModels servings;
  final String defaultPortionBasedRecipeID;

  DetailsModel(
      {required this.baseIngredients,
      required this.baseNutritious,
      required this.servings,
      required this.defaultPortionBasedRecipeID})
      : assert(servings.isNotEmpty);

  factory DetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsModelFromJson(json);

  factory DetailsModel.fromEntity(Details entity) => DetailsModel(
      baseIngredients: IngredientModel.fromEntities(entity.baseIngredients),
      baseNutritious: NutritionModel.fromEntities(entity.baseNutritious),
      servings: PortionBasedRecipeModel.fromEntities(entity.servings),
      defaultPortionBasedRecipeID: entity.defaultPortionBasedRecipeID);

  Map<String, dynamic> toJson() => _$DetailsModelToJson(this);

  Details toEntity() => Details(
      baseIngredients: baseIngredients.toEntity(),
      baseNutritious: baseNutritious.toEntity(),
      servings: servings.toEntity(),
      defaultPortionBasedRecipeID: defaultPortionBasedRecipeID);
}
