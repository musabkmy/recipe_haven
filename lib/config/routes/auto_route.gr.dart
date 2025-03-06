// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/cupertino.dart' as _i14;
import 'package:flutter/material.dart' as _i12;
import 'package:recipe_haven/app.dart' as _i1;
import 'package:recipe_haven/core/home/presentation/screens/creators_screen.dart'
    as _i2;
import 'package:recipe_haven/core/home/presentation/screens/home_screen.dart'
    as _i4;
import 'package:recipe_haven/features/recipe/domain/entities/entities.dart'
    as _i13;
import 'package:recipe_haven/features/recipe/presentation/screens/recipe_info_screen.dart'
    as _i7;
import 'package:recipe_haven/features/user/presentation/screens/profile_screen.dart'
    as _i5;
import 'package:recipe_haven/features/user/presentation/screens/profile_settings_screen.dart'
    as _i6;
import 'package:recipe_haven/features/user/presentation/screens/register_screen.dart'
    as _i8;
import 'package:recipe_haven/features/user/presentation/screens/signup_options_screen.dart'
    as _i9;
import 'package:recipe_haven/features/user/presentation/screens/signup_with_email_screen.dart'
    as _i10;
import 'package:recipe_haven/tabs_parent_route.dart' as _i3;

/// generated route for
/// [_i1.AppScreen]
class AppRoute extends _i11.PageRouteInfo<void> {
  const AppRoute({List<_i11.PageRouteInfo>? children})
    : super(AppRoute.name, initialChildren: children);

  static const String name = 'AppRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppScreen();
    },
  );
}

/// generated route for
/// [_i2.CreatorsScreen]
class CreatorsRoute extends _i11.PageRouteInfo<void> {
  const CreatorsRoute({List<_i11.PageRouteInfo>? children})
    : super(CreatorsRoute.name, initialChildren: children);

  static const String name = 'CreatorsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.CreatorsScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeParentRoute]
class HomeParentRoute extends _i11.PageRouteInfo<void> {
  const HomeParentRoute({List<_i11.PageRouteInfo>? children})
    : super(HomeParentRoute.name, initialChildren: children);

  static const String name = 'HomeParentRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeParentRoute();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.ProfileParentRoute]
class ProfileParentRoute extends _i11.PageRouteInfo<void> {
  const ProfileParentRoute({List<_i11.PageRouteInfo>? children})
    : super(ProfileParentRoute.name, initialChildren: children);

  static const String name = 'ProfileParentRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProfileParentRoute();
    },
  );
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i6.ProfileSettingsScreen]
class ProfileSettingsRoute extends _i11.PageRouteInfo<void> {
  const ProfileSettingsRoute({List<_i11.PageRouteInfo>? children})
    : super(ProfileSettingsRoute.name, initialChildren: children);

  static const String name = 'ProfileSettingsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileSettingsScreen();
    },
  );
}

/// generated route for
/// [_i7.RecipeInfoScreen]
class RecipeInfoRoute extends _i11.PageRouteInfo<RecipeInfoRouteArgs> {
  RecipeInfoRoute({
    _i12.Key? key,
    required String id,
    _i13.Recipe? recipe,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         RecipeInfoRoute.name,
         args: RecipeInfoRouteArgs(key: key, id: id, recipe: recipe),
         initialChildren: children,
       );

  static const String name = 'RecipeInfoRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipeInfoRouteArgs>();
      return _i7.RecipeInfoScreen(
        key: args.key,
        id: args.id,
        recipe: args.recipe,
      );
    },
  );
}

class RecipeInfoRouteArgs {
  const RecipeInfoRouteArgs({this.key, required this.id, this.recipe});

  final _i12.Key? key;

  final String id;

  final _i13.Recipe? recipe;

  @override
  String toString() {
    return 'RecipeInfoRouteArgs{key: $key, id: $id, recipe: $recipe}';
  }
}

/// generated route for
/// [_i8.RegisterScreen]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute({List<_i11.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i9.SignupOptionsScreen]
class SignupOptionsRoute extends _i11.PageRouteInfo<void> {
  const SignupOptionsRoute({List<_i11.PageRouteInfo>? children})
    : super(SignupOptionsRoute.name, initialChildren: children);

  static const String name = 'SignupOptionsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.SignupOptionsScreen();
    },
  );
}

/// generated route for
/// [_i10.SignupWithEmailScreen]
class SignupWithEmailRoute
    extends _i11.PageRouteInfo<SignupWithEmailRouteArgs> {
  SignupWithEmailRoute({_i14.Key? key, List<_i11.PageRouteInfo>? children})
    : super(
        SignupWithEmailRoute.name,
        args: SignupWithEmailRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SignupWithEmailRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignupWithEmailRouteArgs>(
        orElse: () => const SignupWithEmailRouteArgs(),
      );
      return _i10.SignupWithEmailScreen(key: args.key);
    },
  );
}

class SignupWithEmailRouteArgs {
  const SignupWithEmailRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SignupWithEmailRouteArgs{key: $key}';
  }
}
