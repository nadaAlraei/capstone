import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final double letterSpacing;
  final Color? fontColor;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  const TextWidget({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    required this.fontFamily,
    required this.letterSpacing,
    this.fontColor,
    this.textAlign,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultColor = theme.textTheme.bodyLarge?.color ?? Colors.black;

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: fontColor ?? defaultColor,
        decoration: textDecoration,
      ),
    );
  }
}