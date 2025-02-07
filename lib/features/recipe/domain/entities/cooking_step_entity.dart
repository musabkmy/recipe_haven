import 'package:equatable/equatable.dart';
import 'package:recipe_haven/features/recipe/enums/recipe_step_font_size.dart';

typedef CookingSteps = List<CookingStep>;

class CookingStep extends Equatable {
  final String stepNumber;
  final List<String> ingredientsID;
  final List<String> utensilsID;
  final List<String> imagesUrl;
  final FontSize fontSize;

  ///to specify an ingredient write '__ing_ingredientID'
  ///to specify a utensil write '__utensil_utensilID'
  ///to specify a timer write '__timer_timerTimestamp' ex: [__timer_30m40s]
  ///for new line [__nl]
  final String paragraph;

  CookingStep(
      {required this.stepNumber,
      required this.ingredientsID,
      required this.utensilsID,
      required this.imagesUrl,
      required this.fontSize,
      required this.paragraph})
      : assert(ingredientsID.isNotEmpty && utensilsID.isNotEmpty);

  @override
  List<Object?> get props =>
      [stepNumber, ingredientsID, utensilsID, imagesUrl, fontSize, paragraph];
}
