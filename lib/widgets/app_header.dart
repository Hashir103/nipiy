import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppHeaderText extends StatelessWidget {
  final double textSize;
  final String textValue;
  final Color textColor;
  const AppHeaderText(
      {super.key,
      this.textSize = 34,
      required this.textValue,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(textValue,
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
          fontWeight: FontWeight.bold,
        ));
  }
}
