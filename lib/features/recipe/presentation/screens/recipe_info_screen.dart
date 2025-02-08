import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/recipe/presentation/bloc/recipe_info_bloc.dart';

class RecipeInfoScreen extends StatelessWidget {
  const RecipeInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeInfoBloc, RecipeInfoState>(
        builder: (context, state) {
      if (state is RecipeInfoSuccess) {
        final recipe = state.recipe;
        return SingleChildScrollView(
            child: Column(
          spacing: AppSpacing.md,
          children: [
            SizedBox(
                height: context.deviceWidth * .4,
                child: CachedNetworkImage(imageUrl: recipe.imageUrl)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSpacing.xs,
              children: [
                Text(recipe.title, style: context.headlineLarge),
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Icon(
                    0.5 <= recipe.usersEngagement.likesCount - (index + 1) &&
                            recipe.usersEngagement.likesCount - (index + 1) < 1
                        ? Icons.star_half_rounded
                        : Icons.star_rounded,
                    color: recipe.usersEngagement.likesCount - (index + 1) < 0.5
                        ? AppColors.grey300
                        : AppColors.orange,
                  ),
                ),
              ],
            ),
            Text('Based on ${recipe.usersEngagement.ratingCount} ratings',
                style: context.caption),
            Row(
              spacing: AppSpacing.md,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                        radius: 32,
                        child: Icon(Icons.share, color: AppColors.grey700)),
                    Text('Share', style: context.bodyMedium),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      child:
                          Icon(CupertinoIcons.heart, color: AppColors.grey700),
                    ),
                    Text(recipe.usersEngagement.likesCount.countFormat,
                        style: context.bodyMedium),
                  ],
                ),
              ],
            ),
          ],
        ));
      } else {
        return Center(
          child: Text('Failed Loading'),
        );
      }
    });
  }
}
