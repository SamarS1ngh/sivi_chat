import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  //reference colors
  static const Color _lavender = Color(0xffbb86fc);

  static const Color _red = Color(0xFFAF0121);
  static const Color _green = Color(0xFF00F318);
  static const Color _black = Color.fromARGB(250, 26, 26, 26);
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
        bgColor: _black,
        bgInput: _lavender,
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
