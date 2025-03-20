import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/extensions/object_extension.dart';
import 'package:recipe_haven/core/services/animation/animation_service.dart';

@Injectable(as: AnimationService)
class AutoAnimateServiceImpl extends AnimationService {
  @override
  List<Widget> animateFadeEffect(
    List<Widget> children,
    double intervalInMilSec,
    double durationInMilSec,
  ) {
    return AnimateList(
      interval: intervalInMilSec.ms,
      effects: [FadeEffect(duration: durationInMilSec.ms)],
      children: children,
    );
  }

  @override
  List<Widget> animateBlurEffect(
    List<Widget> children,
    double intervalInMilSec,
    double durationInMilSec,
  ) {
    return AnimateList(
      interval: intervalInMilSec.ms,
      effects: [BlurEffect(duration: durationInMilSec.ms)],
      children: children,
    );
  }

  @override
  Widget fadeOutIn(
    Widget child,
    double durationInMilSec,
    String? key,
    ScrollController? scrollController,
  ) {
    return child.animate(
      key: key.let((key) => ValueKey(key)),
      effects: [
        FadeEffect(
          begin: 0.3, // Start slightly faded
          end: 1, // Fully visible
          duration: durationInMilSec.ms,
          delay: Duration(microseconds: 0),
          // reverseCurve: Curves.easeInOut, // Ensures smooth fade in-out effect
        ),
      ],
      adapter: scrollController.let((controller) => ScrollAdapter(controller)),
    );
  }

  @override
  Widget fadeBlur(
    Widget child,
    double durationInMilSec,
    String? key,
    ScrollController? scrollController,
  ) {
    return child
        .animate(
          key: key.let((key) => ValueKey(key)),
          effects: [
            ThenEffect(delay: Duration(milliseconds: 200)),

            FadeEffect(
              duration: durationInMilSec.ms,
              delay: Duration(milliseconds: 1),
            ),
            // SwapEffect(builder: (context, child) => Text('data')),
          ],

          // onComplete: (controller) {
          //   controller.reset();
          // },
          adapter: scrollController.let(
            (controller) => ScrollAdapter(controller),
          ),
        )
        .blurXY(begin: 8, end: 0, duration: durationInMilSec.ms);
  }

  @override
  Widget scrollAdapterAnimation(
    Widget child,
    ScrollController scrollController,
  ) {
    return child.animate(
      adapter: ScrollAdapter(scrollController),
      effects: [
        FadeEffect(begin: 1, end: .5, duration: 300.ms),
        // FadeEffect(duration: 300.ms),
        // BlurEffect(begin: Offset(10, 10))
      ],
    );
    //     .fadeOut(duration: 300.ms) // fade out & then...
    // // swap in original widget & fade back in via a new Animate:
    // .swap(builder: (_, child) => child!.animate().fadeIn());
  }
}
