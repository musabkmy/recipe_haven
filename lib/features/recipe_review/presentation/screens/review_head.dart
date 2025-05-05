import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/review_entity.dart';

@RoutePage()
class ReviewsHead extends InheritedWidget {
  final dynamic recipeRef;
  final Reviews currentReviews;
  const ReviewsHead({
    super.key,
    required this.recipeRef,
    required this.currentReviews,
    required super.child,
  });

  //check if the widget is depending on ReviewsHead
  static ReviewsHead? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ReviewsHead>();
  }

  //return instance if any
  static ReviewsHead? of(BuildContext context) {
    final result = ReviewsHead.maybeOf(context);
    assert(result != null, 'No ReviewsHead found in context');
    return result;
  }

  @override
  bool updateShouldNotify(covariant ReviewsHead oldWidget) => false;
}
