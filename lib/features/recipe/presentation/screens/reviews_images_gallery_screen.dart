import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_haven/config/routes/auto_route.gr.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/core/shared_layouts/app_base_bar.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/layouts.dart';

@RoutePage()
class ReviewsImagesGalleryScreen extends StatefulWidget {
  final Map<String, List<String>> reviewsImages;

  const ReviewsImagesGalleryScreen(this.reviewsImages, {super.key});

  @override
  State<ReviewsImagesGalleryScreen> createState() =>
      _ReviewsImagesGalleryScreenState();
}

class _ReviewsImagesGalleryScreenState
    extends State<ReviewsImagesGalleryScreen> {
  late final List<_BuildImage> widgets;

  @override
  void initState() {
    super.initState();
    widgets = _buildWidgets(widget.reviewsImages);
  }

  List<_BuildImage> _buildWidgets(Map<String, List<String>> reviewsImages) {
    final widgets = <_BuildImage>[];
    reviewsImages.forEach((reviewId, images) {
      for (var imageUrl in images) {
        widgets.add(_BuildImage(reviewId, imageUrl));
      }
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBaseBar(
        title: 'Gallery (${widgets.length})',
        withElevation: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
        child: GridView.builder(
          padding: EdgeInsets.only(top: AppSpacing.lg),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: AppSpacing.sm,
            mainAxisSpacing: AppSpacing.sm,
          ),
          itemCount: widgets.length,
          itemBuilder: (context, index) {
            return widgets[index];
          },
        ),
      ),
    );
  }
}

class _BuildImage extends StatelessWidget {
  const _BuildImage(this.reviewId, this.imageUrl);
  final String reviewId;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final tag = '$reviewId/$imageUrl';
    return GestureDetector(
      onTap:
          () => context.router.push(
            ReviewFullRouteImageRoute(
              imageUrl: imageUrl,
              reviewId: reviewId,
              tag: tag,
            ),
          ),
      child: Hero(
        tag: tag,
        transitionOnUserGestures: true,
        // createRectTween: (begin, end) {
        //   return RectTween(
        //     begin: Rect.fromCircle(center: Offset(100, 150), radius: 250),
        //     end: end,
        //   );
        // },
        child: AppImageLayout(
          height: double.maxFinite,
          width: double.maxFinite,
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
