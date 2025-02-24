import 'package:flutter/material.dart';
import 'package:recipe_haven/app.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/user/presentation/layouts/user_layouts.dart';

class SignupWithEmailScreen extends StatefulWidget {
  const SignupWithEmailScreen({super.key});
  static const String id = 'SignupWithEmailScreen';

  @override
  State<SignupWithEmailScreen> createState() => _SignupWithEmailScreenState();
}

class _SignupWithEmailScreenState extends State<SignupWithEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: AppSpacing.x3l,
            children: [
              BuildTopLayout(
                hasPreviousScreen: Navigator.canPop(context),
                title: 'Sign up',
                onSkipPressed: () => Navigator.pushNamed(context, App.id),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.minHorizontal,
                ),
                child: Column(
                  spacing: AppSpacing.sl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            focusNode: _focus,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              // helperStyle:,
                              // contentPadding:,
                              // suffixIcon: Icon(Icons.email),
                              // suffixIconColor:,
                              // suffixIconConstraints:,
                              counterText: '23',
                              errorBorder: AppStyles.outlineInputBorderXS(
                                color: AppColors.error,
                              ),
                              focusedBorder: AppStyles.outlineInputBorderM(
                                color: AppColors.grey400,
                              ),
                              focusedErrorBorder: AppStyles.outlineInputBorderM(
                                color: AppColors.errorOnFocused,
                              ),
                              // disabledBorder:,
                              enabledBorder: AppStyles.outlineInputBorderXS(
                                color: AppColors.grey400,
                              ),

                              // border:,
                              // constraints:,
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
