import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/features/recipe/domain/entities/recipe_entity.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/shared/build_circular_button.dart';

import '../../../../../constants/constants.dart';

class BuildTop extends StatelessWidget {
  const BuildTop({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.md,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 600.spMin,
            width: double.maxFinite,
            child: CachedNetworkImage(
              imageUrl: recipe.imageUrl,
              imageBuilder: (context, imageProvider) =>
                  Image(fit: BoxFit.cover, image: imageProvider),
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(value: progress.progress),
              ),
            )),
        Text(recipe.title, style: context.headlineLarge),
        SizedBox(
          height: 30,
          child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Icon(
                  0.9 >= (recipe.usersEngagement.rating - (index + 1)) &&
                          0.1 <= (recipe.usersEngagement.rating - (index + 1))
                      ? Icons.star_half_rounded
                      : (recipe.usersEngagement.rating - (index + 1)) < 0.1
                          ? Icons.star_border_rounded
                          : Icons.star_rounded,
                  color: (recipe.usersEngagement.rating - (index + 1)) < 0.1
                      ? AppColors.grey300
                      : AppColors.orange,
                  size: 32.spMin,
                );
              }),
        ),
        Text(
            'Based on ${recipe.usersEngagement.ratingCount.countFormat} ratings',
            style: context.caption),
        SizedBox.shrink(),
        Row(
          spacing: AppSpacing.md.sp,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildCircularButton(
              iconData: Icons.share,
              label: 'Share',
              onTap: () {},
            ),
            BuildCircularButton(
              iconData: CupertinoIcons.heart,
              label: recipe.usersEngagement.likesCount.countFormat,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
