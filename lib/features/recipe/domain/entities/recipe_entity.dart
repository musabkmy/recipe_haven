import 'package:equatable/equatable.dart';

import 'entities.dart';

typedef Recipes = List<Recipe>;

class Recipe extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final Engagement usersEngagement;
  final Creator creator;
  final Details details;
  final Utensils baseUtils;
  final List<String> tags;
  final Reviews reviews;
  final CookingSteps cookingSteps;

  const Recipe(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.usersEngagement,
      required this.creator,
      required this.details,
      required this.baseUtils,
      required this.tags,
      required this.reviews,
      required this.cookingSteps});

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
        usersEngagement,
        creator,
        details,
        baseUtils,
        tags,
        reviews,
        cookingSteps,
      ];
}
