import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/review_entity.dart';
import 'package:recipe_haven/features/recipe_review/presentation/layouts/reviews_layouts.dart';

@immutable
class BuildReviewLayout extends StatefulWidget {
  const BuildReviewLayout(this.review, {super.key});
  final Review review;
  // final ValueKey key;

  @override
  State<BuildReviewLayout> createState() => _BuildReviewLayoutState();
}

class _BuildReviewLayoutState extends State<BuildReviewLayout> {
  final PageController controller = PageController();
  //set it as late to compare them when updating the list of reviews
  late Review _review;
  late List<String> _imagesUrl;

  Logger logger = Logger('BuildReviewLayout');

  @override
  void initState() {
    super.initState();
    _review = widget.review;
    _imagesUrl = _review.imagesUrl;
  }

  //to prevent unnecessary rebuilds
  @override
  void didUpdateWidget(covariant BuildReviewLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget called: ${widget.review != oldWidget.review}');
    if (widget.review != oldWidget.review) {
      logger.info('rebuilds: ${widget.review.id}');
      _review = widget.review;
      _imagesUrl = _review.imagesUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.info('built: ${_review.id}');
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
            name: _review.userName,
            profilePic: _review.userProfilePic,
          ),
          Expanded(
            child: Column(
              spacing: AppSpacing.sm,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildNameAndDate(
                  name: _review.userName,
                  publishedAt: _review.publishedAt,
                ),
                Column(
                  spacing: AppSpacing.lg,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildCommentText(comment: _review.comment),
                    BuildImages(controller: controller, imagesUrl: _imagesUrl),
                    BuildReviewActions(
                      reviewRef: _review.ref,
                      favCount: _review.favCount,
                    ),
                    BuildSubReviews(
                      reviewId: _review.id,
                      subsRef: _review.subsRef,
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
