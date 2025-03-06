import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/core/home/presentation/layouts/home_layouts.dart';
import 'package:recipe_haven/core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Logger logger = Logger('Recipes Screen');
    return BlocBuilder<GetRecipesCubit, GetRecipesState>(
      builder: (context, state) {
        if (state case GetRecipesSuccess()) {
          logger.fine('GetRecipesSuccess');
          return Scaffold(
            appBar: AppBar(),
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
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Expanded _buildTabView(BuildContext context) {
    return Expanded(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),

        children: [BuildEditorChoiceLayout(), BuildForYouLayout()],
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(tabs: [Tab(text: 'Editor\'s Choice'), Tab(text: 'For You')]);
  }
}
