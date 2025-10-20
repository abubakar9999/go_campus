import 'package:flutter/material.dart';

/// 🧵 ThemeExtension on BuildContext
/// A rich set of helpers to easily access `ThemeData`, text styles,
/// screen dimensions, and focus control from any widget context.
/// 🧩 Includes:
/// - TextStyles, card color, fillColor
/// - Width & height of screen
/// 🪄 Greatly improves UI building and readability!

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  Color get cardColor => Theme.of(this).cardColor;
  Color get redColor => Colors.red;
  ColorScheme? get button => Theme.of(this).buttonTheme.colorScheme;
  Color? get fillColor => Theme.of(this).inputDecorationTheme.fillColor;
  Color? get indicatorColor => Theme.of(this).tabBarTheme.indicatorColor;
  // Text Styles //
  TextStyle? get primaryTextLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get primaryTextMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get primaryTextSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get secondaryTextLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get secondaryTextMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get secondaryTextSmaller => Theme.of(this).textTheme.bodySmall;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
}
