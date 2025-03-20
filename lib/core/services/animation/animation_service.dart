//interface for implementing an animation class that
//depend on third party package
//--ensure an easy modification
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

abstract class AnimationService {
  List<Widget> animateFadeEffect(
    List<Widget> children,
    double intervalInMilSec,
    double durationInMilSec,
  );
  List<Widget> animateBlurEffect(
    List<Widget> children,
    double intervalInMilSec,
    double durationInMilSec,
  );

  Widget fadeOutIn(
    Widget child,
    double durationInMilSec,
    String? key,
    ScrollController? scrollController,
  );

  Widget scrollAdapterAnimation(
    Widget child,
    ScrollController scrollController,
  );
  Widget fadeBlur(
    Widget child,
    double durationInMilSec,
    String? key,
    ScrollController? scrollController,
  );
}

extension WidgetAnimationServiceEx on Widget {
  //for calling it one time
  static final _service = GetIt.instance<AnimationService>();

  Widget fadeOutIn({
    double durationInMilSec = 600,
    String? key,
    ScrollController? scrollController,
  }) {
    return _service.fadeOutIn(this, durationInMilSec, key, scrollController);
  }

  Widget fadeBlur({
    double durationInMilSec = 500,
    String? key,
    ScrollController? scrollController,
  }) {
    return _service.fadeBlur(this, durationInMilSec, key, scrollController);
  }
}

extension WidgetsAnimationServiceEx on List<Widget> {
  static final _service = GetIt.instance<AnimationService>();
  List<Widget> animateFadeEffect({
    double intervalInMilSec = 400,
    double durationInMilSec = 300,
  }) {
    return _service.animateFadeEffect(this, intervalInMilSec, durationInMilSec);
  }

  List<Widget> animateBlurEffect({
    double intervalInMilSec = 400,
    double durationInMilSec = 300,
  }) {
    return _service.animateFadeEffect(this, intervalInMilSec, durationInMilSec);
  }
}

extension ScrollAnimationServiceEx<T extends ScrollView> on T {
  static final _service = GetIt.instance<AnimationService>();

  Widget scrollAdapterAnimation({required ScrollController scrollController}) {
    return _service.scrollAdapterAnimation(this, scrollController);
  }
}
