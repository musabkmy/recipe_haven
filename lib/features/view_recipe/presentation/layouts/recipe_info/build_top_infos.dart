import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/engagement_entity.dart';
import 'package:recipe_haven/features/view_recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/shared/build_circular_button.dart';

class BuildTopInfos extends StatelessWidget {
  const BuildTopInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      RecipeInfoBloc,
      RecipeInfoState,
      (String?, Engagement?)
    >(
      selector:
          (state) =>
              state is RecipeInfoSuccess
                  ? (state.recipe.title, state.recipe.usersEngagement)
                  : (null, null),

      builder: (context, data) {
        final title = data.$1;
        final engagement = data.$2;
        return title != null && engagement != null
            ? Column(
              key: Key('BuildTopInfos'),
              spacing: AppSpacing.md,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: context.headlineLarge),
                _BuildRating(engagement),
                SizedBox.shrink(),
                _BuildSharedAndFav(engagement),
              ],
            )
            : SizedBox.shrink();
      },
    );
  }
}

class _BuildSharedAndFav extends StatelessWidget {
  const _BuildSharedAndFav(this.engagement);
  final Engagement engagement;

  @override
  Widget build(BuildContext context) {
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
          iconData: AppIcons.favorite,
          label: engagement.likesCount.countFormat,
          onTap: () {},
        ),
      ],
    );
  }
}

class _BuildRating extends StatelessWidget {
  const _BuildRating(this.engagement);
  final Engagement engagement;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.center,

      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final ratingDifference = engagement.rating - (index + 1);

          return Icon(
            ratingDifference >= 0.9
                ? AppIcons.fullStar
                : ratingDifference >= 0.1
                ? AppIcons.halfStar
                : AppIcons.noStar,
            color:
                ratingDifference < 0.1 ? AppColors.grey300 : AppColors.orange,
            size: 32.spMin,
          );
        },
      ),
    );
  }
}

// Widget _buildRating( BuildContext context) {
//   return Column(
//     children: [
//       SizedBox(
//         height: 30,
//         child: ListView.builder(
//           itemCount: 5,
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return Icon(
//               0.9 >= (engagement.rating - (index + 1)) &&
//                       0.1 <= (engagement.rating - (index + 1))
//                   ? AppIcons.halfStar
//                   : (engagement.rating - (index + 1)) < 0.1
//                   ? AppIcons.noStar
//                   : AppIcons.fullStar,
//               color:
//                   (engagement.rating - (index + 1)) < 0.1
//                       ? AppColors.grey300
//                       : AppColors.orange,
//               size: 32.spMin,
//             );
//           },
//         ),
//       ),
//       Text(
//         'Based on ${engagement.ratingCount.countFormat} ratings',
//         style: context.caption,
//       ),
//     ],
//   );
// }

// Column(
//       spacing: AppSpacing.md,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//             height: 600.spMin,
//             width: double.maxFinite,
//             child: AppNetworkImage(
//               imageUrl: recipe.imageUrl,
//               imageBuilder: (context, imageProvider) =>
//                   Image(fit: BoxFit.cover, image: imageProvider),
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
//                   0.9 >= (engagement.rating - (index + 1)) &&
//                           0.1 <= (engagement.rating - (index + 1))
//                       ? Icons.star_half_rounded
//                       : (engagement.rating - (index + 1)) < 0.1
//                           ? Icons.star_border_rounded
//                           : Icons.star_rounded,
//                   color: (engagement.rating - (index + 1)) < 0.1
//                       ? AppColors.grey300
//                       : AppColors.orange,
//                   size: 32.spMin,
//                 );
//               }),
//         ),
//         Text(
//             'Based on ${engagement.ratingCount.countFormat} ratings',
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
//               label: engagement.likesCount.countFormat,
//               onTap: () {},
//             ),
//           ],
//         ),
//       ],
//     );
