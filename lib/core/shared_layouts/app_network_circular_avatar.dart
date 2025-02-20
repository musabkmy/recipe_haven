import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNetworkCircularAvatar extends StatelessWidget {
  const AppNetworkCircularAvatar(
      {super.key, required this.imageUrl, this.size, this.maxSize});
  final String imageUrl;

  ///Default: 54.sp
  final double? size;

  ///Default: 100
  final double? maxSize;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: size ?? 54.sp,
        width: size ?? 54.sp,
        constraints: BoxConstraints(
          maxHeight: maxSize ?? 100,
          maxWidth: maxSize ?? 100,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider),
        ),
      ),
    );
  }
}
