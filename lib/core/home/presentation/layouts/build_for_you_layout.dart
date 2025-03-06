import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/core/data/mocking_sources/user_mock_source.dart';
import 'package:recipe_haven/core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart';
import 'package:recipe_haven/features/user/presentation/state_management/bloc/user_bloc.dart';

class BuildForYouLayout extends StatelessWidget {
  const BuildForYouLayout({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    final user = UserMockSource.userFetchModels[4];
=======
    final user = UserMockSource().getUserFetchModels[4];
>>>>>>> Stashed changes
    return Center(
      child: Column(
        spacing: AppSpacing.minHorizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // GestureDetector(
          //   key: Key('GestureDetector get recipe'),
          //   child: Text(state.recipes.first.title),
          //   onTap: () {
          //     context
          //         .read<RecipeInfoBloc>()
          //         .add(RecipeLoadEvent(state.recipes.first));
          //     Navigator.pushNamed(
          //       context,
          //       RecipeInfoScreen.id,
          //     );
          //   },
          // ),
          GestureDetector(
            key: Key('GestureDetector create recipe'),
            child: Text('create recipe'),
            onTap: () {
              context.read<GetRecipesCubit>().createRecipe();
            },
          ),
          GestureDetector(
            key: Key('GestureDetector create user'),
            child: Text('create User ${user.name}'),
            onTap: () {
              context.read<UserBloc>().add(
                CreateAccountWithEmailAndPassword(userCreation: user),
              );
            },
          ),
        ],
      ),
    );
  }
}
