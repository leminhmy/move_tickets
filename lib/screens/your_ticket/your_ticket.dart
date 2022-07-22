import 'package:flutter/material.dart';
import 'package:move_tickets/widget/small_text.dart';

import '../../widget/big_text.dart';
import '../../widget/icon_shape_circle.dart';
import '../home/components/bottom_custom.dart';
import 'components/ticket_card.dart';
import 'components/ticket_card_background.dart';

class YourTicket extends StatelessWidget {
  const YourTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.indigo.shade900,
                      Colors.purple.shade800,
                    ]
                )

            ),
          ),
          Positioned(
            left: size.width/2,
            top: size.height * 0.4,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 100,
                        spreadRadius: 200,
                        color: Colors.tealAccent.withOpacity(0.3)
                    ),
                    BoxShadow(
                        blurRadius: 60,
                        spreadRadius: 90,
                        color: Colors.tealAccent.withOpacity(0.5)
                    )
                  ]
              ),
            ),
          ),
          Positioned(
            right: size.width*0.3,
            bottom: size.height * 0.4,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 100,
                        spreadRadius: 220,
                        color: Colors.purpleAccent.withOpacity(0.2)
                    ),
                    BoxShadow(
                        blurRadius: 70,
                        spreadRadius: 100,
                        color: Colors.purpleAccent.withOpacity(0.5)
                    )
                  ]
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const IconShapeCircle(
                        color: Color(0xff251e88),
                      ),
                      BigText(
                          text: "Chosse Seats",
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.025),
                      const IconShapeCircle(
                        iconData: Icons.calendar_month_outlined,
                        color: Color(0xff251e88),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.06),
                  child: SmallText(text: "Once you buy a movie ticket simply scan the barcode to acces to your movie",fontSize: size.height * 0.025,),
                ),
                Spacer(),
                PageTicket(size: size)


              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageTicket extends StatefulWidget {
  const PageTicket({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<PageTicket> createState() => _PageTicketState();
}

class _PageTicketState extends State<PageTicket> {

  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.size.height * 0.05,vertical: widget.size.height * 0.03),
              child: Stack(
                children: [
                  Transform.rotate(
                      angle: -0.1,
                      child: TicketCardBackground(sizeWidth: widget.size.width * 0.55,sizeHeight: widget.size.height * 0.5,)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform.rotate(
                        angle: 0.1,
                        child: TicketCardBackground(sizeWidth: widget.size.width * 0.55,sizeHeight: widget.size.height * 0.5,)),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.58,
              child: PageView.builder(
                  itemCount: 3,
                  onPageChanged: (indexPage) => setState(()=>indexSelected = indexPage),
                  padEnds: false,
                  itemBuilder: (context, index){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TicketCard(),
                      ],
                    );
                  }),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: widget.size.height * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => Padding(
              padding: EdgeInsets.only(right: widget.size.height * 0.01),
              child: Icon(Icons.circle,size: widget.size.height * 0.01,color: indexSelected == index?Colors.grey.shade200:Colors.grey,),
            )),
          ),
        ),
      ],
    );
  }
}


