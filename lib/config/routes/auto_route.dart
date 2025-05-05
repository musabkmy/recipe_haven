import 'package:auto_route/auto_route.dart';
import 'package:recipe_haven/config/routes/auth_guard.dart';
import 'package:recipe_haven/config/routes/auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: AppRoute.page,
      initial: true,
      guards: [AuthGuard()],
      children: [
        //initial route
        RedirectRoute(path: '', redirectTo: 'home'),
        AutoRoute(
          path: 'home',
          page: HomeParentRoute.page,
          children: [
            AutoRoute(path: '', page: HomeRoute.page),
            AutoRoute(path: 'creatorsRoute', page: CreatorsRoute.page),
          ],
        ),
        AutoRoute(
          path: 'profile',
          page: ProfileParentRoute.page,
          children: [
            AutoRoute(path: '', page: ProfileRoute.page),
            AutoRoute(
              path: 'profileSettingsRoute',
              page: ProfileSettingsRoute.page,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: '/registerRoute',
      page: RegisterRoute.page,
      children: [
        //initial route
        RedirectRoute(path: '', redirectTo: 'signupOptionsRoute'),
        AutoRoute(path: 'signupOptionsRoute', page: SignupOptionsRoute.page),
        AutoRoute(
          path: 'signupWithEmailRoute',
          page: SignupWithEmailRoute.page,
        ),
      ],
      // guards: [AuthGuard()],
    ),
    AutoRoute(path: '/recipeInfoRoute', page: RecipeInfoRoute.page),
    AutoRoute(path: '/reviewsRoute', page: ReviewsHead.page),
    AutoRoute(
      path: '/reviewsImagesGalleryRoute',
      page: ReviewsImagesGalleryRoute.page,
    ),
    CustomRoute(
      path: '/reviewFullRouteImageRoute',
      page: ReviewFullRouteImageRoute.page,
      fullscreenDialog: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ];
  @override
  List<AutoRouteGuard> get guards => [AuthGuard()];
}
