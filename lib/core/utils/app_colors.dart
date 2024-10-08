import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  //reference colors
  static const Color _littleDarkBlue = Color(0XFF162c46);
  static const Color _grey = Color(0xD69E9E9E);
  static const Color _red = Color(0xFFAF0121);
  static const Color _green = Color(0xFF00F318);
  static const Color _darkBlue = Color(0XFF021427);
  static const Color _white = Color(0xFFFFFFFF);

  //actual colors to be used throughout the app
  final Color bgColor;
  final Color bgInput;
  final Color snackbarValidation;
  final Color snackBarFailure;
  final Color textDefault;

  // private constructor (use factories below instead):
  const AppColorsTheme._internal({
    required this.bgColor,
    required this.bgInput,
    required this.snackbarValidation,
    required this.snackBarFailure,
    required this.textDefault,
  });

//defining dark theme
  factory AppColorsTheme.dark() {
    return const AppColorsTheme._internal(
        bgColor: _darkBlue,
        bgInput: _littleDarkBlue,
        snackbarValidation: _green,
        snackBarFailure: _red,
        textDefault: _white);
  }

//define your light theme
  // factory AppColorsTheme.light(){
  //   return AppColorsTheme._internal(...);
  // }

  @override
  ThemeExtension<AppColorsTheme> copyWith({bool? lightMode}) {
    if (lightMode == null || lightMode == true) {
      return AppColorsTheme.dark();
    }
    return AppColorsTheme.dark();
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
          covariant ThemeExtension<AppColorsTheme>? other, double t) =>
      this;
}
