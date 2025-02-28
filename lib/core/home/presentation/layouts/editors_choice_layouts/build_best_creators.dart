import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSectionTitle






              (
                'Explore the best recipes from',
                style: context.headlineSmall,
              ),
              ...creators.map(
                (element) => Column(
                  children: [
                    AppNetworkCircularAvatar(
                      imageUrl: element.profilePic,
                      name: element.name,
                    ),
                    Text(
                      element.name,
                      style: context.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
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
