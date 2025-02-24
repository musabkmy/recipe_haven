import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:recipe_haven/config/extensions/context_extensions.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/constants/placement_text.dart';
import 'package:recipe_haven/core/shared_layouts/app_dialog.dart';

class BuildSignupFooterLayout extends StatelessWidget {
  const BuildSignupFooterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.sl,
      children: [
        SizedBox(),
        _buildTermsAndPrivacy(context),
        _buildToLogin(context),
      ],
    );
  }

  Text _buildToLogin(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Already have an account?\n',
        style: context.bodyMedium,
        children: [
          TextSpan(
            text: 'Log in here'.toUpperCase(),
            style: context.bodyLarge.copyWith(color: AppColors.primary),
            recognizer: TapGestureRecognizer(),
            //TODO: Implement log in navigation
            // ..onTap = () => Navigator.of(context).pushNamed('LoginScreen'),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Text _buildTermsAndPrivacy(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'By signup up I accept the ',
        style: context.bodyMedium,
        children: [
          TextSpan(
            text: 'terms of use',
            style: context.bodyMedium.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap =
                      () => showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder:
                            (context) => AppDialog(
                              title: 'Terms of Use',
                              body: PlacementText.termsOfUse,
                            ),
                      ),
          ),
          TextSpan(text: ' and the ', style: context.bodyMedium),
          TextSpan(
            text: 'privacy policy',
            style: context.bodyMedium.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap =
                      () => showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder:
                            (context) => AppDialog(
                              title: 'data privacy policy',
                              body: PlacementText.privacyPolicy,
                            ),
                      ),
          ),
        ],
      ),
    );
  }
}
