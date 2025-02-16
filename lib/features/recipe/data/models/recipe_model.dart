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
  @JsonKey(fromJson: EngagementModel.fromJson, toJson: EngagementModel.toJson)
  final EngagementModel usersEngagement;
  @JsonKey(fromJson: CreatorModel.fromJson, toJson: CreatorModel.toJson)
  final CreatorModel creator;
  @JsonKey(fromJson: UtensilModel.fromJsonS, toJson: UtensilModel.toJsonS)
  final UtensilModels utensils;
  @JsonKey(fromJson: DetailsModel.fromJson, toJson: DetailsModel.toJson)
  final DetailsModel details;
  final List<String> tags;
  @JsonKey(fromJson: ReviewModel.fromJsonS, toJson: ReviewModel.toJsonS)
  final ReviewModels reviews;
  @JsonKey(
      fromJson: CookingStepModel.fromJsonS, toJson: CookingStepModel.toJsonS)
  final CookingStepModels cookingStepsMap;

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
      required this.cookingStepsMap})
      : assert(cookingStepsMap.isNotEmpty);

  static String collectionId = 'recipes';

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
      cookingStepsMap: CookingStepModel.fromEntities(entity.cookingStepsMap));

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
      cookingStepsMap: cookingStepsMap.toEntity());
}

extension RecipeModelEx on RecipeModels {
  Recipes toEntity() => map((element) => element.toEntity()).toList();
}
