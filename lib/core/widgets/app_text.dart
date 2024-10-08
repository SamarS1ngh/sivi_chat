import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? size;
  final TextStyle textStyle;
  final Color color;
  final TextAlign textAlign;
  final TextOverflow? textOverflow;
  const AppText._internal(
    this.text, {
    super.key,
    required this.textStyle,
    required this.color,
    this.size,
    this.textAlign = TextAlign.start,
    this.textOverflow,
  });

  factory AppText.bigTextDefault(
    String text, {
    Key? key,
    required BuildContext context,
    Color? color,
    double? size,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
  }) =>
      AppText._internal(
        text,
        key: key,
        size: size ?? 40,
        textStyle: AppTypography.main().bigTextDefault,
        color: color ?? AppColorsTheme.dark().textDefault,
        textAlign: textAlign ?? TextAlign.start,
        textOverflow: textOverflow,
      );

  factory AppText.bigTextBold(
    String text, {
    Key? key,
    required BuildContext context,
    Color? color,
    double? size,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
  }) =>
      AppText._internal(
        text,
        key: key,
        textStyle: AppTypography.main().bigTextBold,
        size: size ?? 40,
        color: color ?? AppColorsTheme.dark().textDefault,
        textAlign: textAlign ?? TextAlign.start,
        textOverflow: textOverflow,
      );

  factory AppText.defaultText(
    String text, {
    Key? key,
    double? size,
    required BuildContext context,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
  }) =>
      AppText._internal(
        text,
        key: key,
        textStyle: AppTypography.main().defaultText,
        size: size ?? 24,
        color: color ?? AppColorsTheme.dark().textDefault,
        textAlign: textAlign ?? TextAlign.start,
        textOverflow: textOverflow,
      );

  factory AppText.defaultTextBold(
    String text, {
    Key? key,
    double? size,
    required BuildContext context,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
  }) =>
      AppText._internal(
        text,
        key: key,
        textStyle: AppTypography.main().defaultTextBold,
        color: color ?? AppColorsTheme.dark().textDefault,
        size: size ?? 24,
        textAlign: textAlign ?? TextAlign.start,
        textOverflow: textOverflow,
      );

  factory AppText.subtitleDefault(
    String text, {
    Key? key,
    required BuildContext context,
    Color? color,
    double? size,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
  }) =>
      AppText._internal(
        text,
        key: key,
        textStyle: AppTypography.main().subtitleDefault,
        color: color ?? AppColorsTheme.dark().textDefault,
        size: size ?? 18,
        textAlign: textAlign ?? TextAlign.start,
        textOverflow: textOverflow,
      );

  factory AppText.subtitleDefaultBold(
    String text, {
    Key? key,
    required BuildContext context,
    Color? color,
    double? size,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
  }) =>
      AppText._internal(
        text,
        key: key,
        textStyle: AppTypography.main().subtitleDefaultBold,
        color: color ?? AppColorsTheme.dark().textDefault,
        size: size ?? 18,
        textAlign: textAlign ?? TextAlign.start,
        textOverflow: textOverflow,
      );
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      style: textStyle.copyWith(color: color, fontSize: size),
    );
  }
}
