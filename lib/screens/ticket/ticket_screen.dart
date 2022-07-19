
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:move_tickets/widget/big_text.dart';
import 'package:move_tickets/widget/small_text.dart';
import 'package:readmore/readmore.dart';

import '../../widget/icon_shape_circle.dart';
import 'components/carousel_widget.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animationTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 4));
    _animationTween = Tween<double>(begin: -80.0,end: 0.0).animate(_animationController);
    _animationController.forward();

  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String textDemo = 'Doctor Strange in the Multiverse of Madness là một trong những bộ phim được chờ đợi nhất năm 2022. Như tiêu đề cho thấy, bộ phim sẽ đi sâu vào đa vũ trụ và chúng ta sẽ thấy những điều khác biệt phiên bản của Tiến sĩ Strange trong phim. Wanda cũng sẽ đóng một vai quan trọng trong phim và có lẽ cô ấy sẽ xuất hiện với tư cách là một nhân vật phản diện trong phim. Ngoài ra, bộ phim cũng sẽ có sự tham gia của một số nhân vật mới như America Chavez, Charles Xavier, và nhiều nhân vật khác.';

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Stack(
          children: [
            Container(
              height: size.height * 0.7,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [
                    0.2,
                    1
                  ],
                      colors: [
                    Colors.black,
                    Colors.transparent,
                  ])),
            ),
            SafeArea(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context,_) {
                  return Column(
                    children: [
                      Expanded(child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            right: size.height * 0.02,
                            left: size.height * 0.02,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                IconShapeCircle(color: Color(0xff43355a),),
                                IconShapeCircle(color: Color(0xff43355a),iconData: Icons.more_vert_outlined),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: _animationTween.value,
                            right: size.height * 0.01,
                            left: size.height * 0.01,
                            child: Column(
                              children: [
                                 BigText(text: "Doctor Strange",fontSize: size.height * 0.03,),
                                SmallText(text: "in the Multiverse of Madness",color: Colors.grey,fontWeight: FontWeight.w600,fontSize: size.height * 0.018,),
                                SizedBox(height: size.height * 0.02,),
                                ReadMoreText(
                                  textDemo,
                                  trimLines: 3,
                                  trimMode: TrimMode.Line,
                                  style: TextStyle(color: Colors.grey,fontSize: size.height * 0.018,fontWeight: FontWeight.w600),
                                  moreStyle: TextStyle(color: Colors.white,fontSize: size.height * 0.02,fontWeight: FontWeight.w600),
                                  trimCollapsedText: "read more",
                                  trimExpandedText: "show less",
                                ),
                                SizedBox(height: size.height * 0.02,),
                              ],
                            ),
                          ),

                        ],
                      )),
                      Expanded(child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Opacity(
                              opacity: _animationController.value < 0.3?0:1,
                                child: BigText(text: "Selected date and time",fontSize: size.height * 0.02,)),
                             SizedBox(
                              height: size.height * 0.02,
                            ),

                            Opacity(
                                opacity: _animationController.value < 0.35?0:1,
                                child: Column(
                                  children: [
                                    CarouselWidget(colorAutoChange1: _animationController.value <0.5?false:true,colorAutoChange2: _animationController.value <0.6?false:true,),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: size.height * 0.02),
                                      child: Container(
                                          padding: const EdgeInsets.all(3),
                                          margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(22),
                                            gradient: _animationController.value < 0.9?const LinearGradient(
                                                stops: [0,0.1],
                                                begin: Alignment(-0.3, 0.1),
                                                end: Alignment(0, 8),
                                                colors: [
                                                  Colors.tealAccent,
                                                  Color(0xff07073b),
                                                ]
                                            ):LinearGradient(
                                                stops: const [0,0.1],
                                                begin: const Alignment(-0.3, 0.1),
                                                end: const Alignment(0, 8),
                                                colors: [
                                                  Colors.pink.shade300,
                                                  Colors.purple.shade800,
                                                ]
                                            ),

                                          ),

                                          child: Container(
                                              width: double.maxFinite,
                                              alignment: Alignment.center,
                                              padding:  EdgeInsets.all(size.height * 0.02),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(size.height * 0.02),
                                                gradient: _animationController.value < 0.9?LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Colors.indigo.shade900,
                                                      const Color(0xff07073b),
                                                    ]
                                                ):LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Colors.pink.shade700,
                                                      Colors.purple.shade800,
                                                    ]
                                                ),

                                              ),
                                              child: BigText(text: "Reservation",fontSize: size.height * 0.02,))),
                                    ),

                                  ],
                                )),
                          ],
                        ),
                      )),

                    ],
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}



