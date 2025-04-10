import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart'
    show getIt;
import 'package:recipe_haven/config/extensions/date_time_extension.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/app_base_bar.dart';
import 'package:recipe_haven/core/shared_layouts/app_icon_text.dart';
import 'package:recipe_haven/core/shared_layouts/app_network_circular_avatar.dart';
import 'package:recipe_haven/core/shared_layouts/app_spacer.dart';
import 'package:recipe_haven/core/shared_layouts/app_text_button.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/review_entity.dart';
import 'package:recipe_haven/features/recipe_review/presentation/create_review_bloc/create_review_bloc.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/layouts.dart';
import 'package:recipe_haven/features/recipe_review/presentation/layouts/reviews_layouts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

const double _profileImageSize = 42;
final _commentSectionHeight = .14.sh;
final _createCommentImageSectionHeight = .07.sh;

@RoutePage()
class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen(this.recipeRef, this.currentReviews, {super.key});
  final dynamic recipeRef;
  final Reviews currentReviews;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBaseBar(
        // leading: RecipeAppBarLeading(),
        title: 'Comments',
      ),
      body: BlocProvider(
        create: (context) {
          final bloc = getIt<CreateReviewBloc>();
          if (bloc.isClosed) {
            getIt.resetLazySingleton<CreateReviewBloc>();
          }
          return getIt<CreateReviewBloc>();
        },
        child: Stack(
          children: [
            _BuildCommentsListLayout(currentReviews),
            BuildInReviewsCreateReviewLayout(
              recipeRef,
              _commentSectionHeight,
              _createCommentImageSectionHeight,
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildCommentsListLayout extends StatelessWidget {
  const _BuildCommentsListLayout(this.currentReviews);
  final Reviews currentReviews;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateReviewBloc, CreateReviewState, Review?>(
      selector:
          (state) => switch (state) {
            CreateReviewSuccess(addedReview: final addedReview) => addedReview,
            _ => null,
          },
      builder: (context, review) {
        final reviews = review.letOrElse(
          (review) => [...currentReviews, review],
          orElse: () => currentReviews,
        );
        return reviews.isNotEmpty
            ? _BuildCommentsListLayoutBody(reviews)
            : Center(child: Text('There is no Reviews yet'));
      },
    );
  }
}

class _BuildCommentsListLayoutBody extends StatelessWidget {
  const _BuildCommentsListLayoutBody(this.reviews);

  final Reviews reviews;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: CustomScrollView(
        // spacing: AppSpacing.md,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
            sliver: SliverToBoxAdapter(
              child: BuildReviewsThumbsGallery(reviews.reviewsImages()),
            ),
          ),
          SliverToBoxAdapter(child: AppSpacer(height: AppSpacing.xxl)),
          // Use ListView.builder for better performance
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _BuildCommentLayout(reviews[index]);
            }, childCount: reviews.length),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: _commentSectionHeight + _createCommentImageSectionHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildCommentLayout extends StatelessWidget {
  _BuildCommentLayout(this.review) : imagesUrl = review.imagesUrl;
  final Review review;
  final List<String> imagesUrl;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.minHorizontal,
      ).copyWith(bottom: AppSpacing.xl),
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
                            style: context.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Icon(AppIcons.flag),
                  ],
                ),
                Column(
                  spacing: AppSpacing.lg,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.comment, style: context.bodyMedium),
                    if (imagesUrl.isNotEmpty)
                      SizedBox(
                        height: .4.sh,
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView(
                                controller: controller,
                                scrollDirection: Axis.horizontal,
                                children:
                                    imagesUrl
                                        .map(
                                          (item) => AppImageLayout(
                                            height: .4.sh,
                                            width: double.maxFinite,
                                            imageUrl: item,
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                            if (imagesUrl.length > 1)
                              Padding(
                                padding: EdgeInsets.only(top: AppSpacing.md),
                                child: SmoothPageIndicator(
                                  controller: controller,
                                  count: imagesUrl.length,
                                  effect: WormEffect(
                                    dotHeight: 8,
                                    dotWidth: 8,
                                    dotColor: AppColors.grey400,
                                    activeDotColor: AppColors.lightOrange,
                                  ),
                                ),
                              ),
                          ],
                        ),
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
