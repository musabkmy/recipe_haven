import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/date_time_extension.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/app_box_shadows.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/shared_layouts.dart';
import 'package:recipe_haven/features/recipe/domain/entities/review_entity.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/shared/build_reviews_thumbs_gallery.dart';

const double _profileImageSize = 42;

@RoutePage()
class ReviewsScreen extends StatelessWidget {
  ReviewsScreen(this.reviews, {super.key});
  final Reviews reviews;
  final commentSectionHeight = .14.sh;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: RecipeAppBarLeading(),
        title: Text('Comments', style: context.headlineSmall),
        toolbarHeight: 68,
      ),
      body: Stack(
        children: [
          reviews.isNotEmpty
              ? BuildCommentsList(
                reviews: reviews,
                commentSectionHeight: commentSectionHeight,
              )
              : Center(child: Text('There is no Reviews yet')),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            height: commentSectionHeight,
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.sl,
              ).copyWith(top: AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.background,
                boxShadow: [AppBoxShadows.soft],
              ),
              child: Row(
                spacing: AppSpacing.sl,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      AppIcons.uploadImage,
                      size: 32,
                      color: AppColors.deepOrange,
                    ),
                  ),
                  Expanded(
                    child: AppTextFormField(
                      hintText: 'write a comment',
                      initialValue: '',
                      onChanged: (p0) {
                        //TODO: Add Comment
                      },
                    ),
                  ),
                  AppTextButton(label: 'Send', onPressed: null),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildCommentsList extends StatelessWidget {
  const BuildCommentsList({
    super.key,
    required this.reviews,
    required this.commentSectionHeight,
  });

  final Reviews reviews;
  final double commentSectionHeight;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
            child: BuildReviewsThumbsGallery(reviews.reviewsImages()),
          ),
          AppSpacer(height: 42),
          SizedBox(height: AppSpacing.md),
          ...reviews.map((element) => BuildCommentLayout(element)),
          SizedBox(height: commentSectionHeight),
        ],
      ),
    );
  }
}

class BuildCommentLayout extends StatelessWidget {
  const BuildCommentLayout(this.review, {super.key});
  final Review review;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.minHorizontal,
      ).copyWith(bottom: AppSpacing.xxl),
      child: Row(
        spacing: AppSpacing.md,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: _profileImageSize,
            child: AppNetworkCircularAvatar(
              imageUrl: review.userProfilePic,
              name: review.userName,
              maxSize: _profileImageSize,
            ),
          ),
          Expanded(
            child: Column(
              spacing: AppSpacing.sm,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.top,
                            child: AppTextButton(
                              onPressed: () {
                                //TODO: to creator profile
                              },
                              label: review.userName,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\n${review.publishedAt.toTimeAgoHumanFormat()}',
                            style: context.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.flag),
                  ],
                ),
                Column(
                  spacing: AppSpacing.lg,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.description,
                      style: context.bodyMedium,
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      spacing: AppSpacing.lg,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //TODO: add fav comment
                          },
                          child: AppIconText(
                            icon: AppIcons.favorite,
                            label: review.favCount.toString(),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //TODO: add reply
                          },
                          child: AppIconText(
                            icon: AppIcons.replay,
                            label: 'Replay',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
