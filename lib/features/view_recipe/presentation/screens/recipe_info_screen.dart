import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/app_overlay.dart';
import 'package:recipe_haven/core/shared_layouts/app_spacer.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/entities.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/recipe_info/recipe_info_layouts.dart';
import 'package:recipe_haven/features/view_recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart';

@RoutePage()
class RecipeInfoScreen extends StatelessWidget {
  const RecipeInfoScreen({super.key, required this.id, this.recipe});
  final String id;
  final Recipe? recipe;

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<RecipeInfoBloc>();

    return BlocProvider.value(
      value: bloc..initRecipe(id, recipe),
      child: _RecipeInfoBody(),
    );
  }
}

class _RecipeInfoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RecipeInfoBloc, RecipeInfoState>(
      listenWhen: (_, _) => false,
      listener: (context, state) {
        if (state is RecipeInfoLoading) {
          LoadingOverlay.show(context);
        } else {
          LoadingOverlay.hide(context);
        }
      },
      // : (previous, current) => current is RecipeInfoSuccess,
      child: _RecipeInfoView(),
    );
  }
}

class _RecipeInfoView extends StatelessWidget {
  const _RecipeInfoView();
  @override
  Widget build(BuildContext context) {
    Logger logger = Logger('_RecipeInfoView');

    logger.info('rebuilds');

    // Logger('on _RecipeInfoBody, selectedPortion:')
    //     .info(selectedPortion.servingsCount);
    final items = [
      BuildTopInfos(),
      const AppSpacer(height: 70),
      BuildCreator(),
      BuildDescription(),
      BuildToReviews(),
      const AppSpacer(),
      BuildRecipeDetails(),
      const AppSpacer(height: 100),
      BuildUtensils(),
      BuildCookingSteps(),

      const AppSpacer(height: AppSpacing.xl),
    ];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [BuildTopImage(innerBoxIsScrolled)];
        },
        body: CustomScrollView(
          slivers: [
            SliverList(
              // padding: EdgeInsets.only(bottom: AppSpacing.xl),
              // physics: ClampingScrollPhysics(),
              // crossAxisAlignment: CrossAxisAlignment.start,
              delegate: SliverChildBuilderDelegate(
                (context, index) => items[index],
                childCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
