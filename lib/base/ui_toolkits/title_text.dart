import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  /// Text to be used for titles and headings.
  /// Requires [text]
  /// Does not require [align], [maxLines] and [color]
  const TitleText(
      {super.key, required this.text, this.align, this.maxLines, this.color});

  /// Text to be displayed.
  final String text;

  /// Alignment of the text.
  final TextAlign? align;

  /// The number of lines to be displayed before getting trunctuated.
  final int? maxLines;

  /// The color of the text.
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 16),
    );
  }
}
