import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart'
    show getIt;
import 'package:recipe_haven/config/routes/auto_route.gr.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/app_action_button.dart';
import 'package:recipe_haven/core/shared_layouts/app_overlay.dart';
import 'package:recipe_haven/core/shared_layouts/app_text_form_field.dart';

import 'package:recipe_haven/features/user/data/models/user_creation_model.dart';
import 'package:recipe_haven/features/user/presentation/layouts/signup_layouts/build_signup_footer_layout.dart';
import 'package:recipe_haven/features/user/presentation/layouts/text_form_field_suffix_layout.dart';
import 'package:recipe_haven/features/user/presentation/layouts/user_layouts.dart';
import 'package:recipe_haven/features/user/presentation/state_management/bloc/user_bloc.dart';
import 'package:recipe_haven/features/user/presentation/state_management/providers/form_provider.dart';

@RoutePage()
class SignupWithEmailScreen extends StatelessWidget {
  SignupWithEmailScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _logger = Logger('SignupWithEmailScreen');
  // final _emailController = TextEditingController();
  // final _usernameController = TextEditingController();
  // final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserDataLoading) {
            LoadingOverlay.show(context);
          } else if (state is UserDataFetched) {
            LoadingOverlay.hide(context);
            context.router.replace(AppRoute());
          } else if (state is UserDataFailure) {
            LoadingOverlay.hide(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
          }
        },
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: AppSpacing.xxl,
              children: [
                BuildTopLayout(
                  hasPreviousScreen: Navigator.canPop(context),
                  title: 'Sign up',
                  // onSkipPressed: () => context.router.push(AppRoute()),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.minHorizontal,
                    ),
                    child: ChangeNotifierProvider(
                      create: (_) => getIt<FormProvider>(),
                      child: Consumer<FormProvider>(
                        builder: (context, formProvider, _) {
                          return Form(
                            key: _formKey,
                            child: Column(
                              spacing: AppSpacing.sl,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppTextFormField(
                                  hintText: 'Email',
                                  initialValue: formProvider.email,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged:
                                      (value) => formProvider.email = value,
                                  autofillHints: [AutofillHints.email],
                                  suffixIcon:
                                      formProvider
                                          .emailValidationType
                                          .suffixLayout,
                                  validator: formProvider.validateEmail,
                                ),
                                AppTextFormField(
                                  hintText: 'Username',
                                  initialValue: formProvider.username,
                                  onChanged:
                                      (value) => formProvider.username = value,
                                  autovalidateMode: AutovalidateMode.onUnfocus,
                                  autofillHints: [AutofillHints.name],
                                  suffixIcon:
                                      formProvider
                                          .usernameValidationType
                                          .suffixLayout,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^[a-zA-Z ]+$'),
                                    ),
                                  ],
                                  validator: formProvider.validateUsername,
                                ),
                                AppTextFormField(
                                  hintText: 'Password',
                                  initialValue: formProvider.password,
                                  obscureText: !formProvider.isPasswordShown,
                                  onChanged:
                                      (value) => formProvider.password = value,
                                  suffixIcon: GestureDetector(
                                    onTap: formProvider.setIsPasswordShown,
                                    child: Icon(
                                      formProvider.isPasswordShown
                                          ? CupertinoIcons.eye_slash
                                          : CupertinoIcons.eye,
                                      color: AppColors.grey600,
                                    ),
                                  ),
                                  validator: formProvider.validatePassword,
                                ),
                                _buildSubmitButton(context, formProvider),
                                BuildSignupFooterLayout(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppActionButton _buildSubmitButton(
    BuildContext context,
    FormProvider formProvider,
  ) {
    return AppActionButton(
      title: 'Submit',
      onPressed: () {
        _formKey.currentState?.validate();
        if (formProvider.validateForm()) {
          final name = formProvider.username;
          final email = formProvider.email;
          final password = formProvider.password;
          _logger.info(
            'Form is valid: Name: $name, Email: $email, Password: $password',
          );

          context.read<UserBloc>().add(
            CreateAccountWithEmailAndPassword(
              userCreation: UserCreationModel(
                name: name,
                password: password,
                email: email,
              ),
            ),
          );
        } else {
          _logger.warning('Form is invalid');
        }
      },
    );
  }
}
