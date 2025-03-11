import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/app_styles.dart';
import 'package:recipe_haven/core/shared_layouts/app_loading_layout.dart';

class AppImageLayout extends StatelessWidget {
  const AppImageLayout({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,

    ///AppStyles.borderRadiusM
    this.borderRadius,
    this.fit = BoxFit.fill,
    this.child,
  });
  final double height;
  final double width;
  final String imageUrl;
  final Widget? child;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: fit),
            borderRadius: borderRadius ?? AppStyles.borderRadiusM,
          ),
          child: child,
        );
      },
      placeholder: (context, url) => AppLoadingLayout(),
    );
  }
}
