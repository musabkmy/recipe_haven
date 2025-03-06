import 'package:auto_route/auto_route.dart';
<<<<<<< Updated upstream
import 'package:flutter/widgets.dart';
=======
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
    debugPrint(
      'userBloc is UserDataSuccess: ${userBloc.state is UserDataSuccess} \n resolver.route: ${resolver.route.name}',
    );
=======
>>>>>>> Stashed changes
    if (publicRoutes.contains(route.name)) {
      resolver.next(true); // Allow navigation
      return;
    }
    if (userBloc.state is UserDataSuccess) {
      resolver.next(true);
    } else {
      router.push(RegisterRoute());
    }
  }
}
