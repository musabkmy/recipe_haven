import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/config/routes/auto_route.gr.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/shared/build_recipe_image_layout.dart';

class BuildReviewsThumbsGallery extends StatelessWidget {
  const BuildReviewsThumbsGallery(this.reviewsImages, {super.key});
  final List<String> reviewsImages;
  @override
  Widget build(BuildContext context) {
    return reviewsImages == []
        ? SizedBox.shrink()
        : GestureDetector(
          onTap:
              () => context.router.push(
                ReviewsImagesGalleryRoute(reviewsImages: reviewsImages),
              ),
          child: SizedBox(
            height: .25.sw,
            width: double.maxFinite,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemSize = constraints.maxWidth / 4 - AppSpacing.sm;
                return Row(
                  spacing: AppSpacing.sm,
                  children:
                      reviewsImages.asMap().entries.map((element) {
                        return Expanded(
                          child: BuildRecipeImageLayout(
                            height: itemSize,
                            width: itemSize,
                            imageUrl: element.value,
                            child:
                                element.key == 3 && reviewsImages.length >= 5
                                    ? _buildToGalleryImage(itemSize, context)
                                    : SizedBox.shrink(),
                          ),
                        );
                      }).toList(),
                );
              },
            ),
          ),
        );
  }

  Widget _buildToGalleryImage(double itemSize, BuildContext context) {
    return Stack(
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
              color: AppColors.lightOverlayColor,
              borderRadius: AppStyles.borderRadiusM,
            ),
          ),
        ),
        // Text on top of the overlay
        Align(
          alignment: Alignment.center,
          child: Text(
            '+${reviewsImages.length - 4}',
            style: context.headlineMedium.copyWith(color: AppColors.background),
          ),
        ),
      ],
    );
  }
}
