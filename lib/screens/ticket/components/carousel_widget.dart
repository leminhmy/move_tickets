import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../widget/big_text.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({
    Key? key, this.colorAutoChange1 = false, this.colorAutoChange2 = false,
  }) : super(key: key);

  final bool colorAutoChange1;
  final bool colorAutoChange2;

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {

  final CarouselController _carouselController = CarouselController();

  int indexItem = 0;

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      itemCount: 6,
      carouselController: _carouselController,
      options: CarouselOptions(
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          viewportFraction: 0.2,
          height: size.height * 0.35,

          onPageChanged: (index, reason){
            setState(()=>indexItem = index);
          }

      ),
      itemBuilder: (context,index, indexPage){
        return  GestureDetector(
          onTap: (){
            _carouselController.animateToPage(index);
          },
          child: SingleChildScrollView(
            child: index == indexItem?SizedBox(

              width: size.height * 0.08,
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.height * 0.01),
                        gradient: widget.colorAutoChange1?LinearGradient(
                            stops: const [0,0.3],
                            begin: const Alignment(-1.2,0),
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.pink.shade300,
                              Colors.purple.shade800,
                            ]
                        ):const LinearGradient(
                            stops: [0,0.3],
                            begin: Alignment(-1.2,0),
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.tealAccent,
                              Color(0xff07073b),
                            ]
                        )
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.height * 0.01),
                        gradient: widget.colorAutoChange1?LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.pink.shade700,
                            Colors.purple.shade800,
                          ],
                        ):LinearGradient(
                          begin: const Alignment(0,-5),
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.indigo.shade200,
                            const Color(0xff07073b),
                          ],
                        ),

                      ),
                      child: Column(
                        children: [
                          const BigText(text: "Thu",color: Colors.grey,),
                          const SizedBox(height: 5,),
                          BigText(text: index.toString(),fontSize: size.height * 0.025,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02,),
                  widget.colorAutoChange2?Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.height * 0.02),
                        gradient: LinearGradient(
                            stops: const [0,1],
                            begin: const Alignment(-1.2,0),
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.pink.shade300,
                              Colors.purple.shade800,
                            ]
                        )
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.height * 0.02),
                        gradient: LinearGradient(
                          begin: const Alignment(0,-5),
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.pink.shade400,
                            Colors.purple.shade800,
                          ],
                        ),

                      ),
                      child: const BigText(text: "16:00",color: Colors.grey,),

                    ),
                  ):Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                            stops: [0,1],
                            begin: Alignment(-1.4,0),
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.tealAccent,
                              Color(0xff07073b),
                            ]
                        )
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: const Alignment(0,-5),
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.indigo.shade200,
                            const Color(0xff07073b),
                          ],
                        ),

                      ),
                      child: const BigText(text: "16:00",color: Colors.grey,),

                    ),
                  ),
                ],
              ),
            ):SizedBox(
              width: size.height * 0.06,
              height: size.height * 0.2,
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.height * 0.01),
                        gradient: const LinearGradient(
                            stops: [0,0.3],
                            begin: Alignment(-1.2,0),
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.tealAccent,
                              Color(0xff07073b),
                            ]
                        )
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.025),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: const Alignment(0,-5),
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.indigo.shade200,
                            const Color(0xff07073b),
                          ],
                        ),

                      ),
                      child: Column(
                        children: [
                          const BigText(text: "Thu",color: Colors.grey,),
                          const SizedBox(height: 5,),
                          BigText(text: index.toString(),fontSize: size.height * 0.025,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02,),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                            stops: [0,1],
                            begin: Alignment(-1.4,0),
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.tealAccent,
                              Color(0xff07073b),
                            ]
                        )
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: const Alignment(0,-5),
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.indigo.shade200,
                            const Color(0xff07073b),
                          ],
                        ),

                      ),
                      child: const BigText(text: "16:00",color: Colors.grey,),

                    ),
                  )
                ],
              ),
            ),
          ),
        );

      },
    );
  }
}