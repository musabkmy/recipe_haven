import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/routes/auto_route.gr.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/home/presentation/get_tags_cubit/get_tags_cubit.dart';
import 'package:recipe_haven/core/home/presentation/get_creators_cubit/get_creators_cubit.dart';
import 'package:recipe_haven/core/home/presentation/get_tonight_cook_cubit/get_tonight_cook_cubit.dart';

import 'core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart';

@RoutePage()
class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  // int _selectedIndex = 0;
  // void setStatusBarStyle() {
  //   SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent, // Transparent status bar
  //       statusBarIconBrightness:
  //           Brightness.light, // Light icons (for dark backgrounds)
  //       statusBarBrightness:
  //           Brightness.dark, // Dark status bar (for light backgrounds)
  //     ),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    // setStatusBarStyle();
    //run after the first frame to avoid unnecessary rebuild issues.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //delay until the widget is fully built
      _initialAppScreen();
    });
  }

  void _initialAppScreen() {
    try {
      context.read<GetRecipesCubit>().getLatestRecipes();
      // context.read<UserBloc>().add(GetUser());
      context.read<GetCreatorsCubit>().getBestCreators();
      context.read<GetTonightCookCubit>().getWhatToCookTonight();
      context.read<GetTagsCubit>().getTags();
    } catch (e) {
      Logger('Initializing app').shout('Error initializing appScreen: $e');
    }
  }

  final List<PageRouteInfo> _routes = [
    HomeRoute(),
    // SizedBox(),
    // SizedBox(),
    // SizedBox(),
    ProfileRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: _routes,
      //  animationCurve:
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          // backgroundColor: AppScreenColors.background,
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            if (tabsRouter.activeIndex == index) {
              final innerRouter = tabsRouter.innerRouterOf(
                tabsRouter.current.name
              );
              if (innerRouter != null && innerRouter.canPop()) {
                innerRouter.popTop();
              }
            }
            tabsRouter.setActiveIndex(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(AppIcons.home), label: 'Home'),
            // BottomNavigationBarItem(
            //   icon: Icon(AppIcons.search),
            //   label: 'Search',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(AppIcons.favorite),
            //   activeIcon: Icon(CupertinoIcons.heart_circle_fill),
            //   label: 'Saved',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(AppIcons.cart),
            //   label: 'Shopping list',
            // ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.profile),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
