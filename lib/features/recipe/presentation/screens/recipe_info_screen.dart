import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/recipe/domain/entities/review_entity.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/recipe_info/recipe_info_layouts.dart';
import 'package:recipe_haven/features/recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart';

class RecipeInfoScreen extends StatelessWidget {
  const RecipeInfoScreen({super.key});
  static const id = 'RecipesInfoScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _RecipeInfoBody(),
    );
  }
}

class _RecipeInfoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeInfoBloc, RecipeInfoState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is RecipeInfoSuccess) {
            final recipe = state.recipe;
            return SingleChildScrollView(
                padding: EdgeInsets.only(bottom: AppSpacing.xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildTop(recipe: recipe),
                    SizedBox(
                        height: 50,
                        child: Divider(thickness: 2, color: AppColors.grey300)),
                    BuildCreator(creator: recipe.creator),
                    BuildDescription(recipe: recipe),
                    BuildToReviews(reviews: recipe.reviews),
                    SizedBox(
                        height: 30,
                        child: Divider(thickness: 2, color: AppColors.grey300)),
                  ],
                ));
          } else {
            return Center(
              child: Text('Failed Loading'),
            );
          }
        });
  }
}

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
                          style: context.headlineSmall.copyWith(height: 2),
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
                        style: context.buttonLabel
                            .copyWith(color: AppColors.lightOrange),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: .25.sw,
                  width: double.maxFinite,
                  child: LayoutBuilder(builder: (context, constraints) {
                    final itemSize = constraints.maxWidth / 4 - AppSpacing.md;
                    return Row(
                      spacing: AppSpacing.md,
                      children: reviews.reviewsImages().take(4).map((element) {
                        return Expanded(
                          child: CachedNetworkImage(
                            imageUrl: element,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                height: itemSize,
                                width: itemSize,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(4),
                                ),
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
