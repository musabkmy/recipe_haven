import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/app_styles.dart';

class BuildRecipeImageLayout extends StatelessWidget {
  const BuildRecipeImageLayout({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,
    this.child,
  });
  final double height;
  final double width;
  final String imageUrl;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
            borderRadius: AppStyles.borderRadiusM,
          ),
          child: child,
        );
      },
      placeholder: (context, url) => CircularProgressIndicator(),
    );
  }
}
