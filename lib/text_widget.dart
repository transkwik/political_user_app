import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    required this.text,
    this.color,
    this.fontWeight,
    this.letterSpacing,
    this.height,
    required this.fontSize,
    this.textAlign,
    this.lineSpacing,
    this.decoration,
    this.maxLines,
    this.overflow,
  });
  final String text;
  final color;
  final double fontSize;
  final fontWeight;
  final letterSpacing;
  final height;
  final textAlign;
  final lineSpacing;
  final decoration;
  final maxLines;
  final overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow ?? null,
      style: GoogleFonts.wixMadeforDisplay(
        decoration: decoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      // TextStyle(
      //   color: color,
      //   fontSize: fontSize,
      //   fontFamily: 'WixMadefor',
      //   fontWeight: fontWeight,
      //   decoration: decoration,
      // ),
      maxLines: maxLines,
    );
  }
}
