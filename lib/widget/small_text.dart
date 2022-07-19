import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    Key? key, required this.text, this.color = Colors.white, this.fontWeight = FontWeight.normal,  this.fontSize,
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
      textAlign: TextAlign.center,
      style: TextStyle(

          fontSize: fontSize??size.height * 0.016,
          fontWeight: fontWeight,
          color: color),
    );
  }
}