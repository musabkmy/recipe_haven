import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/home/presentation/layouts/editors_choice_layouts/editors_choice_layouts.dart';
import 'package:recipe_haven/core/shared_layouts/app_icon_text.dart';
import 'package:recipe_haven/core/shared_layouts/app_info_highlight.dart';
import 'package:recipe_haven/core/shared_layouts/app_overlay.dart';
import 'package:recipe_haven/core/shared_layouts/app_text_button.dart';

import 'package:recipe_haven/core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart';

class BuildEditorChoiceLayout extends StatefulWidget {
  const BuildEditorChoiceLayout({super.key});

  @override
  State<BuildEditorChoiceLayout> createState() =>
      _BuildEditorChoiceLayoutState();
}

class _BuildEditorChoiceLayoutState extends State<BuildEditorChoiceLayout> {
  final ScrollController _scrollController = ScrollController();
  // final ValueNotifier<double> mainDishCardPosition = ValueNotifier(0.0);

  // double maxMainDishCardPosition = 100.0; // Adjust based on your UI
  // double minMainDishCardPosition = 20.0;  // Adjust based on your UI
  final mainDishImageHeight = .6.sh;
  final maxMainDishCardPosition = .45.sh;
  late final double minMainDishCardPosition;
  late final ValueNotifier<double> mainDishCardPosition;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      minMainDishCardPosition = context.isTablet ? .27.sh : .35.sh;
    });
    mainDishCardPosition = ValueNotifier(maxMainDishCardPosition);
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final double newPosition = (maxMainDishCardPosition -
            _scrollController.offset)
        .clamp(minMainDishCardPosition, maxMainDishCardPosition);

    if (mainDishCardPosition.value != newPosition) {
      mainDishCardPosition.value = newPosition;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final mainDishImageHeight = .6.sh;
    // final maxMainDishCardPosition = .45.sh;
    // final minMainDishCardPosition = context.isTablet ? .27.sh : .35.sh;

    // Logger logger = Logger('Editor\'s Choice');
    return BlocListener<GetRecipesCubit, GetRecipesState>(
      listenWhen: (previous, current) => current is GetRecipesLoading,
      listener: (BuildContext context, GetRecipesState state) {
        if (state is GetRecipesLoading) {
          LoadingOverlay.show(context);
        } else {
          LoadingOverlay.hide(context);
        }
      },

      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          spacing: AppSpacing.xl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wrap only _buildTop with ValueListenableBuilder
            // to not building unnecessary widgets
            ValueListenableBuilder<double>(
              valueListenable: mainDishCardPosition,
              builder: (context, cardValue, child) {
                return _BuildTop(
                  mainDishImageHeight,
                  maxMainDishCardPosition,
                  cardValue,
                );
              },
            ),
            BuildLatestRecipes(),
            BuildBestCreators(),
            BuildTodaysRecipe(),
            BuildTonightCook(),
            BuildTagsQuickLinks(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}

class _BuildTop extends StatelessWidget {
  const _BuildTop(
    this.imageHeight,
    this.maxMainDishCardPosition,
    this.cardValue,
  );
  final double imageHeight;
  final double maxMainDishCardPosition;
  final double cardValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight + (context.isTablet ? cardValue / 5 : cardValue / 6),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/home_main_dish.jpg',
            height: imageHeight,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: cardValue,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                padding: EdgeInsets.all(AppSpacing.md).r,
                decoration: BoxDecoration(
                  color: AppColors.lightAmberAccent,
                  borderRadius: AppStyles.borderRadiusML,
                ),
                child: Column(
                  spacing: AppSpacing.lg,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Oven Fresh and Cozy\n',
                        style: context.bodySmall.copyWith(height: 2),
                        children: [
                          TextSpan(
                            text:
                                'One-Pan Coconut Curry Salmon with Garlic Butter',
                            style: context.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextButton(label: 'Qienuhe'),
                        GestureDetector(
                          child: AppInfoHighlight(
                            padding: EdgeInsets.symmetric(
                              vertical: AppSpacing.sm,
                              horizontal: AppSpacing.sl,
                            ),
                            child: AppIconText(
                              iconSize: 20,
                              icon: AppIcons.favorite,
                              labelStyle: context.bodyMedium,
                              label: '1.64k',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
