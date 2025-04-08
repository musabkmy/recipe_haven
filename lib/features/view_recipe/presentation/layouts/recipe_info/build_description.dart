import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/config/extensions/object_extension.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/core/shared_layouts/read_more_text.dart';
import 'package:recipe_haven/features/view_recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart';

class BuildDescription extends StatelessWidget {
  const BuildDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipeInfoBloc, RecipeInfoState, String?>(
      selector:
          (state) =>
              state is RecipeInfoSuccess ? state.recipe.description : null,
      builder: (context, description) {
        return description.letOrElse(
          (description) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.minHorizontal,
            ).copyWith(top: AppSpacing.lg),
            child: ReadMoreText(
              description,
              textStyle: context.bodyMedium,
              textButtonStyle: context.displayMediumAction,
              maxLines: 5,
              maxWidth: 1.sw - AppSpacing.minHorizontal * 2,
            ),
          ),
          orElse: SizedBox.shrink,
        );
      },
    );
  }
}
