import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../widget/small_text.dart';


class TicketCard extends StatelessWidget {
  const TicketCard({
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

            ),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.37,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.jpg'),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Expanded(child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    gradient: LinearGradient(
                        stops: [0.45,1],
                        begin: Alignment.centerLeft,
                        end: Alignment(2.5,0),
                        colors: [
                          Colors.purpleAccent.shade700.withOpacity(0.2),
                          Colors.red,
                        ]
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(12, (index) => Container(
                          height: 2,
                          width: size.width * 0.03,
                          color: Colors.black,
                        )),),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.height*0.04,vertical: size.height*0.02),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const[
                                    SmallText(text: "Date:",color: Colors.deepPurpleAccent,fontWeight: FontWeight.w600,),
                                    SizedBox(width: 5,),
                                    SmallText(text: "Aprill23",color: Colors.black,fontWeight: FontWeight.w600,),
                                  ],
                                ),
                                Row(
                                  children: const[
                                    SmallText(text: "Time:",color: Colors.deepPurpleAccent,fontWeight: FontWeight.w600,),
                                    SizedBox(width: 5,),
                                    SmallText(text: "6 p.m",color: Colors.black,fontWeight: FontWeight.w600,),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: size.height*0.02,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const[
                                    SmallText(text: "Row:",color: Colors.deepPurpleAccent,fontWeight: FontWeight.w600,),
                                    SizedBox(width: 5,),
                                    SmallText(text: "2",color: Colors.black,fontWeight: FontWeight.w600,),
                                  ],
                                ),
                                Row(
                                  children: const[
                                    SmallText(text: "Seats:",color: Colors.deepPurpleAccent,fontWeight: FontWeight.w600,),
                                    SizedBox(width: 5,),
                                    SmallText(text: "9, 10",color: Colors.black,fontWeight: FontWeight.w600,),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: size.height*0.02,),
                            SizedBox(
                              height: size.height * 0.05,
                              width: double.maxFinite,
                              child: Image.asset('assets/images/qrcode.webp',fit: BoxFit.cover),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
              ],
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
    path0.lineTo(0,size.height*0.93);//cong 2
    path0.quadraticBezierTo(size.width*0.0007600,size.height*0.9960000,size.width*0.2000000,size.height*0.9940000);
    path0.cubicTo(size.width*0.3530000,size.height*0.9935000,size.width*0.6590000,size.height*0.9925000,size.width*0.8120000,size.height*0.9920000);
    //border 2
    path0.quadraticBezierTo(size.width,size.height,size.width,size.height*0.93);//cong 3

    path0.lineTo(size.width,size.height * 0.73);
    path0.arcToPoint(Offset(size.width, size.height * 0.6),radius: Radius.circular(10),clockwise: true);

    path0.lineTo(size.width,size.height*0.07);//cong 4
    path0.quadraticBezierTo(size.width,0,size.width*0.8,0);
    path0.cubicTo(size.width*0.6,0,size.width*0.35,0,size.width*0.2,0);
    path0.quadraticBezierTo(0,0,0,size.height*0.07);//cong 1
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
    path0.lineTo(0,size.height*0.93);//cong 2
    path0.quadraticBezierTo(size.width*0.0007600,size.height*0.9960000,size.width*0.2000000,size.height*0.9940000);
    path0.cubicTo(size.width*0.3530000,size.height*0.9935000,size.width*0.6590000,size.height*0.9925000,size.width*0.8120000,size.height*0.9920000);
    //border 2
    path0.quadraticBezierTo(size.width,size.height,size.width,size.height*0.93);//cong 3

    path0.lineTo(size.width,size.height * 0.73);
    path0.arcToPoint(Offset(size.width, size.height * 0.6),radius: Radius.circular(10),clockwise: true);

    path0.lineTo(size.width,size.height*0.07);//cong 4
    path0.quadraticBezierTo(size.width,0,size.width*0.8,0);
    path0.cubicTo(size.width*0.6,0,size.width*0.35,0,size.width*0.2,0);
    path0.quadraticBezierTo(0,0,0,size.height*0.07);//cong 1
    path0.close();

    Rect rect = Rect.fromLTRB(size.height * 0.38, size.height * 0.2,size.height * 0.26, size.height * 0.36);
    final borderPaint = Paint()

      ..shader = LinearGradient(
        stops: [0.01,1],
        begin: Alignment.centerRight,
        end: Alignment.bottomCenter,
          colors: [Colors.tealAccent,Colors.transparent]).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(path0, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
