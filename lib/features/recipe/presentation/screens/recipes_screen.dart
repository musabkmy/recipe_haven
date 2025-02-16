import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/features/recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart';
import 'package:recipe_haven/features/recipe/presentation/get_recipes_cubit/get_recipes_cubit.dart';
import 'package:recipe_haven/features/recipe/presentation/screens/recipe_info_screen.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});
  static const id = 'RecipesScreen';
  @override
  Widget build(BuildContext context) {
    Logger logger = Logger('Recipes Screen');
    return BlocBuilder<GetRecipesCubit, GetRecipesState>(
        builder: (context, state) {
      debugPrint(state.toString());
      if (state case GetRecipesSuccess()) {
        logger.fine('GetRecipesSuccess');
        return SafeArea(
          child: Column(
            children: [
              GestureDetector(
                child: Text(state.recipes.first.title),
                onTap: () {
                  context
                      .read<RecipeInfoBloc>()
                      .add(RecipeLoadEvent(state.recipes.first));
                  Navigator.pushNamed(
                    context,
                    RecipeInfoScreen.id,
                  );
                },
              ),
              GestureDetector(
                child: Text('create recipe'),
                onTap: () {
                  context.read<GetRecipesCubit>().createRecipe();
                },
              ),
            ],
          ),
        );
      } else if (state case GetRecipesFailure()) {
        logger.warning('GetRecipesFailure: ${state.errorMsg}');
        return Center(
          child: Text(state.errorMsg),
        );
      } else {
        logger.info('loading');
        return CircularProgressIndicator();
      }
    });
  }
}
