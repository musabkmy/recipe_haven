import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/date_time_extension.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/constants/app_icons.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/core/services/animation/animation_service.dart';
import 'package:recipe_haven/core/shared_layouts/app_recipe_image_layout.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/review_entity.dart';
import 'package:recipe_haven/features/view_recipe/presentation/blocs/recipe_info_bloc/recipe_info_bloc.dart';

@RoutePage()
class ReviewFullScreenImageScreen extends StatelessWidget {
  final String imageUrl;
  final String reviewId;
  final String tag;

  const ReviewFullScreenImageScreen({
    super.key,
    required this.imageUrl,
    required this.reviewId,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    // final logger = Logger('ReviewFullScreenImageScreen');
    // logger.info(reviewId);
    //with animated builder
    // final routeAnimation = ModalRoute.of(context)!.animation!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocSelector<RecipeInfoBloc, RecipeInfoState, Review>(
        selector: (state) {
          if (state is RecipeInfoSuccess) {
            return state.reviewsMap[reviewId].letOrElse(
              (element) => element,
              orElse: Review.empty,
            );
          }
          return Review.empty();
        },
        builder: (context, review) {
          debugPrint(review.userName);
          // final curvedAnimation = CurvedAnimation(
          //   parent: routeAnimation,
          //   curve: Curves.easeIn,
          //   reverseCurve: Curves.easeOutSine,
          // );
          return Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  panEnabled: true, // Allow panning
                  boundaryMargin: const EdgeInsets.all(20),
                  minScale: 0.5,
                  maxScale: 4, // Allow zooming
                  child: Hero(
                    tag: tag,
                    transitionOnUserGestures: true,
                    child: AppImageLayout(
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      borderRadius: BorderRadius.zero,
                      imageUrl: imageUrl,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: AppSpacing.minHorizontal,
                right: AppSpacing.minHorizontal,
                child: SizedBox(
                  height: 1.sh,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTop(context),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: '${review.userName} \n',
                                style: context.displayLarge.copyWith(
                                  height: 1.6,
                                  color: AppColors.background,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      AppIcons.time,
                                      color: AppColors.background,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' ${review.publishedAt.toTimeAgoHumanFormat()}',
                                    style: context.bodyMedium.copyWith(
                                      color: AppColors.background,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              //TODO:on tap fav
                              child: Icon(
                                AppIcons.favorite,
                                color: AppColors.background,
                              ),
                            ),
                          ],
                        ).fadeOutIn(durationInMilSec: 500),
                        // AppSpacing.sm.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: context.router.pop,
          child: Icon(color: AppColors.background, AppIcons.backArrow),
        ),

        Icon(AppIcons.flag, color: AppColors.background),
      ],
    ).fadeBlur();
  }
}
