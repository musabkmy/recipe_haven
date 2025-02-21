import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/config/extensions/duration_extensions.dart';
import 'package:recipe_haven/config/utils/duration_utils.dart';
import 'package:recipe_haven/features/recipe/enums/recipe_difficulty.dart';
import '../../../domain/entities/details/portion_based_recipe_entity.dart';
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
  final String difficulty;
  final String? preparationHumanTime;

  ///formula _h_m_s, ex: 1h30m40s
  final String? bakingHumanTime;

  ///formula _h_m_s, ex: 1h30m40s
  final String? restingHumanTime;
  @JsonKey(
    fromJson: WeightCountModel.fromJsonS,
    toJson: WeightCountModel.toJsonS,
  )
  final WeightCountModels ingredients;
  @JsonKey(
    fromJson: WeightCountModel.fromJsonS,
    toJson: WeightCountModel.toJsonS,
  )
  final WeightCountModels nutritious;
  // final Ingredients? additionalIngredients;
  // final Nutritious? additionalNutritious;

  const PortionBasedRecipeModel({
    required this.id,
    this.minPortionCount,
    this.maxPortionCount,
    this.portionCount,
    required this.difficulty,
    this.preparationHumanTime,
    this.bakingHumanTime,
    this.restingHumanTime,
    required this.ingredients,
    required this.nutritious,
    // this.additionalIngredients,
    // this.additionalNutritious,
  }) : assert(
         (minPortionCount != null && maxPortionCount != null) ||
             portionCount != null,
       );

  factory PortionBasedRecipeModel.fromJson(Map<String, dynamic> json) =>
      _$PortionBasedRecipeModelFromJson(json);

  factory PortionBasedRecipeModel.fromEntity(PortionBasedRecipe entity) =>
      PortionBasedRecipeModel(
        id: entity.id,
        difficulty: entity.difficulty.name,
        minPortionCount: entity.minPortionCount,
        maxPortionCount: entity.maxPortionCount,
        portionCount: entity.portionCount,
        preparationHumanTime: entity.preparationTime.toJsonDuration(),
        bakingHumanTime: entity.bakingTime.toJsonDuration(),
        restingHumanTime: entity.restingTime.toJsonDuration(),
        ingredients: WeightCountModel.fromEntities(entity.ingredientsCount),
        nutritious: WeightCountModel.fromEntities(entity.nutritiousCount),
      );

  static PortionBasedRecipeModels fromEntities(PortionBasedRecipes entities) =>
      entities
          .map((element) => PortionBasedRecipeModel.fromEntity(element))
          .toList();

  Map<String, dynamic> toJson() => _$PortionBasedRecipeModelToJson(this);

  PortionBasedRecipe toEntity() => PortionBasedRecipe(
    id: id,
    difficulty: Difficulty.values.firstWhere(
      (diff) => diff.name == difficulty,
      orElse: () => Difficulty.unknown,
    ),
    minPortionCount: minPortionCount,
    maxPortionCount: maxPortionCount,
    portionCount: portionCount,
    preparationTime: parseHumanDuration(preparationHumanTime),
    bakingTime: parseHumanDuration(bakingHumanTime),
    restingTime: parseHumanDuration(restingHumanTime),
    ingredientsCount: ingredients.toEntity(),
    nutritiousCount: nutritious.toEntity(),
  );

  static PortionBasedRecipeModels fromJsonS(List<dynamic> json) {
    return json
        .map((e) => PortionBasedRecipeModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> toJsonS(
    PortionBasedRecipeModels portionBasedRecipeModels,
  ) {
    return portionBasedRecipeModels.map((e) => e.toJson()).toList();
  }
}

extension PortionBasedRecipeModelEx on PortionBasedRecipeModels {
  PortionBasedRecipes toEntity() =>
      map((element) => element.toEntity()).toList();
}
