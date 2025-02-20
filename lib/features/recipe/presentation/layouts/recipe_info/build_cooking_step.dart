import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/context_extensions.dart';
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
  });

  final CookingStep step;
  final int stepNumber;
  final int stepsCount;
  final Map<String, String> ingredientsMap;
  final Map<String, String> utensilsMap;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isVisible = ValueNotifier<bool>(true);

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
                  children: [
                    _buildImages(),
                    _buildIngredients(),
                    _buildUtensils(),
                    _buildParagraph(context),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Padding _buildParagraph(BuildContext context) {
    String paragraph = step.paragraph;
    ingredientsMap.forEach((key, value) {
      paragraph = paragraph.replaceAll(
          '${ParagraphKeys.ingredient.key}$key', '$value ');
    });
    utensilsMap.forEach((key, value) {
      paragraph =
          paragraph.replaceAll('${ParagraphKeys.utensil.key}$key', '$value ');
    });
    //TODO: timer implementation
    paragraph.replaceAll(ParagraphKeys.timer.key, '');

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal)
          .copyWith(top: AppSpacing.lg),
      child: SelectableText(paragraph, style: context.bodyMedium),
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

  CachedNetworkImage _buildImages() {
    List<String> stepImages = step.imagesUrl;
    return CachedNetworkImage(
      imageUrl: stepImages.first,
      imageBuilder: (context, imageProvider) => Image(
          height: .6.sw,
          width: double.maxFinite,
          image: imageProvider,
          fit: BoxFit.fitWidth),
      placeholder: (context, url) => CircularProgressIndicator(),
    );
  }
}
