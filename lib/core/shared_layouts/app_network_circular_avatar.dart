import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/core/services/image/network_image_service.dart';

class AppNetworkCircularAvatar extends StatelessWidget {
  ///imageUrl != null || name != null

  const AppNetworkCircularAvatar({
    super.key,
    this.imageUrl,
    this.size,
    this.maxSize,
    this.name,
  }) : assert(imageUrl != null || name != null);
  final String? imageUrl;
  final String? name;

  ///Default: 54.sp
  final double? size;

  ///Default: 100
  final double? maxSize;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? AppNetworkImage(
          imageUrl: imageUrl!,
          imageBuilder:
              (context, imageProvider) => _BuildCircularLayout(
                size: size,
                maxSize: maxSize,
                image: imageProvider,
              ),
        )
        : _BuildCircularLayout(
          size: size,
          maxSize: maxSize,
          nameFirstChar: name!.characters.first.toUpperCase(),
        );
  }
}

class _BuildCircularLayout extends StatelessWidget {
  const _BuildCircularLayout({
    required this.size,
    required this.maxSize,
    this.image,
    this.nameFirstChar,
  });
  final ImageProvider<Object>? image;
  final String? nameFirstChar;
  final double? size;
  final double? maxSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 54.sp,
      width: size ?? 54.sp,
      alignment: Alignment.center,
      constraints: BoxConstraints(
        maxHeight: maxSize ?? 100,
        maxWidth: maxSize ?? 100,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.grey200,
        image: image.let((image) => DecorationImage(image: image)),
      ),
      child: nameFirstChar.let((char) => Text(char, style: context.bodySmall)),
    );
  }
}
