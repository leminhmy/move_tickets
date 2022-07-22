import 'package:flutter/material.dart';

import '../../../widget/icon_shape_circle.dart';

class BottomCustom extends StatefulWidget {
  const BottomCustom({
    Key? key,
    required this.size, required this.indexPage,
  }) : super(key: key);

  final Size size;
  final ValueChanged<int> indexPage;

  @override
  State<BottomCustom> createState() => _BottomCustomState();
}

class _BottomCustomState extends State<BottomCustom> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;

  double valuePosition = -1.2;
  double caclulator = 0;
  int indexSelected = 0;
  int indexOut = 0;
  late Animation animationSize;

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    animationSize = Tween<double>(begin: 0.0,end: 0.0).animate(_animationController);
    _animationController.addListener(() {
      if(_animationController.value > 0.50){
        animationSize = Tween<double>(begin: widget.size.height * 0.005,end: widget.size.height * 0.09).animate(_animationController);
      }else{
        animationSize = Tween<double>(begin: widget.size.height * 0.09,end: widget.size.height * 0.005).animate(_animationController);
      }
    });
    _animationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> listIcon = [
      Icon(Icons.home,color: Colors.white,size: size.height * 0.035,),
      Icon(Icons.location_on_rounded,color: Colors.white,size: size.height * 0.035,),
      Icon(Icons.airplane_ticket,color: Colors.white,size: size.height * 0.035,),
      ImageIcon(const AssetImage('assets/icons/application.png'),color: Colors.white,size: size.height * 0.035,),
      Icon(Icons.person_rounded,color: Colors.white,size: size.height * 0.035,),
    ];


    return AnimatedBuilder(
        animation: _animationController,
        builder: (context,_) {
          double valueAnimation = caclulator * _animationController.value;
          if(_animationController.isCompleted){
            valuePosition = valuePosition +valueAnimation;
            valueAnimation = 0;
          }

          return Container(
            height: size.height * 0.1,
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
                              widget.indexPage(index);
                              indexOut = indexSelected;
                              _animationController.reset();
                              _animationController.forward();
                              indexSelected = index;
                              caclulator = ((-1.2+(0.6*index))-valuePosition);
                              _animationController.isCompleted;
                            }




                          },
                          child: Container(
                              alignment: indexSelected == index?Alignment(0,-_animationController.value):indexOut==index?Alignment(0,1-_animationController.value):const Alignment(0,0),
                              height: size.height * 0.08,
                              child: Opacity(
                                opacity: indexOut == index?_animationController.value:1,
                                  child: listIcon[index])),
                        ),
                        )
                    ),
                    Align(
                        alignment: Alignment(valuePosition+valueAnimation,-4),
                        child: SizedBox(
                          height: (size.height * 0.09),
                          width: (size.height * 0.09),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconShapeCircle(
                                shawdowBottom: true,
                                color: Color(0xff6f29d0),
                                sizeWidget: animationSize.value,widget: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  listIcon[indexSelected],
                                ],
                              ),),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}