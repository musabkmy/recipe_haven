import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/recipe/presentation/screens/home_screen.dart';

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
      body: HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: AppColors.background,
        items: [
          BottomNavigationBarItem(
            icon: Icon(AppIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            activeIcon: Icon(CupertinoIcons.heart_circle_fill),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Shopping list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
