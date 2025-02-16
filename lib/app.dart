import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/recipe/presentation/screens/recipes_screen.dart';

import 'features/recipe/presentation/get_recipes_cubit/get_recipes_cubit.dart';

class App extends StatefulWidget {
  const App({super.key});
  static final id = 'App';

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetRecipesCubit>().getRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecipesScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(AppIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
