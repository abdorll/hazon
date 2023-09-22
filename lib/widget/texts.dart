// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextOf extends StatelessWidget {
  TextOf(this.text, this.size, this.color, this.weight,
      {this.align = TextAlign.center,
      this.textOverflow = TextOverflow.visible,
      this.decoration = TextDecoration.none,
      this.wordSpacing = 0,
      Key? key})
      : super(key: key);
  String text;
  Color color;
  TextAlign align;
  double size;
  TextDecoration decoration;
  FontWeight weight;
  double wordSpacing;
  TextOverflow textOverflow;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: align,
        overflow: textOverflow,
        style: GoogleFonts.poppins(
            wordSpacing: wordSpacing,
            decorationColor: color,
            decoration: decoration,
            color: color,
            fontSize: size -2,
            fontWeight: weight));
  }
}
