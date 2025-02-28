import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/core/shared_layouts/app_overlay.dart';
import 'package:recipe_haven/features/user/presentation/screens/profile_screen.dart';
import 'package:recipe_haven/features/user/presentation/screens/screens.dart';
import 'package:recipe_haven/features/user/presentation/state_management/bloc/user_bloc.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});
  static const id = 'AuthWrapper';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserDataLoading) {
          LoadingOverlay.show(context);
        } else if (state is UserDataSuccess || state is UserDataFailure) {
          LoadingOverlay.hide(context);
        }
      },
      builder: (BuildContext context, UserState state) {
        if (state case UserDataSuccess _) {
          return ProfileScreen();
        } else {
          return SignupOptionsScreen();
        }
      },
    );
  }
}
