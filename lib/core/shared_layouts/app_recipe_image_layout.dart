import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/app_styles.dart';
import 'package:recipe_haven/core/services/image/network_image_service.dart';

class AppImageLayout extends StatelessWidget {
  const AppImageLayout({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,
    this.borderRadius,
    this.fit = BoxFit.fill,
    this.child,
    // Add these new parameters
    // this.cacheWidth,
    // this.cacheHeight,
  });

  final double height;
  final double width;
  final String imageUrl;
  final Widget? child;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  // final double? cacheWidth; // New: Optional cache dimensions
  // final double? cacheHeight;

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return AppNetworkImage(
      imageUrl: imageUrl,
      // Pass cache dimensions (or auto-calculate if not provided)
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) {
        return Container(
          // height: height,
          // width: width,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: fit),
            borderRadius: borderRadius ?? AppStyles.borderRadiusM,
          ),
          child: child,
        );
      },
    );
  }
}
