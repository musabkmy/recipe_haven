import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/app_logos.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/app_action_button.dart';
import 'package:recipe_haven/features/user/presentation/layouts/signup_layouts/signup_layouts.dart';

@RoutePage()
class SignupOptionsScreen extends StatelessWidget {
  const SignupOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('SignupOptionsScreen rebuilt');
    return Scaffold(
      key: const ValueKey('SignupOptionsScreen'),
      body: SafeArea(
        minimum: EdgeInsets.only(top: AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: AppSpacing.x3l,
          children: [
            // BuildTopLayout(onSkipPressed: () => context.router.push(AppRoute())),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.minHorizontal,
                ),
                itemCount: 7, // Number of widgets (excluding separators)
                separatorBuilder:
                    (context, index) =>
                        SizedBox(height: AppSpacing.sl), // Add spacing
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return _buildTitle(context);
                    case 1:
                      return SizedBox(); // If unnecessary, you can remove it
                    case 2:
                      return AppActionButton(
                        onPressed: () {},
                        withBorderSide: true,
                        textColor: AppColors.grey900,
                        backgroundColor: AppColors.transparent,
                        iconSvg: AppLogos.googleLogoSvg,
                        title: 'Sign up with Google',
                      );
                    case 3:
                      return AppActionButton(
                        onPressed: () {},
                        withBorderSide: true,
                        textColor: AppColors.grey900,
                        backgroundColor: AppColors.transparent,
                        iconSvg: AppLogos.facebookLogoSvg,
                        title: 'Sign up with Facebook',
                      );
                    case 4:
                      return AppActionButton(
                        onPressed: () {},
                        withBorderSide: true,
                        textColor: AppColors.grey900,
                        backgroundColor: AppColors.transparent,
                        iconSvg: AppLogos.appleLogoSvg,
                        title: 'Sign up with Apple',
                      );
                    case 5:
                      return AppActionButton(
                        onPressed: () {
                          context.router.pushPath('signupWithEmailRoute');
                        },
                        textColor: AppColors.grey100,
                        backgroundColor: AppColors.secondary,
                        title: 'Sign up with email',
                      );
                    case 6:
                      return BuildSignupFooterLayout();
                    default:
                      return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Sign up\n',
        style: context.headlineSmall,
        children: [
          TextSpan(
            text: 'to discover all our tastebud tickling recipes and features.',
            style: context.bodyMedium,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
