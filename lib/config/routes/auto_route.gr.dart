// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/cupertino.dart' as _i20;
import 'package:flutter/material.dart' as _i16;
import 'package:flutter/widgets.dart' as _i18;
import 'package:recipe_haven/app.dart' as _i1;
import 'package:recipe_haven/core/home/presentation/screens/creators_screen.dart'
    as _i2;
import 'package:recipe_haven/core/home/presentation/screens/home_screen.dart'
    as _i4;
import 'package:recipe_haven/features/recipe_review/domain/entities/review_entity.dart'
    as _i19;
import 'package:recipe_haven/features/recipe_review/presentation/screens/review_full_screen_image_screen.dart'
    as _i10;
import 'package:recipe_haven/features/recipe_review/presentation/screens/review_head.dart'
    as _i11;
import 'package:recipe_haven/features/recipe_review/presentation/screens/reviews_images_gallery_screen.dart'
    as _i12;
import 'package:recipe_haven/features/user/presentation/screens/profile_screen.dart'
    as _i5;
import 'package:recipe_haven/features/user/presentation/screens/profile_settings_screen.dart'
    as _i6;
import 'package:recipe_haven/features/user/presentation/screens/register_screen.dart'
    as _i9;
import 'package:recipe_haven/features/user/presentation/screens/signup_options_screen.dart'
    as _i13;
import 'package:recipe_haven/features/user/presentation/screens/signup_with_email_screen.dart'
    as _i14;
import 'package:recipe_haven/features/view_recipe/domain/entities/entities.dart'
    as _i17;
import 'package:recipe_haven/features/view_recipe/presentation/screens/recipe_info_screen.dart'
    as _i7;
import 'package:recipe_haven/features/view_recipe/presentation/screens/recipe_parent_route.dart'
    as _i8;
import 'package:recipe_haven/tabs_parent_route.dart' as _i3;

/// generated route for
/// [_i1.AppScreen]
class AppRoute extends _i15.PageRouteInfo<void> {
  const AppRoute({List<_i15.PageRouteInfo>? children})
    : super(AppRoute.name, initialChildren: children);

  static const String name = 'AppRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppScreen();
    },
  );
}

/// generated route for
/// [_i2.CreatorsScreen]
class CreatorsRoute extends _i15.PageRouteInfo<void> {
  const CreatorsRoute({List<_i15.PageRouteInfo>? children})
    : super(CreatorsRoute.name, initialChildren: children);

  static const String name = 'CreatorsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i2.CreatorsScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeParentRoute]
class HomeParentRoute extends _i15.PageRouteInfo<void> {
  const HomeParentRoute({List<_i15.PageRouteInfo>? children})
    : super(HomeParentRoute.name, initialChildren: children);

  static const String name = 'HomeParentRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeParentRoute();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.ProfileParentRoute]
class ProfileParentRoute extends _i15.PageRouteInfo<void> {
  const ProfileParentRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileParentRoute.name, initialChildren: children);

  static const String name = 'ProfileParentRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProfileParentRoute();
    },
  );
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i6.ProfileSettingsScreen]
class ProfileSettingsRoute extends _i15.PageRouteInfo<void> {
  const ProfileSettingsRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileSettingsRoute.name, initialChildren: children);

  static const String name = 'ProfileSettingsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileSettingsScreen();
    },
  );
}

/// generated route for
/// [_i7.RecipeInfoScreen]
class RecipeInfoRoute extends _i15.PageRouteInfo<RecipeInfoRouteArgs> {
  RecipeInfoRoute({
    _i16.Key? key,
    required String id,
    _i17.Recipe? recipe,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         RecipeInfoRoute.name,
         args: RecipeInfoRouteArgs(key: key, id: id, recipe: recipe),
         initialChildren: children,
       );

  static const String name = 'RecipeInfoRoute';

  static _i15.PageInfo page = _i15.PageInfo(
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

  final _i16.Key? key;

  final String id;

  final _i17.Recipe? recipe;

  @override
  String toString() {
    return 'RecipeInfoRouteArgs{key: $key, id: $id, recipe: $recipe}';
  }
}

/// generated route for
/// [_i8.RecipeParentRoute]
class RecipeParentRoute extends _i15.PageRouteInfo<void> {
  const RecipeParentRoute({List<_i15.PageRouteInfo>? children})
    : super(RecipeParentRoute.name, initialChildren: children);

  static const String name = 'RecipeParentRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i8.RecipeParentRoute();
    },
  );
}

