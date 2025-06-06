import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/config/routes/auto_route.gr.dart';
import 'package:recipe_haven/features/user/presentation/state_management/bloc/user_bloc.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  // List of public routes
  final List<String> publicRoutes = [
    RegisterRoute.name,
    SignupOptionsRoute.name,
    SignupWithEmailRoute.name,
  ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final route = resolver.route;
    final userBloc = getIt<UserBloc>();

    debugPrint(
      'userBloc is UserDataFetched: ${userBloc.state is UserDataFetched} \n resolver.route: ${resolver.route.name}',
    );

    if (publicRoutes.contains(route.name)) {
      resolver.next(true); // Allow navigation
      return;
    }
    if (userBloc.state is UserDataFetched) {
      resolver.next(true);
    } else {
      router.push(RegisterRoute());
    }
  }
}
