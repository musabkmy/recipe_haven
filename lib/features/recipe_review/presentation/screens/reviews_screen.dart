import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart'
    show getIt;
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/app_base_bar.dart';
import 'package:recipe_haven/core/shared_layouts/app_spacer.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/review_entity.dart';
import 'package:recipe_haven/features/recipe_review/presentation/create_review_bloc/create_review_bloc.dart';
import 'package:recipe_haven/features/recipe_review/presentation/get_reviews_data_bloc/get_reviews_data_bloc.dart';
import 'package:recipe_haven/features/recipe_review/presentation/layouts/build_review_layout.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/layouts.dart';
import 'package:recipe_haven/features/recipe_review/presentation/layouts/reviews_layouts.dart';

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
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final bloc = getIt<CreateReviewBloc>();
              if (bloc.isClosed) {
                getIt.resetLazySingleton<CreateReviewBloc>();
              }
              return getIt<CreateReviewBloc>();
            },
          ),
          BlocProvider(
            create: (context) {
              final bloc = getIt<GetReviewsDataBloc>();
              if (bloc.isClosed) {
                getIt.resetLazySingleton<GetReviewsDataBloc>();
              }
              return getIt<GetReviewsDataBloc>();
            },
          ),
        ],
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
              return BuildReviewLayout(reviews[index]);
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
