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
          ClipOval(
            child: CachedNetworkImage(
                height: 54.spMin,
                width: 54.spMin,
                imageUrl: creator.profilePic),
          ),
          SizedBox(width: AppSpacing.md),
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
