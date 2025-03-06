import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/config/routes/auto_route.gr.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/core/home/presentation/get_creators_cubit/get_creators_cubit.dart';
import 'package:recipe_haven/core/shared_layouts/shared_layouts.dart';

class BuildBestCreators extends StatelessWidget {
  const BuildBestCreators({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCreatorsCubit, GetCreatorsState>(
      builder: (context, state) {
        if (state is GetCreatorsSuccess && state.creators.isNotEmpty) {
          final creators = state.creators;
          return Column(
            spacing: AppSpacing.sm,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSectionTitle(
                'Explore the best recipes from',
                onActionLabel: 'Explore all',
                onActionPressed: () => context.router.push(CreatorsRoute()),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 68.sp * 2.5),
                child: ListView.separated(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: creators.length,
                  separatorBuilder:
                      (BuildContext context, int index) =>
                          SizedBox(width: AppSpacing.md),
                  itemBuilder: (BuildContext context, int index) {
                    final creator = creators[index];
                    return Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: index == 0 ? AppSpacing.minHorizontal : 0,
                        end:
                            index == creators.length - 1
                                ? AppSpacing.minHorizontal
                                : 0,
                      ),
                      child: Column(
                        spacing: AppSpacing.md,
                        children: [
                          AppNetworkCircularAvatar(
                            size: 68.sp,
                            imageUrl: creator.profilePic,
                            name: creator.name,
                          ),
                          SizedBox(
                            width: 68.sp,
                            child: Text(
                              creator.name,
                              style: context.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
