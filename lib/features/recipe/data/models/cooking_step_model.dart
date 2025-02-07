import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/recipe/domain/entities/cooking_step_entity.dart';
import 'package:recipe_haven/features/recipe/enums/recipe_step_font_size.dart';

part 'cooking_step_model.g.dart';

typedef CookingStepModels = List<CookingStepModel>;

@JsonSerializable()
class CookingStepModel {
  final String stepNumber;
  final List<String> ingredientsID;
  final List<String> utensilsID;
  final List<String> imagesUrl;
  final FontSize fontSize;

  ///to specify an ingredient write '__ing_ingredientID'
  ///to specify a utensil write '__utensil_utensilID'
  ///to specify a timer write '__timer_humanTime' ex: [__timer_30m40s]
  ///for new line [__nl]
  final String paragraph;

  CookingStepModel(
      {required this.stepNumber,
      required this.ingredientsID,
      required this.utensilsID,
      required this.imagesUrl,
      required this.fontSize,
      required this.paragraph})
      : assert(ingredientsID.isNotEmpty && utensilsID.isNotEmpty);

  factory CookingStepModel.fromJson(Map<String, dynamic> json) =>
      _$CookingStepModelFromJson(json);

  factory CookingStepModel.fromEntity(CookingStep entity) => CookingStepModel(
      stepNumber: entity.stepNumber,
      ingredientsID: entity.ingredientsID,
      utensilsID: entity.utensilsID,
      imagesUrl: entity.imagesUrl,
      fontSize: entity.fontSize,
      paragraph: entity.paragraph);

  static CookingStepModels fromEntities(CookingSteps entities) =>
      entities.map((element) => CookingStepModel.fromEntity(element)).toList();

  Map<String, dynamic> toJson() => _$CookingStepModelToJson(this);

  CookingStep toEntity() => CookingStep(
      stepNumber: stepNumber,
      ingredientsID: ingredientsID,
      utensilsID: utensilsID,
      imagesUrl: imagesUrl,
      fontSize: fontSize,
      paragraph: paragraph);
}

extension CookingStepModelEx on CookingStepModels {
  CookingSteps toEntity() => map((element) => element.toEntity()).toList();
}