/// generated route for
/// [_i9.RegisterScreen]
class RegisterRoute extends _i15.PageRouteInfo<void> {
  const RegisterRoute({List<_i15.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i9.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i10.ReviewFullScreenImageScreen]
class ReviewFullRouteImageRoute
    extends _i15.PageRouteInfo<ReviewFullRouteImageRouteArgs> {
  ReviewFullRouteImageRoute({
    _i16.Key? key,
    required String imageUrl,
    required String reviewId,
    required String tag,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         ReviewFullRouteImageRoute.name,
         args: ReviewFullRouteImageRouteArgs(
           key: key,
           imageUrl: imageUrl,
           reviewId: reviewId,
           tag: tag,
         ),
         initialChildren: children,
       );

  static const String name = 'ReviewFullRouteImageRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReviewFullRouteImageRouteArgs>();
      return _i10.ReviewFullScreenImageScreen(
        key: args.key,
        imageUrl: args.imageUrl,
        reviewId: args.reviewId,
        tag: args.tag,
      );
    },
  );
}

class ReviewFullRouteImageRouteArgs {
  const ReviewFullRouteImageRouteArgs({
    this.key,
    required this.imageUrl,
    required this.reviewId,
    required this.tag,
  });

  final _i16.Key? key;

  final String imageUrl;

  final String reviewId;

  final String tag;

  @override
  String toString() {
    return 'ReviewFullRouteImageRouteArgs{key: $key, imageUrl: $imageUrl, reviewId: $reviewId, tag: $tag}';
  }
}

/// generated route for
/// [_i11.ReviewsHead]
class ReviewsHead extends _i15.PageRouteInfo<ReviewsHeadArgs> {
  ReviewsHead({
    _i18.Key? key,
    required String recipeId,
    required _i19.Reviews currentReviews,
    required _i18.Widget child,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         ReviewsHead.name,
         args: ReviewsHeadArgs(
           key: key,
           recipeId: recipeId,
           currentReviews: currentReviews,
           child: child,
         ),
         initialChildren: children,
       );

  static const String name = 'ReviewsHead';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReviewsHeadArgs>();
      return _i11.ReviewsHead(
        key: args.key,
        recipeId: args.recipeId,
        currentReviews: args.currentReviews,
        child: args.child,
      );
    },
  );
}

class ReviewsHeadArgs {
  const ReviewsHeadArgs({
    this.key,
    required this.recipeId,
    required this.currentReviews,
    required this.child,
  });

  final _i18.Key? key;

  final String recipeId;

  final _i19.Reviews currentReviews;

  final _i18.Widget child;

  @override
  String toString() {
    return 'ReviewsHeadArgs{key: $key, recipeId: $recipeId, currentReviews: $currentReviews, child: $child}';
  }
}

/// generated route for
/// [_i12.ReviewsImagesGalleryScreen]
class ReviewsImagesGalleryRoute
    extends _i15.PageRouteInfo<ReviewsImagesGalleryRouteArgs> {
  ReviewsImagesGalleryRoute({
    required Map<String, List<String>> reviewsImages,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         ReviewsImagesGalleryRoute.name,
         args: ReviewsImagesGalleryRouteArgs(
           reviewsImages: reviewsImages,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ReviewsImagesGalleryRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReviewsImagesGalleryRouteArgs>();
      return _i12.ReviewsImagesGalleryScreen(args.reviewsImages, key: args.key);
    },
  );
}

class ReviewsImagesGalleryRouteArgs {
  const ReviewsImagesGalleryRouteArgs({required this.reviewsImages, this.key});

  final Map<String, List<String>> reviewsImages;

  final _i16.Key? key;

  @override
  String toString() {
    return 'ReviewsImagesGalleryRouteArgs{reviewsImages: $reviewsImages, key: $key}';
  }
}

/// generated route for
/// [_i13.SignupOptionsScreen]
class SignupOptionsRoute extends _i15.PageRouteInfo<void> {
  const SignupOptionsRoute({List<_i15.PageRouteInfo>? children})
    : super(SignupOptionsRoute.name, initialChildren: children);

  static const String name = 'SignupOptionsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i13.SignupOptionsScreen();
    },
  );
}

/// generated route for
/// [_i14.SignupWithEmailScreen]
class SignupWithEmailRoute
    extends _i15.PageRouteInfo<SignupWithEmailRouteArgs> {
  SignupWithEmailRoute({_i20.Key? key, List<_i15.PageRouteInfo>? children})
    : super(
        SignupWithEmailRoute.name,
        args: SignupWithEmailRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SignupWithEmailRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignupWithEmailRouteArgs>(
        orElse: () => const SignupWithEmailRouteArgs(),
      );
      return _i14.SignupWithEmailScreen(key: args.key);
    },
  );
}

class SignupWithEmailRouteArgs {
  const SignupWithEmailRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'SignupWithEmailRouteArgs{key: $key}';
  }
}
