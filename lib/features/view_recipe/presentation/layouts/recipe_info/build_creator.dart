import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/app_network_circular_avatar.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/creator_entity.dart';

class BuildCreator extends StatelessWidget {
  const BuildCreator({super.key, required this.creator});

  final Creator? creator;

  @override
  Widget build(BuildContext context) {
    return creator == null
        ? SizedBox.shrink()
        : Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
          child: Row(
            children: [
              creator!.profilePic != null
                  ? AppNetworkCircularAvatar(imageUrl: creator!.profilePic!)
                  : SizedBox.shrink(),
              SizedBox(
                width: AppSpacing.sm.sp,
              ), // Replace with appropriate width value
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(creator!.name, style: context.displayMedium),
                  Text(creator!.profession ?? '', style: context.bodyMedium),
                  Text(
                    creator!.portfolioLink ?? '',
                    style: context.displayMediumAction,
                  ),
                ],
              ),
            ],
          ),
        );
  }
}
