import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/core/home/presentation/layouts/home_layouts.dart';
import 'package:recipe_haven/core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart';

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
          return Scaffold(
            body: SafeArea(
              child: SizedBox(
                height: double.maxFinite,
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [_buildTabBar(), _buildTabView(context)],
                  ),
                ),
              ),
            ),
          );
        } else if (state case GetRecipesFailure()) {
          logger.warning('GetRecipesFailure: ${state.errorMsg}');
          return Center(child: Text(state.errorMsg));
        } else {
          logger.info('loading');
          return CircularProgressIndicator();
        }
      },
    );
  }

  Expanded _buildTabView(BuildContext context) {
    return Expanded(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),

        children: [
          BuildEditorChoiceLayout(),
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
        ],
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(tabs: [Tab(text: 'Editor\'s Choice'), Tab(text: 'For You')]);
  }
}
