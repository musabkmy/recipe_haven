import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/context_extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/recipe/domain/entities/creator_entity.dart';

class BuildCreator extends StatelessWidget {
  const BuildCreator({
    super.key,
    required this.creator,
  });

  final Creator creator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: creator.profilePic,
            imageBuilder: (context, imageProvider) => Container(
              height: 54.sp,
              width: 54.sp,
              constraints: BoxConstraints(
                maxHeight: 100,
                maxWidth: 100,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider),
              ),
            ),
          ),
          SizedBox(
              width: AppSpacing.sm.sp), // Replace with appropriate width value
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(creator.name, style: context.displayMedium),
              Text(creator.profession, style: context.bodyMedium),
              Text(creator.portfolioLink,
                  style: context.displayMedium
                      .copyWith(color: AppColors.lightOrange)),
            ],
          )
        ],
      ),
    );
  }
}
