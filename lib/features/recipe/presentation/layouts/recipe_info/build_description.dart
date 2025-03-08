import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/features/recipe/domain/entities/recipe_entity.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/shared_layouts/read_more_text.dart';

class BuildDescription extends StatelessWidget {
  const BuildDescription({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.minHorizontal,
      ).copyWith(top: AppSpacing.lg),
      child: ReadMoreText(
        recipe.description,
        textStyle: context.bodyMedium,
        textButtonStyle: context.displayMediumAction,
        maxLines: 5,
        maxWidth: 1.sw - AppSpacing.minHorizontal * 2,
      ),
    );
  }
}
