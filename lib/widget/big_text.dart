import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText({
    Key? key, required this.text, this.color = Colors.white, this.fontWeight = FontWeight.bold,  this.fontSize,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize??size.height * 0.018,
          fontWeight: fontWeight,
          color: color),
    );
  }
}