import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/services/image/network_image_service.dart';

class AppItemNetworkImage extends StatelessWidget {
  const AppItemNetworkImage({
    super.key,
    required this.imageUrl,
    required this.stackChildren,
    this.height,
    this.width,
  });
  final String imageUrl;
  final List<Positioned> stackChildren;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return AppNetworkImage(
      imageUrl: imageUrl,
      height: height ?? .3.sh,
      width: width ?? .5.sw,
      imageBuilder:
          (context, imageProvider) => SizedBox(
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: AppStyles.borderRadiusML,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ...stackChildren,
              ],
            ),
          ),
    );
  }
}
