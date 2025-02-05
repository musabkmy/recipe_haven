import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

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
  final DetailsModel details;
  final UtensilModels baseUtils;
  final List<String> tags;
  final ReviewModels reviews;
  final CookingStepModels cookingSteps;

  const RecipeModel(
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

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}
