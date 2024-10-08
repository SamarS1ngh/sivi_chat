import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle bigTextBold;
  final TextStyle bigTextDefault;
  final TextStyle defaultText;
  final TextStyle defaultTextBold;
  final TextStyle subtitleDefault;
  final TextStyle subtitleDefaultBold;

  AppTypography._internal(
      {required this.bigTextBold,
      required this.bigTextDefault,
      required this.defaultText,
      required this.defaultTextBold,
      required this.subtitleDefault,
      required this.subtitleDefaultBold});

  factory AppTypography.main() {
    return AppTypography._internal(
        bigTextBold: GoogleFonts.kanit(fontWeight: FontWeight.w600),
        bigTextDefault: GoogleFonts.kanit(),
        defaultText: GoogleFonts.poppins(),
        defaultTextBold: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        subtitleDefault: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
        subtitleDefaultBold:
            GoogleFonts.montserrat(fontWeight: FontWeight.w500));
  }

  @override
  ThemeExtension<AppTypography> copyWith() {
    return AppTypography._internal(
      bigTextBold: bigTextBold,
      bigTextDefault: bigTextDefault,
      defaultTextBold: defaultTextBold,
      defaultText: defaultText,
      subtitleDefaultBold: subtitleDefaultBold,
      subtitleDefault: subtitleDefault,
    );
  }

  @override
  ThemeExtension<AppTypography> lerp(
    covariant ThemeExtension<AppTypography>? other,
    double t,
  ) {
    return this;
  }
}
