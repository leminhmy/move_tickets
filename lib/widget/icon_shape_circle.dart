import 'package:flutter/material.dart';

class IconShapeCircle extends StatelessWidget {
  const IconShapeCircle({
    Key? key,
    this.color = Colors.grey,
    this.iconData = Icons.arrow_back_outlined,
    this.iconColor = Colors.white,
    this.sizeWidget, this.widget,
  }) : super(key: key);

  final Color color;
  final IconData iconData;
  final Color iconColor;
  final double? sizeWidget;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: sizeWidget ?? size.height * 0.05,
      width: sizeWidget ?? size.height * 0.05,
      padding: const EdgeInsets.all(3),
      decoration:
          BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color,
                  color.withOpacity(0.7)
                ]
              ),
              shape: BoxShape.circle, boxShadow: [
        const BoxShadow(
          color: Colors.black,
          blurRadius: 2,
          spreadRadius: 1,
          offset: Offset(-1, -1.5),
        ),

        const BoxShadow(
          color: Colors.tealAccent,
          blurRadius: 0,
          spreadRadius: 1,
          offset: Offset(-1, -1.5),
        ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 0,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            ),
      ]),
      child: widget??Icon(
        iconData,
        color: Colors.white,
        size: size.height * 0.03,
      ),
    );
  }
}
