import 'package:equatable/equatable.dart';
import 'package:recipe_haven/core/support_classes/has_id.dart';
import 'package:recipe_haven/features/view_recipe/enums/recipe_difficulty.dart';
import 'weight_count_entity.dart';

typedef PortionBasedRecipes = List<PortionBasedRecipe>;

///portionCount must not be null
///or maxPortionCount and minPortionCount is not null
///portionCount is prioritized if all not null
class PortionBasedRecipe extends Equatable implements HasId {
  @override
  final String id;
  final int? minPortionCount;
  final int? maxPortionCount;
  final int? portionCount;
  final Difficulty difficulty;
  final Duration preparationTime;
  final Duration bakingTime;
  final Duration restingTime;
  final WeightCounts ingredientsCount;
  final WeightCounts nutritiousCount;
  // final Ingredients? additionalIngredients;
  // final Nutritious? additionalNutritious;

  const PortionBasedRecipe({
    required this.id,
    required this.minPortionCount,
    required this.maxPortionCount,
    required this.portionCount,
    required this.difficulty,
    required this.preparationTime,
    required this.bakingTime,
    required this.restingTime,
    required this.ingredientsCount,
    required this.nutritiousCount,
    // this.additionalIngredients,
    // this.additionalNutritious,
  }) : assert(
         (minPortionCount != null && maxPortionCount != null) ||
             portionCount != null,
       );

  @override
  List<Object?> get props => [
    id,
    minPortionCount,
    maxPortionCount,
    portionCount,
    difficulty,
    preparationTime,
    bakingTime,
    restingTime,
    ingredientsCount,
    nutritiousCount,
  ];
}

extension PortionBasedRecipeEx on PortionBasedRecipe {
  String get servingsCount =>
      portionCount?.toString() ?? '$minPortionCount-$maxPortionCount';

  String get difficultyEmoji => switch (difficulty) {
    Difficulty.easy => '👌',
    Difficulty.medium => '👍',
    Difficulty.hard => '🤜',
    Difficulty.unknown => '🤷',
  };
}
