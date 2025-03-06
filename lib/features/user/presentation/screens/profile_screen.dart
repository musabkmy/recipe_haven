import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/config/routes/auto_route.gr.dart';
import 'package:recipe_haven/core/shared_layouts/app_text_button.dart';
import 'package:recipe_haven/features/user/presentation/state_management/bloc/user_bloc.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state case UserDataSuccess success) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(success.userData.name),
                  AppTextButton(
                    label: 'settings',
                    onPressed:
                        () => context.router.push(ProfileSettingsRoute()),
                  ),
                  AppTextButton(
                    label: 'go home',
                    onPressed: () {
                      final tabsRouter = AutoTabsRouter.of(context);
                      tabsRouter.setActiveIndex(0);
                    },
                  ),
                ],
              ),
            );
          }
          return Center(child: Text('something went wrong'));
        },
      ),
    );
  }
}
