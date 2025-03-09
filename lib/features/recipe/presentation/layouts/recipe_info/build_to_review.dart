import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/config/routes/auto_route.gr.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/recipe/domain/entities/review_entity.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/shared/build_reviews_thumbs_gallery.dart';

class BuildToReviews extends StatelessWidget {
  const BuildToReviews({
    super.key,
    required this.reviews,
    // required this.router,
  });

  final Reviews reviews;
  // final StackRouter router;

  @override
  Widget build(BuildContext context) {
    return reviews.isEmpty
        ? SizedBox.shrink()
        : Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.minHorizontal,
          ).copyWith(top: AppSpacing.x3l),
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
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint(context.routeData.parent?.name ?? 'no parent');
                      context.navigateTo(ReviewsRoute(reviews: reviews));
                    },
                    child: Text('Read', style: context.displayMediumAction),
                  ),
                ],
              ),
              BuildReviewsThumbsGallery(reviews.creatorsReviewImages()),
            ],
          ),
        );
  }
}
