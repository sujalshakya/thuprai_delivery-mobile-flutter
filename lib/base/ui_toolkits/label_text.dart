import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  /// Text used for normal and regular text.
  /// Requires [text].
  /// Not Required [align], [maxLines], [fontWeight], [fontSize] and [color].
  const PrimaryText(
      {super.key,
      required this.text,
      this.align,
      this.maxLines,
      this.fontWeight,
      this.fontSize,
      this.color});

  /// Text to be displayed
  final String text;

  /// Alignment of the text
  final TextAlign? align;

  /// The number of lines to be displayed before getting trunctuated.
  final int? maxLines;

  /// The color of the text.
  final Color? color;

  /// The boldness of the text.
  final FontWeight? fontWeight;

  /// The size of the text.
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      style:
          TextStyle(fontWeight: fontWeight, color: color, fontSize: fontSize),
    );
  }
}
