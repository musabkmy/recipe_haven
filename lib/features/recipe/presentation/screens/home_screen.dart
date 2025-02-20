import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/home/home_layouts.dart';
import 'package:recipe_haven/features/recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart';
import 'package:recipe_haven/features/recipe/presentation/get_recipes_cubit/get_recipes_cubit.dart';
import 'package:recipe_haven/features/recipe/presentation/screens/recipe_info_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    Logger logger = Logger('Recipes Screen');
    return BlocBuilder<GetRecipesCubit, GetRecipesState>(
        builder: (context, state) {
      if (state case GetRecipesSuccess()) {
        logger.fine('GetRecipesSuccess');
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Editor\'s Choice'),
                  Tab(text: 'For You'),
                ],
              ),
            ),
            body: TabBarView(children: [
              BuildEditorChoiceLayout(),
              GestureDetector(
                key: Key('GestureDetector get recipe'),
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
              // GestureDetector(
              //   key: Key('GestureDetector create recipe'),
              //   child: Text('create recipe'),
              //   onTap: () {
              //     context.read<GetRecipesCubit>().createRecipe();
              //   },
              // ),
            ]),
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
