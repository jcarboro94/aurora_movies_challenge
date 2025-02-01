import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  Brightness get brightness => MediaQuery.of(this).platformBrightness;
  ThemeData get calendarThemeData => Theme.of(this).copyWith(
        colorScheme: ColorScheme.light(
          primary: brightness == Brightness.light ? backgroundColor : surfaceColor,
          onSurface: brightness == Brightness.light ? backgroundColor : onSecondaryColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: brightness == Brightness.light ? backgroundColor : tertiaryColor,
          ),
        ),
      );

  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get onSecondaryColor => Theme.of(this).colorScheme.onSecondary;
  Color get tertiaryColor => Theme.of(this).colorScheme.tertiary;
  Color get onTertiaryColor => Theme.of(this).colorScheme.onTertiary;
  Color get backgroundColor => Theme.of(this).colorScheme.tertiary;
  Color get secondaryBackgroundColor => Theme.of(this).colorScheme.onTertiary;
  Color get onBackgroundColor => Theme.of(this).colorScheme.onBackground;
  Color get onSecondaryBackgroundColor => Theme.of(this).colorScheme.onBackground;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;
  Color get onError => Theme.of(this).colorScheme.onError;
  Color get error => Theme.of(this).colorScheme.error;
  Color get yellowWhite => MediaQuery.of(this).platformBrightness == Brightness.dark ? primaryColor : tertiaryColor;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get accentColor => Colors.orange;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
