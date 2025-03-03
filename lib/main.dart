import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:recipe_haven/app.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/config/theme/theme.dart';
import 'package:recipe_haven/core/home/presentation/get_tags_cubit/get_tags_cubit.dart';
import 'package:recipe_haven/core/home/presentation/get_creators_cubit/get_creators_cubit.dart';
import 'package:recipe_haven/core/home/presentation/get_tonight_cook_cubit/get_tonight_cook_cubit.dart';
import 'package:recipe_haven/core/home/presentation/screens/home_screen.dart';
import 'package:recipe_haven/core/utils/app_bloc_observer.dart';
import 'package:recipe_haven/features/recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart';
import 'package:recipe_haven/core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart';
import 'package:recipe_haven/features/recipe/presentation/screens/screens.dart';
import 'package:recipe_haven/features/user/presentation/screens/auth_wrapper.dart';
import 'package:recipe_haven/features/user/presentation/screens/profile_screen.dart';
import 'package:recipe_haven/features/user/presentation/screens/screens.dart';
import 'package:recipe_haven/features/user/presentation/state_management/bloc/user_bloc.dart';
import 'package:recipe_haven/features/user/presentation/state_management/providers/form_provider.dart';

void main() async {
  //Initialize logging
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint(
      '${record.level.name}:\n${record.loggerName}: ${record.message}\n––––––––––––––––––––––––––––––––––––––––––––––',
    );
  });
  await ScreenUtil.ensureScreenSize();
  configurationDependency(Env.prod);
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final getRecipesCubit = getIt<GetRecipesCubit>();
    final recipeInfoBloc = getIt<RecipeInfoBloc>();
    final userBloc = getIt<UserBloc>();
    final getCreatorsCubit = getIt<GetCreatorsCubit>();
    final getTonightCookCubit = getIt<GetTonightCookCubit>();
    final getTagsCubit = getIt<GetTagsCubit>();

    final formProvider = getIt<FormProvider>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getRecipesCubit),
        BlocProvider(create: (_) => recipeInfoBloc),
        BlocProvider(create: (_) => userBloc),
        BlocProvider(create: (_) => getCreatorsCubit),
        BlocProvider(create: (_) => getTonightCookCubit),
        BlocProvider(create: (_) => getTagsCubit),
      ],
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => formProvider)],
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
                HomeScreen.id: (context) => HomeScreen(),
                RecipeInfoScreen.id: (context) => RecipeInfoScreen(),
                AuthWrapper.id: (context) => AuthWrapper(),
                ProfileScreen.id: (context) => ProfileScreen(),
                SignupOptionsScreen.id: (context) => SignupOptionsScreen(),
                SignupWithEmailScreen.id: (context) => SignupWithEmailScreen(),
              },
            );
          },
        ),
      ),
    );
  }
}
