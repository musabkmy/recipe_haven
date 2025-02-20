import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/app_network_circular_avatar.dart';
import 'package:recipe_haven/features/recipe/presentation/get_recipes_cubit/get_recipes_cubit.dart';

class BuildEditorChoiceLayout extends StatelessWidget {
  const BuildEditorChoiceLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger('Editor\'s Choice');
    return BlocBuilder<GetRecipesCubit, GetRecipesState>(
        builder: (context, state) {
      if (state is GetRecipesSuccess) {
        final recipes = state.recipes;
        final mainDishImageHeight = .5.sh;
        final maxMainDishCardPosition = .45.sh;
        final minMainDishCardPosition = .23.sh;
        final ValueNotifier<double> mainDishCardPosition =
            ValueNotifier(maxMainDishCardPosition);

        return ValueListenableBuilder(
          valueListenable: mainDishCardPosition,
          builder: (context, cardValue, child) {
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification) {
                  mainDishCardPosition.value =
                      .45.sh - notification.metrics.pixels;
                  mainDishCardPosition.value = mainDishCardPosition.value
                      .clamp(minMainDishCardPosition, maxMainDishCardPosition);
                }
                return false;
              },
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  _buildTop(context, mainDishImageHeight, cardValue),
                  SizedBox(
                    height: .5.sh,
                    child: PageView.builder(
                      itemCount: state.recipes.length,
                      itemBuilder: (context, index) {
                        final item = recipes[index];
                        final creator = item.creator;
                        return GestureDetector(
                            child: Container(
                          // width: .5.sw,
                          margin: EdgeInsetsDirectional.only(
                              start: index == 0
                                  ? AppSpacing.minHorizontal
                                  : AppSpacing.sm,
                              end: AppSpacing.sm),
                          child: Column(
                            spacing: AppSpacing.sm,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: item.imageUrl,
                                height: 250,
                                width: .5.sw,
                                imageBuilder: (context, imageProvider) =>
                                    SizedBox(
                                  width: double.maxFinite,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  AppStyles.borderRadiusM,
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Text(item.title,
                                  style: context.bodySmall, maxLines: null),
                              SizedBox(
                                width: .5.sw,
                                child: Row(
                                  spacing: AppSpacing.xs,
                                  children: [
                                    AppNetworkCircularAvatar(
                                      imageUrl: creator.profilePic,
                                      size: 28.sp,
                                      maxSize: 50,
                                    ),
                                    Expanded(
                                      child: Text(
                                        creator.name,
                                        style: context.bodySmallAction,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                      },
                    ),
                  )
                ],
              )),
            );
          },
        );
      }
      return SizedBox.shrink();
    });
  }

  Widget _buildTop(BuildContext context, double imageHeight, double cardValue) {
    return SizedBox(
      height: imageHeight +
          ((cardValue - imageHeight / 2) > 0 ? cardValue / 2 : cardValue / 3),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/home_main_dish.jpg',
            height: imageHeight,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: Positioned(
                top: cardValue,
                left: 0,
                right: 0,
                // height: .25.sh,
                child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                  padding: EdgeInsets.all(AppSpacing.minHorizontal),
                  decoration: BoxDecoration(
                    color: AppColors.lightAmberAccent,
                    borderRadius: AppStyles.borderRadiusML,
                  ),
                  child: Column(
                    spacing: AppSpacing.lg,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                        text: 'Oven Fresh and Cozy\n',
                        style: context.bodySmall.copyWith(height: 2),
                        children: [
                          TextSpan(
                            text:
                                'One-Pan Coconut Curry Salmon with Garlic Butter',
                            style: context.bodyLarge,
                          ),
                        ],
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: null,
                            child:
                                Text('Qienuhe', style: context.bodySmallAction),
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: AppStyles.borderRadiusML),
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSpacing.xs,
                                  horizontal: AppSpacing.sl),
                              child: Text.rich(TextSpan(
                                  text: '♡ ',
                                  style: context.bodyLarge,
                                  children: [
                                    TextSpan(
                                        text: '1.64k', style: context.bodySmall)
                                  ])),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
