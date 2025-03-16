import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';

import '../../../../../constants/constants.dart';

class BuildCircularProgress extends StatelessWidget {
  const BuildCircularProgress(
      {super.key,
      required this.progress,
      required this.text,
      this.textStyle,
      required this.durationText});
  final double progress;
  final String text;
  final TextStyle? textStyle;
  final String durationText;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.md,
      children: [
        CircularProgressWithGradient(
          text: durationText,
          textStyle: textStyle ?? context.bodyMedium,
          progress: progress,
          size: 62.sp > 120 ? 120 : 62.sp,
          strokeWidth: 3.sp > 5 ? 2.sp : 3.sp,
        ),
        Text(
          text,
          style: textStyle ?? context.bodySmall,
        ),
      ],
    );
  }
}

class CircularProgressWithGradient extends StatelessWidget {
  final double progress;
  final double size;
  final double strokeWidth;
  final String text;
  final TextStyle textStyle;

  const CircularProgressWithGradient({
    super.key,
    required this.progress,
    required this.size,
    required this.strokeWidth,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background circle
        CustomPaint(
          size: Size(size, size),
          painter: CircularProgressPainter(
            progress: 1.0, // Full circle for the background
            strokeWidth: strokeWidth,
            color: AppColors.grey300,
          ),
        ),
        CustomPaint(
          size: Size(size, size),
          painter: CircularProgressPainter(
            progress: progress,
            strokeWidth: strokeWidth,
            color: AppColors.lightOrange,
          ),
        ),
        SizedBox(
            width: size - AppSpacing.md,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: textStyle,
                ))),
      ],
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress; // Progress value (0.0 to 1.0)
  final double strokeWidth; // Width of the progress arc
  final Color color; // Color of the arc

  CircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: size.width / 2,
    );

    // Define the paint for the arc
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    // Draw the arc
    canvas.drawArc(
      rect,
      -3.14159 / 2, // Start angle (12 o'clock position)
      2 * 3.14159 * progress, // Sweep angle based on progress
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
