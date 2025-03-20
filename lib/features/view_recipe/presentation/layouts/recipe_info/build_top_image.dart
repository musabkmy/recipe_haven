import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/core/services/image/network_image_service.dart';
import 'package:recipe_haven/features/view_recipe/presentation/blocs/recipe_info_bloc/recipe_info_bloc.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/shared/recipe_shared_layouts.dart';

class BuildTopImage extends StatelessWidget {
  const BuildTopImage(this.innerBoxIsScrolled, {super.key});
  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: .6.sh,
      floating: false,
      pinned: true,
      forceElevated: true,
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.lightOverlayColor,
      surfaceTintColor: AppColors.background,
      toolbarHeight: 52,
      leadingWidth: 84,
      leading: RecipeAppBarLeading(),
      actionsIconTheme: recipeAppBarActionsTheme(),
      actions: innerBoxIsScrolled ? recipeAppBarActions() : null,
      bottom: innerBoxIsScrolled ? recipeAppBarBottom() : null,
      flexibleSpace: FlexibleSpaceBar(background: _BuildRecipeImage()),
    );
  }
}

class _BuildRecipeImage extends StatelessWidget {
  const _BuildRecipeImage();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipeInfoBloc, RecipeInfoState, String?>(
      selector:
          (state) => switch (state) {
            RecipeInfoSuccess(recipe: final recipe) => recipe.imageUrl,
            _ => null,
          },
      builder: (context, imageUrl) {
        return imageUrl != null
            ? AppNetworkImage(
              imageUrl: imageUrl,
              imageBuilder:
                  (context, imageProvider) =>
                      Image(fit: BoxFit.cover, image: imageProvider),
            )
            : SizedBox.shrink();
      },
    );
  }
}
