import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomActionsButton extends StatelessWidget {
  const CustomActionsButton({
    super.key,
    required this.text,
    required this.textColor,
    this.backgroundColor,
    required this.borderRadius,
    this.fontSize,
    this.onPressed,
  });

  final String text;
  final Color textColor;
  final WidgetStateProperty<Color?>? backgroundColor;
  final BorderRadius borderRadius;
  final double? fontSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: backgroundColor,
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Style.textSize18.copyWith(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
