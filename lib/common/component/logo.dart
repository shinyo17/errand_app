import 'package:errand_app/common/component/duck_text.dart';
import 'package:errand_app/common/const/colors.dart';
import 'package:errand_app/common/const/fonts.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double fontSize;
  const Logo({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DuckText(
      "덕부름",
      fontFamily: DANGAM,
      size: fontSize,
      color: BLUE800,
      letterSpacing: 0.0,
    );
  }
}
