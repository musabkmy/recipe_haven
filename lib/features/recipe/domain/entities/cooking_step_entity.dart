import 'package:equatable/equatable.dart';
import 'package:recipe_haven/features/recipe/enums/recipe_step_font_size.dart';

///cooking steps key:step number, value: data
typedef CookingStepsMap = Map<int, CookingStep?>;

enum ParagraphKeys {
  ingredient('__ing_'),
  utensil('__utensil_'),
  timer('__timer_');

  const ParagraphKeys(this.key);

  final String key;
}

class CookingStep extends Equatable {
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
      {required this.ingredientsID,
      required this.utensilsID,
      required this.imagesUrl,
      required this.fontSize,
      required this.paragraph})
      : assert(ingredientsID.isNotEmpty && utensilsID.isNotEmpty);

  @override
  List<Object?> get props =>
      [ingredientsID, utensilsID, imagesUrl, fontSize, paragraph];
}
