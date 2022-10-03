import 'package:errand_app/common/const/colors.dart';
import 'package:flutter/material.dart';

class DuckText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final double letterSpacing;
  final String? fontFamily;
  final TextOverflow overflow;
  final TextAlign align;

  const DuckText(
    this.text, {
    Key? key,
    this.size = 14,
    this.weight = FontWeight.w500,
    this.color = GREY900,
    this.letterSpacing = -0.25,
    this.fontFamily = "Pretendard",
    this.overflow = TextOverflow.ellipsis,
    this.align = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        fontWeight: weight,
        letterSpacing: letterSpacing,
        fontSize: size,
        color: color,
        fontFamily: fontFamily,
        overflow: overflow,
      ),
      textAlign: align,
    );
  }
}
