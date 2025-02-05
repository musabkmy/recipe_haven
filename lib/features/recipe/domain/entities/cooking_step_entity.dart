import 'package:equatable/equatable.dart';
import 'package:recipe_haven/features/recipe/enums/recipe_step_font_size.dart';

typedef CookingSteps = List<CookingStep>;

class CookingStep extends Equatable {
  final String stepNumber;
  final List<String> ingredientsID;
  final List<String> utensilsID;
  final List<String> imagesUrl;
  final FontSize fontSize;

  ///to specify an ingredient write '$ing_ingredientID'
  ///to specify a utensil write '$utensil_utensilID'
  ///to specify a timer write '$timer_timerTimestamp'
  final String paragraph;

  const CookingStep(
      {required this.stepNumber,
      required this.ingredientsID,
      required this.utensilsID,
      required this.imagesUrl,
      required this.fontSize,
      required this.paragraph});

  @override
  List<Object?> get props =>
      [stepNumber, ingredientsID, utensilsID, imagesUrl, fontSize, paragraph];
}
