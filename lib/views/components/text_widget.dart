import 'package:flutter/material.dart';
import '../../constant/const.dart';

//text-widget
class GetTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  const GetTextWidget({
    super.key,
    required this.text,
    this.fontSize = 24.0,
    this.color = SECONDARY_COLOR,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
