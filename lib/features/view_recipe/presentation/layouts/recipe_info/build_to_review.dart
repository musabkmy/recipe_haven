import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/config/routes/auto_route.gr.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/review_entity.dart';
import 'package:recipe_haven/features/view_recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/shared/build_reviews_thumbs_gallery.dart';

class BuildToReviews extends StatelessWidget {
  const BuildToReviews({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      RecipeInfoBloc,
      RecipeInfoState,
      (ReviewsMap?, dynamic)
    >(
      selector:
          (state) =>
              state is RecipeInfoSuccess
                  ? (state.recipe.reviews, state.recipe.id)
                  : (null, null),
      builder: (context, data) {
        final reviews = data.$1?.values.toList();
        final recipeRef = data.$2;
        return reviews != null && recipeRef != null
            ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.minHorizontal,
              ).copyWith(top: AppSpacing.x3l),
              child: Column(
                spacing: AppSpacing.lg,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTitle(
                        context,
                        reviews.length,
                        reviews.hasImages,
                        reviews.numOfReviewsImages(),
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint(
                            context.routeData.parent?.name ?? 'no parent',
                          );
                          context.navigateTo(
                            ReviewsRoute(
                              currentReviews: reviews,
                              recipeRef: recipeRef,
                            ),
                          );
                        },
                        child: Text('Read', style: context.displayMediumAction),
                      ),
                    ],
                  ),
                  BuildReviewsThumbsGallery(reviews.reviewsImages()),
                ],
              ),
            )
            : SizedBox.shrink();
      },
    );
  }

  Text _buildTitle(
    BuildContext context,
    int length,
    bool hasImages,
    int numOfReviewsImages,
  ) {
    return Text.rich(
      TextSpan(
        text: 'Reviews\n',
        style: context.displayLarge.copyWith(height: 2),
        children: [
          TextSpan(
            text:
                '$length comments${hasImages ? ' - $numOfReviewsImages images' : ''}',
            style: context.bodyMedium,
          ),
        ],
      ),
    );
  }
}
