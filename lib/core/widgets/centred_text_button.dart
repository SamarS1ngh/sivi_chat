import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class CenteredTextButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color color;
  final double? height;
  final double? width;
  final double? radius;

  const CenteredTextButton._internal(
      {super.key,
      required this.label,
      required this.onTap,
      required this.color,
      this.height,
      this.radius,
      this.width});

  factory CenteredTextButton.primary(
      {Key? key,
      required String label,
      required Function() onTap,
      required BuildContext context,
      double? height,
      double? width,
      double? radius}) {
    return CenteredTextButton._internal(
      key: key,
      label: label,
      onTap: onTap,
      color: AppColorsTheme.dark().bgInput,
      height: height ?? 50,
      width: width ?? 300,
      radius: radius ?? 7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(radius ?? 7)),
        child: Center(
          child: Text(
            label,
            style:
                AppTypography.main().defaultText.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
