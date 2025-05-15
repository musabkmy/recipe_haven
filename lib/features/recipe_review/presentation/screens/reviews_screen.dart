import 'package:collection/collection.dart' show ListEquality;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart'
    show getIt;
import 'package:recipe_haven/config/utils/memoize.dart';
import 'package:recipe_haven/core/shared_layouts/app_base_bar.dart';
import 'package:recipe_haven/core/shared_layouts/app_spacer.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/review_entity.dart';
import 'package:recipe_haven/features/recipe_review/presentation/create_review_bloc/create_review_bloc.dart';
import 'package:recipe_haven/features/recipe_review/presentation/get_reviews_data_bloc/get_reviews_data_bloc.dart';
import 'package:recipe_haven/features/recipe_review/presentation/providers/reviews_temp_data_provider.dart';
import 'package:recipe_haven/features/recipe_review/presentation/screens/review_head.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/layouts.dart';
import 'package:recipe_haven/features/recipe_review/presentation/layouts/reviews_layouts.dart';

final _commentSectionHeight = .14.sh;
final _createCommentImageSectionHeight = .07.sh;

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});
  // final dynamic recipeRef;
  // final Reviews currentReviews;
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
            _BuildCommentsListLayout(),
            BuildInReviewsCreateReviewLayout(
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
  const _BuildCommentsListLayout();
  @override
  Widget build(BuildContext context) {
    return _BuildCommentsListLayoutBody();

    // return currentReviews.isNotEmpty
    //         ? _BuildCommentsListLayoutBody(currentReviews)
    //         : Center(child: Text('There is no Reviews yet'));
  }
}

class _BuildCommentsListLayoutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeId = ReviewsHead.of(context)?.recipeId ?? '';
    final reviews = ReviewsHead.of(context)?.currentReviews ?? [];
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
          _BuildReviewsLayout(recipeId: recipeId, reviews: reviews),
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

class _BuildReviewsLayout extends StatelessWidget {
  const _BuildReviewsLayout({required this.recipeId, required this.reviews});

  final String recipeId;
  final Reviews reviews;

  static final _memoizedMerge = Memoize<_MergeInput, List<Review>>(
    (input) => _mergeReviews(input.base, input.temp),
  );

  @override
  Widget build(BuildContext context) {
    final tempReviews = context.select<ReviewsTempDataProvider, List<Review>?>(
      (p) => p.getAllData(recipeId).cast<Review>(),
    );
    // reviews.addAll(tempReviews?.where((item) => !reviews.contains(item)) ?? []);
    final input = _MergeInput(reviews, tempReviews);

    // Returns cached list if inputs are the same
    final mergedReviews = _memoizedMerge(input);
    // reviews.addAll(tempReviews ?? []);
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return BuildReviewLayout(
          key: ValueKey(mergedReviews[index].id),
          mergedReviews[index],
        );
      }, childCount: mergedReviews.length),
    );
  }
}

// Helper class to compare inputs
class _MergeInput {
  final List<Review> base;
  final List<Review>? temp;

  _MergeInput(this.base, this.temp);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _MergeInput &&
          const ListEquality().equals(base, other.base) &&
          const ListEquality().equals(temp, other.temp);

  @override
  int get hashCode => Object.hash(
    const ListEquality().hash(base),
    const ListEquality().hash(temp),
  );
}

// Actual merge logic (no memoization here)
List<Review> _mergeReviews(List<Review> base, List<Review>? temp) {
  return [...base, ...?temp?.where((t) => !base.any((r) => r.id == t.id))];
}
