import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/context_extensions.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/features/recipe/domain/entities/cooking_step_entity.dart';

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
    ValueNotifier<bool> isVisible = ValueNotifier(true);
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
        Visibility(
          visible: isVisible.value,
          maintainState: true,
          maintainAnimation: true,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.scale_outlined),
                title: Text(step.paragraph),
              ),
            ],
          ),
        )
      ],
    );
  }
}
