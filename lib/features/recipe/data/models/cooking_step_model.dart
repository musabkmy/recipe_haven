import 'package:json_annotation/json_annotation.dart';
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

  ///to specify an ingredient write '$ing_ingredientID'
  ///to specify a utensil write '$utensil_utensilID'
  ///to specify a timer write '$timer_timerTimestamp'
  final String paragraph;

  const CookingStepModel(
      {required this.stepNumber,
      required this.ingredientsID,
      required this.utensilsID,
      required this.imagesUrl,
      required this.fontSize,
      required this.paragraph});

  factory CookingStepModel.fromJson(Map<String, dynamic> json) =>
      _$CookingStepModelFromJson(json);

  Map<String, dynamic> toJson() => _$CookingStepModelToJson(this);
}
