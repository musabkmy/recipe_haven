import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/config/theme/theme.dart';
import 'package:recipe_haven/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:recipe_haven/features/recipe/presentation/get_recipes/get_recipes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/features/recipe/presentation/screens/recipes_screen.dart';

void main() {
  //Initialize logging
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });
  configurationDependency(Env.dev);
  if (getIt.isRegistered<RecipeRepository>()) {
    debugPrint('RecipeRepository is registered!');
  } else {
    debugPrint('RecipeRepository is NOT registered.');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Haven',
      theme: AppTheme.light,
      home: BlocProvider(
          create: (_) => getIt<GetRecipesCubit>(),
          child: Scaffold(
            body: RecipesScreen(),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
              ],
            ),
          )),
    );
  }
}
