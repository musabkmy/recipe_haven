import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/app.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/config/theme/theme.dart';
import 'package:recipe_haven/core/utils/app_bloc_observer.dart';
import 'package:recipe_haven/features/recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart';
import 'package:recipe_haven/features/recipe/presentation/get_recipes_cubit/get_recipes_cubit.dart';
import 'package:recipe_haven/features/recipe/presentation/screens/recipe_info_screen.dart';
import 'package:recipe_haven/features/recipe/presentation/screens/recipes_screen.dart';

void main() async {
  //Initialize logging
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint(
        '${record.level.name}:\n ${record.loggerName}: ${record.message}\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
  });
  await ScreenUtil.ensureScreenSize();
  configurationDependency(Env.dev);
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetRecipesCubit>(create: (_) => getIt<GetRecipesCubit>()),
        BlocProvider<RecipeInfoBloc>(create: (_) => getIt<RecipeInfoBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        // ensureScreenSize: true,
        // enableScaleWH: () => true,
        // minTextAdapt: true,
        enableScaleText: () => true,
        builder: (_, __) {
          return MaterialApp(
            title: 'Recipe Haven',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            initialRoute: App.id,
            routes: {
              App.id: (context) => App(),
              RecipesScreen.id: (context) => RecipesScreen(),
              RecipeInfoScreen.id: (context) => RecipeInfoScreen(),
            },
          );
        },
      ),
    );
  }
}
