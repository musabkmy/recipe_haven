import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/recipe/domain/entities/review_entity.dart';

class BuildToReviews extends StatelessWidget {
  const BuildToReviews({
    super.key,
    required this.reviews,
  });

  final Reviews reviews;

  @override
  Widget build(BuildContext context) {
    return reviews.isEmpty
        ? SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal)
                .copyWith(top: AppSpacing.x3l),
            child: Column(
              spacing: AppSpacing.lg,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                          text: 'Reviews\n',
                          style: context.displayLarge.copyWith(height: 2),
                          children: [
                            TextSpan(
                              text:
                                  '${reviews.length} comments${reviews.hasImages ? ' - ${reviews.numOfReviewsImages()} images' : ''}',
                              style: context.bodyMedium,
                            )
                          ]),
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO: reviews screen
                      },
                      child: Text(
                        'Read',
                        style: context.displayMediumAction,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: .25.sw,
                  width: double.maxFinite,
                  child: LayoutBuilder(builder: (context, constraints) {
                    final itemSize = constraints.maxWidth / 4 - AppSpacing.sm;
                    return Row(
                      spacing: AppSpacing.sm,
                      children: reviews
                          .reviewsImages()
                          .take(4)
                          .toList()
                          .asMap()
                          .entries
                          .map((element) {
                        return Expanded(
                          child: CachedNetworkImage(
                            imageUrl: element.value,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                height: itemSize,
                                width: itemSize,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.fill),
                                  borderRadius: AppStyles.borderRadiusM,
                                ),
                                child: element.key == 3
                                    //  &&
                                    //         reviews.numOfReviewsImages() > 4
                                    ? Stack(
                                        children: [
                                          // Dark overlay
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              height: itemSize,
                                              width: itemSize,
                                              decoration: BoxDecoration(
                                                color: AppColors.overlayColor,
                                                borderRadius:
                                                    AppStyles.borderRadiusM,
                                              ),
                                            ),
                                          ),
                                          // Text on top of the overlay
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '+${reviews.numOfReviewsImages() - 4}',
                                              style: context.headlineMedium
                                                  .copyWith(
                                                      color:
                                                          AppColors.background),
                                            ),
                                          ),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                              );
                            },
                          ),
                        );
                      }).toList(),
                    );
                  }),
                )
              ],
            ),
          );
  }
}
