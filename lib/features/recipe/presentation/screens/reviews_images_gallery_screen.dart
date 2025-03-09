import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
    reviewsImages.forEach((creator, images) {
      for (var imageUrl in images) {
        widgets.add(_BuildImage(creator, imageUrl));
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
  const _BuildImage(this.creatorId, this.image);
  final String creatorId;
  final String image;
  @override
  Widget build(BuildContext context) {
    return BuildRecipeImageLayout(
      height: double.maxFinite,
      width: double.maxFinite,
      imageUrl: image,
    );
  }
}
