import 'package:flutter/material.dart';

class TextEditable extends StatelessWidget {
  final String text;
  final double? size;
  final String? colorHex;
  final String? position;

  const TextEditable(this.text,
      {this.size, this.colorHex, this.position, super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = colorHex != null && colorHex!.isNotEmpty
        ? Color(int.parse("0xFF$colorHex"))
        : Colors.black;

    double fontSize = size ?? 16.0;

    TextAlign textAlign = position == "start"
        ? TextAlign.start
        : position == "end"
            ? TextAlign.end
            : TextAlign.center;

    return Text(
      textAlign: textAlign,
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
      ),
    );
  }
}
