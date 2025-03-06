import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/recipe/domain/entities/recipe_entity.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/shared/build_circular_button.dart';

class BuildTopInfos extends StatelessWidget {
  const BuildTopInfos({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key('BuildTopInfos'),
      spacing: AppSpacing.md,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(recipe.title, style: context.headlineLarge),
        _buildRating(recipe, context),
        SizedBox.shrink(),
        _buildShareAndFav(recipe),
      ],
    );
  }
}

Row _buildShareAndFav(Recipe recipe) {
  return Row(
    spacing: AppSpacing.md.sp,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      BuildCircularButton(
        iconData: AppIcons.share,
        label: 'Share',
        onTap: () {},
      ),
      BuildCircularButton(
        iconData: CupertinoIcons.heart,
        label: recipe.usersEngagement.likesCount.countFormat,
        onTap: () {},
      ),
    ],
  );
}

Column _buildRating(Recipe recipe, BuildContext context) {
  return Column(
    children: [
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
                    ? AppIcons.halfStar
                    : (recipe.usersEngagement.rating - (index + 1)) < 0.1
                        ? AppIcons.noStar
                        : AppIcons.fullStar,
                color: (recipe.usersEngagement.rating - (index + 1)) < 0.1
                    ? AppColors.grey300
                    : AppColors.orange,
                size: 32.spMin,
              );
            }),
      ),
      Text('Based on ${recipe.usersEngagement.ratingCount.countFormat} ratings',
          style: context.caption),
    ],
  );
}

// Column(
//       spacing: AppSpacing.md,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//             height: 600.spMin,
//             width: double.maxFinite,
//             child: CachedNetworkImage(
//               imageUrl: recipe.imageUrl,
//               imageBuilder: (context, imageProvider) =>
//                   Image(fit: BoxFit.cover, image: imageProvider),
//               progressIndicatorBuilder: (context, url, progress) => Center(
//                 child: CircularProgressIndicator(value: progress.progress),
//               ),
//             )),
//         Text(recipe.title, style: context.headlineLarge),
//         SizedBox(
//           height: 30,
//           child: ListView.builder(
//               itemCount: 5,
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return Icon(
//                   0.9 >= (recipe.usersEngagement.rating - (index + 1)) &&
//                           0.1 <= (recipe.usersEngagement.rating - (index + 1))
//                       ? Icons.star_half_rounded
//                       : (recipe.usersEngagement.rating - (index + 1)) < 0.1
//                           ? Icons.star_border_rounded
//                           : Icons.star_rounded,
//                   color: (recipe.usersEngagement.rating - (index + 1)) < 0.1
//                       ? AppColors.grey300
//                       : AppColors.orange,
//                   size: 32.spMin,
//                 );
//               }),
//         ),
//         Text(
//             'Based on ${recipe.usersEngagement.ratingCount.countFormat} ratings',
//             style: context.caption),
//         SizedBox.shrink(),
//         Row(
//           spacing: AppSpacing.md.sp,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             BuildCircularButton(
//               iconData: AppIcons.share_outlinedare,
//               label: 'Share',
//               onTap: () {},
//             ),
//             BuildCircularButton(
//               iconData: CupertinoIcons.heart,
//               label: recipe.usersEngagement.likesCount.countFormat,
//               onTap: () {},
//             ),
//           ],
//         ),
//       ],
//     );
