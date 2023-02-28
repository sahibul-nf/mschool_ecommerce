import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mschool_ecommerce/themes/utils.dart';

TextStyle pStyle(
  BuildContext context, {
  Color? color,
  TextDecoration? decoration,
  FontWeight fontWeight = FontWeight.normal,
  double? fontSize,
  double? height,
}) {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      fontFamily: "RobotoSerif",
      fontWeight: fontWeight,
      color: color ?? Theme.of(context).primaryColor,
      height: height ?? (smallScreen(context) ? 1.3 : 1.5),
      fontSize: fontSize ?? (smallScreen(context) ? 16 : 18),
      decoration: decoration,
    ),
  );
}
