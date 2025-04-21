import 'package:flutter/widgets.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/review_entity.dart';
import 'package:recipe_haven/features/recipe_review/presentation/layouts/reviews_layouts.dart';

class BuildReviewLayout extends StatefulWidget {
  const BuildReviewLayout(this.review, {super.key});
  final Review review;

  @override
  State<BuildReviewLayout> createState() => _BuildReviewLayoutState();
}

class _BuildReviewLayoutState extends State<BuildReviewLayout> {
  final PageController controller = PageController();
  Review get review => widget.review;

  List<String> get imagesUrl => review.imagesUrl;

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
          BuildProfilePic(
            name: review.userName,
            profilePic: review.userProfilePic,
          ),
          Expanded(
            child: Column(
              spacing: AppSpacing.sm,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildNameAndDate(
                  name: review.userName,
                  publishedAt: review.publishedAt,
                ),
                Column(
                  spacing: AppSpacing.lg,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildCommentText(comment: review.comment),
                    BuildImages(controller: controller, imagesUrl: imagesUrl),
                    BuildReviewActions(
                      reviewRef: review.ref,
                      favCount: review.favCount,
                    ),
                    BuildSubReviews(
                      reviewId: review.id,
                      subsRef: review.subsRef,
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
