// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:recipe_haven/features/recipe/domain/entities/cooking_step_entity.dart';
import 'package:recipe_haven/features/recipe/enums/recipe_step_font_size.dart';

part 'cooking_step_model.g.dart';

/// A typedef for a list of nullable `CookingStepModel` objects.
typedef CookingStepModels = List<CookingStepModel?>;

/// A model class representing a cooking step.
@JsonSerializable()
class CookingStepModel {
  final int stepNumber;
  final List<String> ingredientsID;
  final List<String> utensilsID;
  final List<String> imagesUrl;
  final FontSize fontSize;

  /// The paragraph describing the cooking step.
  /// - To specify an ingredient, write `__ing_ingredientID`.
  /// - To specify a utensil, write `__utensil_utensilID`.
  /// - To specify a timer, write `__timer_humanTime` (e.g., `__timer_30m40s`).
  /// - For a new line, use `[__nl]`.
  final String paragraph;

  CookingStepModel({
    required this.stepNumber,
    required this.ingredientsID,
    required this.utensilsID,
    required this.imagesUrl,
    required this.fontSize,
    required this.paragraph,
  }) : assert(ingredientsID.isNotEmpty && utensilsID.isNotEmpty);

  factory CookingStepModel.fromJson(Map<String, dynamic> json) =>
      _$CookingStepModelFromJson(json);

  factory CookingStepModel.fromEntity(int stepNumber, CookingStep entity) =>
      CookingStepModel(
        stepNumber: stepNumber,
        ingredientsID: entity.ingredientsID,
        utensilsID: entity.utensilsID,
        imagesUrl: entity.imagesUrl,
        fontSize: entity.fontSize,
        paragraph: entity.paragraph,
      );

  static CookingStepModels fromEntities(CookingStepsMap entities) =>
      entities.entries.map((entry) {
        final stepNumber = entry.key;
        final entity = entry.value;
        return entity != null
            ? CookingStepModel.fromEntity(stepNumber, entity)
            : null;
      }).toList();

  Map<String, dynamic> toJson() => _$CookingStepModelToJson(this);

  CookingStep toEntity() => CookingStep(
    ingredientsID: ingredientsID,
    utensilsID: utensilsID,
    imagesUrl: imagesUrl,
    fontSize: fontSize,
    paragraph: paragraph,
  );

  static CookingStepModels fromJsonS(List<dynamic> json) {
    return json
        .map((e) => CookingStepModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> toJsonS(
    CookingStepModels cookingStepModels,
  ) {
    return cookingStepModels
        .where((e) => e != null)
        .map((e) => e!.toJson())
        .toList();
  }

  @override
  String toString() {
    return 'CookingStepModel(stepNumber: $stepNumber, ingredientsID: $ingredientsID, utensilsID: $utensilsID, imagesUrl: $imagesUrl, fontSize: $fontSize, paragraph: $paragraph)';
  }
}

extension CookingStepModelEx on CookingStepModels {
  CookingStepsMap toEntity() {
    return Map.fromEntries(
      map((model) {
        if (model == null) return MapEntry(-1, null);
        return MapEntry(model.stepNumber, model.toEntity());
      }).where((entry) => entry.key != -1),
    );
  }
}
