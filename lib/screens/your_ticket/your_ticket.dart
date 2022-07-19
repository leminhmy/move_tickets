import 'package:flutter/material.dart';
import 'package:move_tickets/widget/small_text.dart';

import '../../widget/big_text.dart';
import '../../widget/icon_shape_circle.dart';

class YourTicket extends StatelessWidget {
  const YourTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IconShapeCircle(
                    color: Colors.black,
                  ),
                  BigText(
                      text: "Chosse Seats",
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.025),
                  const IconShapeCircle(
                    iconData: Icons.calendar_month_outlined,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.06),
              child: SmallText(text: "Once you buy a movie ticket simply scan the barcode to acces to your movie",fontSize: size.height * 0.025,),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomCustom(),
    );
  }
}

class BottomCustom extends StatefulWidget {
  const BottomCustom({
    Key? key,

  }) : super(key: key);

  @override
  State<BottomCustom> createState() => _BottomCustomState();
}

class _BottomCustomState extends State<BottomCustom> with SingleTickerProviderStateMixin{
  
  late AnimationController _animationController;

  double valuePosition = -1.2;
  double caclulator = 0;
  int indexSelected = 0;
  
  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    _animationController.forward();
  }


  void setPostion(double value){

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('reBuildWidget');
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context,_) {
        double valueAnimation = caclulator * _animationController.value;

        if(_animationController.isCompleted){
          valuePosition = valuePosition +valueAnimation;
          valueAnimation = 0;
        }
        return Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: const [0.3,1],
              colors: [
                Colors.deepPurple.shade600,
                Color(0xffc504bf),
              ]
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: const Alignment(-0.9,0),
                colors: [
                  Colors.white12,
                  Colors.deepPurple.shade900,
                ]
              )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) => GestureDetector(
                      onTap: (){
                        if(_animationController.isAnimating){
                          print("isAnimating");
                        }if(_animationController.isCompleted || _animationController.isDismissed){
                          _animationController.reset();
                          _animationController.forward();
                          indexSelected = index;
                          caclulator = ((-1.2+(0.6*index))-valuePosition);
                          _animationController.isCompleted;
                        }




                      },
                      child: Container(
                          alignment: indexSelected == index?Alignment(0,-_animationController.value):Alignment(0,0),
                          height: 80,
                          child: Icon(Icons.home,color: Colors.white,size: size.height * 0.035,)),
                    ),
                    )
                  ),
                  Align(
                    alignment: Alignment(valuePosition+valueAnimation,-4),
                      child: IconShapeCircle(sizeWidget: 90)),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
