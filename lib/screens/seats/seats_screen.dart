import 'package:flutter/material.dart';
import 'package:move_tickets/models/seat.dart';
import 'package:move_tickets/screens/home/home_screen.dart';
import 'package:move_tickets/widget/big_text.dart';
import 'package:move_tickets/widget/icon_shape_circle.dart';
import 'package:move_tickets/widget/small_text.dart';

import 'components/choose_seats.dart';

class SeatScreen extends StatefulWidget {
  const SeatScreen({Key? key}) : super(key: key);

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  List<SeatModel> listSeats = demo_seat;
  List<SeatModel> selectedSeat = [];
  double totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height*0.02),
              child: Column(
                children: [
                  SizedBox(height: size.height*0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                          child: const IconShapeCircle(color: Colors.black,)),
                      BigText(text: "Chosse Seats",fontWeight: FontWeight.bold,fontSize: size.height * 0.025),
                      const IconShapeCircle(iconData: Icons.calendar_month_outlined,color: Colors.black,),

                    ],
                  ),
                  SizedBox(height: size.height*0.05,),
                  SizedBox(
                    height: 100,
                    width: size.width,
                    child: CustomPaint(
                      painter: SliderPaintCustom(),
                    ),
                  ),
                  SizedBox(height: size.height*0.05,),
                  ChooseSeatsWidget(onChange: (getSelected){
                    selectedSeat = getSelected;
                    totalPrice = 0;
                    for (var element in selectedSeat) {
                      totalPrice+=element.price;
                    }
                    setState((){});
                  },listSeats: listSeats,size: size),
                  SizedBox(height: size.height*0.05,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.height * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle,color: Colors.grey,size: size.height * 0.015,),
                            SizedBox(width: 5,),
                            SmallText(text: "Available",),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle,color: Colors.red,size: size.height * 0.015,),
                            SizedBox(width: 5,),
                            SmallText(text: "Reserved",),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle,color: Colors.tealAccent,size: size.height * 0.015,),
                            SizedBox(width: 5,),
                            SmallText(text: "Selected",),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Container(
              height: size.height * 0.25,
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      stops: [0,1],
                      radius: 1,
                      center: Alignment.bottomRight,
                      colors: [
                        Colors.pinkAccent.shade700,
                        Colors.deepPurple,
                      ]
                  )
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.white38,
                          Colors.transparent,
                        ]
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.75,
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * 0.04,right: size.height * 0.01,left: size.height * 0.04,bottom: size.height * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_month,color: Colors.white,size: size.height * 0.03,),
                                SizedBox(width: size.height * 0.01,),
                                SmallText(text: "Aprill 28, 2022",fontSize: size.height * 0.02),
                                SizedBox(width: size.height * 0.01,),
                                Icon(Icons.circle,color: Colors.white,size: size.height * 0.01,),
                                SizedBox(width: size.height * 0.01,),
                                SmallText(text: "6 p.m.",fontSize: size.height * 0.02),
                              ],
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.airplane_ticket,color: Colors.white,size: size.height * 0.03,),
                                SizedBox(width: size.height * 0.01,),
                                SmallText(text: "VIP section",fontSize: size.height * 0.02),
                                SizedBox(width: size.height * 0.01,),
                                Icon(Icons.circle,color: Colors.white,size: size.height * 0.01,),
                                SizedBox(width: size.height * 0.01,),
                                SmallText(text: "Seat ",fontSize: size.height * 0.02),
                                selectedSeat.isNotEmpty?SmallText(text: "${selectedSeat.map((e) => e.id).toList()}",fontSize: size.height * 0.02):const SizedBox(),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.shopping_cart,color: Colors.white,size: size.height * 0.03,),
                                SizedBox(width: size.height * 0.01,),
                                SmallText(text: "Total: \$$totalPrice",fontSize: size.height * 0.02),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(size.width),bottomLeft: Radius.circular(size.width)),

                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>const HomeScreen())),

                        child: Container(
                            margin: EdgeInsets.all(size.height * 0.02),
                            child: IconShapeCircle(color: Color(0xff424141),widget: Center(child: SmallText(text: "Buy",)),sizeWidget: size.height * 0.07,)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SliderPaintCustom extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
     double convertRadiusToSigma(double radius) {
      return radius * 0.57735 + 0.5;
    }
    Paint paint = Paint()
        ..color = Color(0xffeb3ab1)
        ..style = PaintingStyle.stroke
        ..maskFilter = MaskFilter.blur(BlurStyle.solid, convertRadiusToSigma(20))
        ..strokeCap = StrokeCap.round

        ..strokeWidth = 7;

    Path path = Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width/2.2,0,size.width, size.height);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
