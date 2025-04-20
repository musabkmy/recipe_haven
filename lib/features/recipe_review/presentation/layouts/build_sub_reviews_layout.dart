import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/core/shared_layouts/app_loading_layout.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/sub_review_entity.dart';
import 'package:recipe_haven/features/recipe_review/presentation/get_reviews_data_bloc/get_reviews_data_bloc.dart';

import 'shared/shared.dart';

class BuildSubReviews extends StatelessWidget {
  const BuildSubReviews({
    super.key,
    required this.reviewId,
    required this.subsRef,
  });
  final String reviewId;
  final List<dynamic> subsRef;

  @override
  Widget build(BuildContext context) {
    if (subsRef.isEmpty) {
      return SizedBox.shrink();
    }
    return BlocSelector<
      GetReviewsDataBloc,
      GetReviewsDataState,
      SubReviewsState
    >(
      selector: (state) => state.getSubReviewState(reviewId),
      builder:
          (context, state) => switch (state) {
            SubReviewsLoading() => AppLoadingLayout(),
            SubReviewsFailure(error: final error) => Text(error),
            SubReviewsSuccess(subReviewsMap: final subReviewsMap) =>
              _BuildSubReviewsLayout(
                subReviewsMap.values.cast<SubReview>().toList(),
              ),
            _ => _BuildShowHideSubReviewsLayout(
              reviewId: reviewId,
              subsRef: subsRef,
            ),
          },
    );
  }
}

class _BuildShowHideSubReviewsLayout extends StatelessWidget {
  const _BuildShowHideSubReviewsLayout({
    required this.reviewId,
    required this.subsRef,
  });

  final String reviewId;
  final List subsRef;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text('show replies'),
      onTap:
          () => context.read<GetReviewsDataBloc>().add(
            GetSubReviewsEvent(reviewId, subsRef),
          ),
    );
  }
}

class _BuildSubReviewsLayout extends StatelessWidget {
  const _BuildSubReviewsLayout(this.subReviews);
  final List<SubReview> subReviews;

  @override
  Widget build(BuildContext context) {
    if (subReviews.isEmpty) {
      return SizedBox.shrink();
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 300),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder:
            (context, index) => _BuildSubReviewLayout(subReviews[index]),
        itemCount: subReviews.length,
      ),
    );
  }
}

class _BuildSubReviewLayout extends StatelessWidget {
  const _BuildSubReviewLayout(this.subReview);

  final SubReview subReview;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSpacing.md,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildProfilePic(
          name: subReview.userName,
          profilePic: subReview.userProfilePic,
        ),
        Expanded(
          child: Column(
            spacing: AppSpacing.sm,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildNameAndDate(
                name: subReview.userName,
                publishedAt: subReview.publishedAt,
              ),
              SizedBox(),
              BuildCommentText(comment: subReview.comment),
            ],
          ),
        ),
      ],
    );
  }
}
