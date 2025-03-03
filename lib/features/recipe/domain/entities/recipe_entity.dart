import 'package:equatable/equatable.dart';
import 'entities.dart';

typedef Recipes = List<Recipe>;

class Recipe extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime? joinedDate;
  final Engagement usersEngagement;
  final Creator? creator;
  final Details details;
  final Utensils utensils;
  final List<String> tags;
  final Reviews reviews;
  final CookingStepsMap cookingStepsMap;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.joinedDate,
    required this.usersEngagement,
    required this.creator,
    required this.details,
    required this.utensils,
    required this.tags,
    required this.reviews,
    required this.cookingStepsMap,
  }) : assert(cookingStepsMap.isNotEmpty);

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    imageUrl,
    usersEngagement,
    creator,
    details,
    utensils,
    tags,
    reviews,
    cookingStepsMap,
  ];
}

extension RecipeEx on Recipe {
  PortionBasedRecipe get selectedPortion => details.servings.firstWhere(
    (element) => element.id == details.defaultPortionBasedRecipeID,
    orElse: () => details.servings.first,
  );
}
