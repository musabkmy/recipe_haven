// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/config/firestore_config/convertors.dart';

import 'package:recipe_haven/features/view_recipe/data/models/models.dart';
import 'package:recipe_haven/features/view_recipe/view_recipe.dart';

part 'recipe_model.g.dart';

typedef RecipeModels = List<RecipeModel>;

@JsonSerializable()
class RecipeModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  @JsonKey(includeToJson: false, fromJson: Convertors.fromTimestamp)
  final DateTime? joinedDate;
  @JsonKey(fromJson: EngagementModel.fromJson, toJson: EngagementModel.toJson)
  final EngagementModel usersEngagement;
  @JsonKey(fromJson: CreatorModel.fromUser, includeToJson: false)
  final CreatorModel? userData;
  @JsonKey(fromJson: UtensilModel.fromJsonS, toJson: UtensilModel.toJsonS)
  final UtensilModels utensils;
  @JsonKey(fromJson: DetailsModel.fromJson, toJson: DetailsModel.toJson)
  final DetailsModel details;
  final List<String> tags;
  @JsonKey(fromJson: ReviewModel.fromJsonS, includeToJson: false)
  final ReviewModels reviews;
  @JsonKey(
    fromJson: CookingStepModel.fromJsonS,
    toJson: CookingStepModel.toJsonS,
  )
  final CookingStepModels cookingStepsMap;

  RecipeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.joinedDate,
    required this.usersEngagement,
    this.userData,
    required this.utensils,
    required this.details,
    required this.tags,
    required this.reviews,
    required this.cookingStepsMap,
  }) : assert(cookingStepsMap.isNotEmpty);

  static const String collectionId = 'recipes';
  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  factory RecipeModel.fromEntity(Recipe entity) => RecipeModel(
    id: entity.id,
    title: entity.title,
    description: entity.description,
    imageUrl: entity.imageUrl,
    joinedDate: entity.joinedDate,
    usersEngagement: EngagementModel.fromEntity(entity.usersEngagement),
    userData: CreatorModel.fromEntity(entity.creator!),
    utensils: UtensilModel.fromEntities(entity.utensils),
    details: DetailsModel.fromEntity(entity.details),
    tags: entity.tags,
    reviews: ReviewModel.fromEntities(entity.reviews),
    cookingStepsMap: CookingStepModel.fromEntities(entity.cookingStepsMap),
  );

  static RecipeModels fromEntities(Recipes entities) =>
      entities.map((element) => RecipeModel.fromEntity(element)).toList();

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);

  Recipe toEntity() => Recipe(
    id: id,
    title: title,
    description: description,
    imageUrl: imageUrl,
    joinedDate: joinedDate,
    usersEngagement: usersEngagement.toEntity(),
    creator: userData?.toEntity(),
    details: details.toEntity(),
    utensils: utensils.toEntity(),
    tags: tags,
    reviews: reviews.toEntity(),
    cookingStepsMap: cookingStepsMap.toEntity(),
  );

  @override
  String toString() {
    return 'RecipeModel(id: $id, title: $title, description: $description, imageUrl: $imageUrl, joinedDate: $joinedDate, usersEngagement: $usersEngagement, userData: $userData, utensils: $utensils, details: $details, tags: $tags, reviews: $reviews, cookingStepsMap: $cookingStepsMap)';
  }
}

extension RecipeModelEx on RecipeModels {
  Recipes toEntity() => map((element) => element.toEntity()).toList();
}
