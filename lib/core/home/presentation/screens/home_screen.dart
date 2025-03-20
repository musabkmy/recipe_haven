import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/core/home/presentation/layouts/home_layouts.dart';
import 'package:recipe_haven/core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart';
import 'package:recipe_haven/core/shared_layouts/app_dialog.dart';
import 'package:recipe_haven/core/shared_layouts/app_loading_layout.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Logger logger = Logger('Recipes Screen');
    return BlocListener<GetRecipesCubit, GetRecipesState>(
      listenWhen: (previous, current) => current is GetRecipesSuccess,
      listener: (context, state) {
        if (state is GetRecipesFailure) {
          AppDialog(body: 'Something Went Wrong');
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SizedBox(
            height: double.maxFinite,
            child: DefaultTabController(
              length: 2,
              child: Column(children: [_buildTabBar(), _BuildTabView()]),
            ),
          ),
        ),
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(tabs: [Tab(text: 'Editor\'s Choice'), Tab(text: 'For You')]);
  }
}

class _BuildTabView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [BuildEditorChoiceLayout(), BuildForYouLayout()],
      ),
    );
  }
}
