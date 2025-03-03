import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/home/presentation/get_tags_cubit/get_tags_cubit.dart';
import 'package:recipe_haven/core/home/presentation/get_creators_cubit/get_creators_cubit.dart';
import 'package:recipe_haven/core/home/presentation/get_tonight_cook_cubit/get_tonight_cook_cubit.dart';
import 'package:recipe_haven/core/home/presentation/screens/home_screen.dart';
import 'package:recipe_haven/features/user/presentation/screens/auth_wrapper.dart';
import 'package:recipe_haven/features/user/presentation/state_management/bloc/user_bloc.dart';

import 'core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart';

class App extends StatefulWidget {
  const App({super.key});
  static final id = 'App';

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    //run after the first frame to avoid unnecessary rebuild issues.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //delay until the widget is fully built
      Future.microtask(() => _initialApp());
    });
  }

  void _initialApp() {
    try {
      context.read<GetRecipesCubit>().getLatestRecipes();
      context.read<UserBloc>().add(GetUser());
      context.read<GetCreatorsCubit>().getBestCreators();
      context.read<GetTonightCookCubit>().getWhatToCookTonight();
      context.read<GetTagsCubit>().getTags();
    } catch (e) {
      debugPrint('Error initializing app: $e');
    }
  }

  final List<Widget> _pages = [
    HomeScreen(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    AuthWrapper(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: AppColors.background,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(AppIcons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
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
