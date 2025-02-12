import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/recipe/recipe.dart';

part 'recipe_model.g.dart';

typedef RecipeModels = List<RecipeModel>;

@JsonSerializable()
class RecipeModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final EngagementModel usersEngagement;
  final CreatorModel creator;
  final UtensilModels utensils;
  final DetailsModel details;
  final List<String> tags;
  final ReviewModels reviews;
  final CookingStepModels CookingStepsMap;

  RecipeModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.usersEngagement,
      required this.creator,
      required this.utensils,
      required this.details,
      required this.tags,
      required this.reviews,
      required this.CookingStepsMap})
      : assert(CookingStepsMap.isNotEmpty);

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  factory RecipeModel.fromEntity(Recipe entity) => RecipeModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      imageUrl: entity.imageUrl,
      usersEngagement: EngagementModel.fromEntity(entity.usersEngagement),
      creator: CreatorModel.fromEntity(entity.creator),
      utensils: UtensilModel.fromEntities(entity.utensils),
      details: DetailsModel.fromEntity(entity.details),
      tags: entity.tags,
      reviews: ReviewModel.fromEntities(entity.reviews),
      CookingStepsMap: CookingStepModel.fromEntities(entity.cookingStepsMap));

  static RecipeModels fromEntities(Recipes entities) =>
      entities.map((element) => RecipeModel.fromEntity(element)).toList();

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);

  Recipe toEntity() => Recipe(
      id: id,
      title: title,
      description: description,
      imageUrl: imageUrl,
      usersEngagement: usersEngagement.toEntity(),
      creator: creator.toEntity(),
      details: details.toEntity(),
      utensils: utensils.toEntity(),
      tags: tags,
      reviews: reviews.toEntity(),
      cookingStepsMap: CookingStepsMap.toEntity());
}

extension RecipeModelEx on RecipeModels {
  Recipes toEntity() => map((element) => element.toEntity()).toList();
}
