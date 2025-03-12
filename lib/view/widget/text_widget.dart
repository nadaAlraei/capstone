import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  String fontFamily;
  double letterSpacing;
  Color fontColor;

  TextWidget({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    required this.fontFamily,
    required this.letterSpacing,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color:fontColor,
      ),
    );
  }
}
