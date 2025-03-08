import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReviewsImagesGalleryScreen extends StatelessWidget {
  const ReviewsImagesGalleryScreen(this.reviewsImages, {super.key});
  final List<String> reviewsImages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Wrap(children: []));
  }
}
