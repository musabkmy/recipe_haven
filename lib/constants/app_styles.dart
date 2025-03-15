import 'package:flutter/material.dart';

final class AppStyles {
  static BorderRadius get borderRadiusXS => BorderRadius.circular(4);
  static BorderRadius get borderRadiusM => BorderRadius.circular(8);
  static BorderRadius get borderRadiusML => BorderRadius.circular(16);
  static OutlineInputBorder outlineInputBorderXS({required Color color}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: borderRadiusM,
        gapPadding: 4.0,
      );
  static OutlineInputBorder outlineInputBorderM({required Color color}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: borderRadiusM,
        gapPadding: 4.0,
      );

  const AppStyles._();
}
