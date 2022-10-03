import 'package:errand_app/common/const/colors.dart';
import 'package:flutter/material.dart';

class DuckBox extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color borderColor;
  final double borderRadius;

  const DuckBox(
    this.child, {
    Key? key,
    this.color = WHITE,
    this.borderColor = GREY900,
    this.borderRadius = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
