import 'package:flutter/material.dart';

import '../../../widget/small_text.dart';


class TicketCardBackground extends StatelessWidget {
  const TicketCardBackground({
    Key? key,  this.sizeWidth, this.sizeHeight,
  }) : super(key: key);

  final double? sizeWidth;
  final double? sizeHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: sizeWidth??size.width * 0.65,
      height: sizeHeight??size.height * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomPaint(
        foregroundPainter: CustomPaintWidget(),
        child:ClipPath(
          clipper: CustomWidget(),
          child: Container(
            height: size.height * 0.55,
            width: size.width * 0.65,
            decoration: BoxDecoration(
              color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
        ),
      ),
    );
  }
}

class CustomWidget extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0,size.height*0.2);
    path0.lineTo(0,size.height*0.6);

    //border 1
    path0.arcToPoint(Offset(0, size.height * 0.73),radius: Radius.circular(10),clockwise: true);
    path0.lineTo(0,size.height*0.9);//cong 2
    path0.quadraticBezierTo(size.width*0.0007600,size.height*0.9960000,size.width*0.2000000,size.height*0.9940000);
    path0.cubicTo(size.width*0.3530000,size.height*0.9935000,size.width*0.6590000,size.height*0.9925000,size.width*0.8120000,size.height*0.9920000);
    //border 2
    path0.quadraticBezierTo(size.width,size.height,size.width,size.height*0.9);//cong 3

    path0.lineTo(size.width,size.height * 0.73);
    path0.arcToPoint(Offset(size.width, size.height * 0.6),radius: Radius.circular(10),clockwise: true);

    path0.lineTo(size.width,size.height*0.1);//cong 4
    path0.quadraticBezierTo(size.width,0,size.width*0.8,0);
    path0.cubicTo(size.width*0.6,0,size.width*0.35,0,size.width*0.2,0);
    path0.quadraticBezierTo(0,0,0,size.height*0.1);//cong 1
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip

    return true;
  }
}

class CustomPaintWidget extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.transparent;
    Path path0 = Path();
    path0.moveTo(0,size.height*0.2);
    path0.lineTo(0,size.height*0.6);

    //border 1
    path0.arcToPoint(Offset(0, size.height * 0.73),radius: Radius.circular(10),clockwise: true);
    path0.lineTo(0,size.height*0.9);//cong 2
    path0.quadraticBezierTo(size.width*0.0007600,size.height*0.9960000,size.width*0.2000000,size.height*0.9940000);
    path0.cubicTo(size.width*0.3530000,size.height*0.9935000,size.width*0.6590000,size.height*0.9925000,size.width*0.8120000,size.height*0.9920000);
    //border 2
    path0.quadraticBezierTo(size.width,size.height,size.width,size.height*0.9);//cong 3

    path0.lineTo(size.width,size.height * 0.73);
    path0.arcToPoint(Offset(size.width, size.height * 0.6),radius: Radius.circular(10),clockwise: true);

    path0.lineTo(size.width,size.height*0.1);//cong 4
    path0.quadraticBezierTo(size.width,0,size.width*0.8,0);
    path0.cubicTo(size.width*0.6,0,size.width*0.35,0,size.width*0.2,0);
    path0.quadraticBezierTo(0,0,0,size.height*0.1);//cong 1
    path0.close();
    final borderPaint = Paint()
      ..color = Colors.grey.shade600
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawPath(path0, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
