import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:recipe_haven/app.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/shared_layouts.dart';
import 'package:recipe_haven/features/user/presentation/layouts/signup_layouts/build_signup_footer_layout.dart';
import 'package:recipe_haven/features/user/presentation/layouts/text_form_field_suffix_layout.dart';
import 'package:recipe_haven/features/user/presentation/layouts/user_layouts.dart';
import 'package:recipe_haven/features/user/presentation/state_management/providers/form_provider.dart';

class SignupWithEmailScreen extends StatelessWidget {
  SignupWithEmailScreen({super.key});
  static const String id = 'SignupWithEmailScreen';
  final _formKey = GlobalKey<FormState>();
  final _logger = Logger('SignupWithEmailScreen');
  // final _emailController = TextEditingController();
  // final _usernameController = TextEditingController();
  // final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: AppSpacing.xxl,
            children: [
              BuildTopLayout(
                hasPreviousScreen: Navigator.canPop(context),
                title: 'Sign up',
                onSkipPressed: () => Navigator.pushNamed(context, App.id),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.minHorizontal,
                  ),
                  child: ChangeNotifierProvider(
                    create: (BuildContext context) => FormProvider(),
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
                                validator: formProvider.validateEmail,
                              ),
                              _buildSubmitButton(formProvider),
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
    );
  }

  AppActionButton _buildSubmitButton(FormProvider formProvider) {
    return AppActionButton(
      title: 'Submit',
      onPressed: () {
        _formKey.currentState?.validate();
        if (formProvider.validateForm()) {
          _logger.info(
            'Form is valid: Name: ${formProvider.username}, Email: ${formProvider.email}, Password: ${formProvider.password}',
          );
        } else {
          _logger.warning('Form is invalid');
        }
      },
    );
  }
}
