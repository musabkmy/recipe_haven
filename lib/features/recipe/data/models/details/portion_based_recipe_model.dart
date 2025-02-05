import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/config/utils/duration_utils.dart';
import 'package:recipe_haven/features/recipe/enums/recipe_difficulty.dart';
import '../../../domain/entities/details/portion_based_recipe_entity.dart';
import 'utensil_model.dart';
import 'weight_count_model.dart';

part 'portion_based_recipe_model.g.dart';

typedef PortionBasedRecipeModels = List<PortionBasedRecipeModel>;

///portionCount must not be null
///or maxPortionCount and minPortionCount is not null
///portionCount is prioritized if all not null
@JsonSerializable()
class PortionBasedRecipeModel {
  final String id;
  final int? minPortionCount;
  final int? maxPortionCount;
  final int? portionCount;
  final Difficulty difficulty;
  final String preparationHumanTime;

  ///formula _h_m_s, ex: 1h30m40s
  final String bakingHumanTime;

  ///formula _h_m_s, ex: 1h30m40s
  final String restingHumanTime;
  final UtensilModels utensils;
  final WeightCountModels ingredients;
  final WeightCountModels nutritious;
  // final Ingredients? additionalIngredients;
  // final Nutritious? additionalNutritious;

  const PortionBasedRecipeModel({
    required this.id,
    this.minPortionCount,
    this.maxPortionCount,
    this.portionCount,
    required this.difficulty,
    required this.preparationHumanTime,
    required this.bakingHumanTime,
    required this.restingHumanTime,
    required this.utensils,
    required this.ingredients,
    required this.nutritious,
    // this.additionalIngredients,
    // this.additionalNutritious,
  }) : assert((minPortionCount != null && maxPortionCount != null) ||
            portionCount != null);

  factory PortionBasedRecipeModel.fromJson(Map<String, dynamic> json) =>
      _$PortionBasedRecipeModelFromJson(json);

  factory PortionBasedRecipeModel.fromEntity(PortionBasedRecipe entity) =>
      PortionBasedRecipeModel(
          id: entity.id,
          difficulty: entity.difficulty,
          minPortionCount: entity.minPortionCount,
          maxPortionCount: entity.maxPortionCount,
          portionCount: entity.portionCount,
          preparationHumanTime: toHumanDuration(entity.preparationTime),
          bakingHumanTime: toHumanDuration(entity.bakingTime),
          restingHumanTime: toHumanDuration(entity.restingTime),
          utensils: UtensilModel.fromEntities(entity.utensils),
          ingredients: WeightCountModel.fromEntities(entity.ingredientsCount),
          nutritious: WeightCountModel.fromEntities(entity.nutritiousCount));

  static PortionBasedRecipeModels fromEntities(PortionBasedRecipes entities) =>
      entities
          .map((element) => PortionBasedRecipeModel.fromEntity(element))
          .toList();

  Map<String, dynamic> toJson() => _$PortionBasedRecipeModelToJson(this);

  PortionBasedRecipe toEntity() => PortionBasedRecipe(
        id: id,
        difficulty: difficulty,
        minPortionCount: minPortionCount,
        maxPortionCount: maxPortionCount,
        portionCount: portionCount,
        preparationTime: parseHumanDuration(preparationHumanTime),
        bakingTime: parseHumanDuration(bakingHumanTime),
        restingTime: parseHumanDuration(restingHumanTime),
        utensils: utensils.toEntity(),
        ingredientsCount: ingredients.toEntity(),
        nutritiousCount: nutritious.toEntity(),
      );
}

extension PortionBasedRecipeModelEx on PortionBasedRecipeModels {
  PortionBasedRecipes toEntity() =>
      map((element) => element.toEntity()).toList();
}
