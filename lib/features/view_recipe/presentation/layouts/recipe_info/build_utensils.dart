import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/config/extensions/object_extension.dart';
import 'package:recipe_haven/config/extensions/string_extension.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/details/utensil_entity.dart';
import 'package:recipe_haven/features/view_recipe/presentation/blocs/recipe_info_bloc/recipe_info_bloc.dart';

class BuildUtensils extends StatelessWidget {
  const BuildUtensils({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipeInfoBloc, RecipeInfoState, Utensils?>(
      selector:
          (state) => state is RecipeInfoSuccess ? state.recipe.utensils : null,
      builder: (context, utensils) {
        return utensils.letOrElse(
          (utensils) => Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
            child: Column(
              spacing: AppSpacing.sm,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Utensils', style: context.displayLarge),
                Text(
                  utensils
                      .map((element) => element.name.capitalizeEachWord)
                      .toList()
                      .join(', '),
                  style: context.bodyMedium,
                ),
              ],
            ),
          ),
          orElse: SizedBox.shrink,
        );
      },
    );
  }
}
