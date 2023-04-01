import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double textSize;
  final String textValue;
  final Color textColor;
  AppText(
      {super.key,
      this.textSize = 25,
      required this.textValue,
      this.textColor = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return Text(textValue,
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
        ));
  }
}
