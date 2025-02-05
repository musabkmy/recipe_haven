import 'package:equatable/equatable.dart';
import 'entities_details.dart';

class Details extends Equatable {
  final Ingredients baseIngredients;
  final Nutritious baseNutritious;
  final PortionBasedRecipes servings;
  final String chosenPortionBasedRecipeID;
  final String defaultPortionBasedRecipeID;

  Details(
      {required this.baseIngredients,
      required this.baseNutritious,
      required this.servings,
      required this.chosenPortionBasedRecipeID,
      required this.defaultPortionBasedRecipeID})
      : assert(servings.isNotEmpty);

  @override
  List<Object?> get props => [
        baseIngredients,
        baseNutritious,
        servings,
        chosenPortionBasedRecipeID,
        defaultPortionBasedRecipeID,
      ];
}
