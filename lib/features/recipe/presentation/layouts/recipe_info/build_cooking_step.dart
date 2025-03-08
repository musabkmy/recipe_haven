import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/constants/app_icons.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/features/recipe/domain/entities/cooking_step_entity.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/shared/shared_layouts.dart';

class BuildCookingStep extends StatelessWidget {
  const BuildCookingStep({
    super.key,
    required this.step,
    required this.stepNumber,
    required this.stepsCount,
    required this.ingredientsMap,
    required this.utensilsMap,
    required this.initVisible,
  });

  final CookingStep step;
  final int stepNumber;
  final int stepsCount;
  final Map<String, String> ingredientsMap;
  final Map<String, String> utensilsMap;
  final bool initVisible;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isVisible = ValueNotifier<bool>(initVisible);

    // Logger('stepImages').info(stepImages.toString());
    return Column(
      key: Key('$stepNumber'),
      children: [
        GestureDetector(
          onTap: () => isVisible.value = !isVisible.value,
          child: Container(
            height: 32.sp,
            width: double.maxFinite,
            color: AppColors.lightAmberAccent,
            margin: EdgeInsets.only(top: AppSpacing.xl),
            alignment: AlignmentDirectional.centerStart,
            constraints: BoxConstraints(minHeight: 52),
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
            child: Text(
              'Step $stepNumber/$stepsCount',
              style: context.displayMedium,
            ),
          ),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isVisible,
          builder: (context, value, child) {
            return Visibility(
              visible: value,
              maintainState: true,
              maintainAnimation: true,
              child: Column(
                spacing: AppSpacing.sm,
                children: [
                  _buildImages(),
                  _buildIngredients(),
                  _buildUtensils(),
                  _buildParagraph(context),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Padding _buildParagraph(BuildContext context) {
    Logger logger = Logger('buildParagraph');
    String paragraph = step.paragraph;
    ingredientsMap.forEach((key, value) {
      paragraph = paragraph.replaceAll(
        '${ParagraphKeys.ingredient.key}$key',
        '$value ',
      );
    });
    utensilsMap.forEach((key, value) {
      paragraph = paragraph.replaceAll(
        '${ParagraphKeys.utensil.key}$key',
        '$value ',
      );
    });
    logger.info('before: $paragraph');
    //TODO: timer implementation
    paragraph = paragraph
        .replaceAll(ParagraphKeys.timer.key, '')
        .replaceAll(ParagraphKeys.ln.key, '');
    logger.info('after: $paragraph');

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
      // .copyWith(top: AppSpacing.lg),
      child: SelectableText(
        paragraph,
        style: context.bodyMedium,
        textAlign: TextAlign.justify,
      ),
    );
  }

  BuildListTile _buildUtensils() {
    return BuildListTile(
      iconData: AppIcons.utensils,
      info: step.utensilsID
          .map((element) {
            if (utensilsMap.containsKey(element)) {
              return utensilsMap[element]!;
            }
            return '';
          })
          .toList()
          .join(' - '),
    );
  }

  BuildListTile _buildIngredients() {
    return BuildListTile(
      iconData: AppIcons.ingredients,
      info: step.ingredientsID
          .map((element) {
            if (ingredientsMap.containsKey(element)) {
              return ingredientsMap[element]!;
            }
            return '';
          })
          .toList()
          .join(' - '),
    );
  }

  Widget _buildImages() {
    List<String> stepImages = step.imagesUrl;
    //TODO: make list of images

    return BuildRecipeImageLayout(
      imageUrl: stepImages.first,
      height: .6.sw,
      width: double.maxFinite,
    );
  }
}
