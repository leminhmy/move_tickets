import 'package:flutter/material.dart';

import '../../../models/seat.dart';

class ChooseSeatsWidget extends StatefulWidget {
  const ChooseSeatsWidget({
    Key? key,
    required this.size, required this.listSeats, required this.onChange,
  }) : super(key: key);

  final Size size;
  final List<SeatModel> listSeats;
  final ValueChanged<List<SeatModel>> onChange;

  @override
  State<ChooseSeatsWidget> createState() => _ChooseSeatsWidgetState();
}

class _ChooseSeatsWidgetState extends State<ChooseSeatsWidget> {
  Color selectedSeats = Colors.grey;


  List<Color> listColor = List.generate(49, (index) => Colors.grey);
  void setColor(int index){
    if(listColor[index] == Colors.grey){
      listColor[index] = Colors.cyanAccent;
    }
    else{
      listColor[index] = Colors.grey;
    }
    widget.onChange(outIndexSelected());

  }

  List<SeatModel> outIndexSelected(){
    List<SeatModel> indexSelected = [];
    listColor.asMap().forEach((key, value) {
      if(value == Colors.cyanAccent)
        {
          indexSelected.add(widget.listSeats[key]);
        }
    });
    return indexSelected;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('testRebuild');
    return Column(
        children: List.generate(6, (indexColumn) {
          return
            indexColumn == 0?Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.size.height * 0.025),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(3, (index) {

                        return GestureDetector(
                            onTap: (){
                              // print(widget.listSeats[index]);
                              if(widget.listSeats[index].status!=1){
                                setColor(index);
                                setState((){
                                });
                              }

                            },
                            child: Padding(
                              padding:  EdgeInsets.all(size.height * 0.005),
                              child: Icon(Icons.chair,color: widget.listSeats[index].status!=1?listColor[index]:Colors.red,size: widget.size.height*0.04,),
                            ));
                      }),
                    ),
                    Row(
                      children: List.generate(3, (index) => GestureDetector(
                          onTap: (){
                            // print(widget.listSeats[index+3]);
                            if(widget.listSeats[index+3].status!=1){
                              setColor(index+3);
                              setState((){
                              });
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(size.height * 0.005),
                            child: Icon(Icons.chair,color:widget.listSeats[index+3].status!=1?listColor[index+3]:Colors.red,size: widget.size.height*0.04,),
                          ))),
                    ),


                  ]
              ),
            )
                :indexColumn == 1?Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.015),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(4, (index) => GestureDetector(
                          onTap: (){

                            // print(widget.listSeats[6+index]);
                            if(widget.listSeats[6+index].status!=1){
                              setColor(6+index);
                              setState((){
                              });
                            }
                          },
                          child: Padding(
                            padding:  EdgeInsets.all(size.height * 0.005),
                            child: Icon(Icons.chair,color: widget.listSeats[6+index].status!=1?listColor[6+index]:Colors.red,size: widget.size.height*0.04,),
                          ))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) => GestureDetector(
                          onTap: (){
                            // print(widget.listSeats[6+(index+4)]);
                            if(widget.listSeats[6+(index+4)].status!=1){
                              setColor(6+(index+4));
                              setState((){
                              });
                            }
                          },
                          child: Padding(
                            padding:  EdgeInsets.all(size.height * 0.005),
                            child: Icon(Icons.chair,color: widget.listSeats[10+index].status!=1?listColor[10+index]:Colors.red,size: widget.size.height*0.04,),
                          ))),
                    ),


                  ]
            ),
                )
                :indexColumn == 2?Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.005),
                  child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(8, (index) => GestureDetector(
                    onTap: (){
                      // print(widget.listSeats[index+14]);
                      if(widget.listSeats[index+14].status!=1){
                        setColor(index+14);
                        setState((){
                        });
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(size.height * 0.005),
                      child: Icon(Icons.chair,color: widget.listSeats[index+14].status!=1?listColor[index+14]:Colors.red,size: widget.size.height*0.04,),
                    )),),
            ),
                )


                :Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.01),
                  child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(9, (index) => GestureDetector(
                    onTap: (){
                      // print(widget.listSeats[index+(22+(9*(indexColumn-3)))]);
                      if(widget.listSeats[index+(22+(9*(indexColumn-3)))].status!=1){
                        setColor(index+(22+(9*(indexColumn-3))));
                        setState((){
                        });
                      }
                    },
                    child: Icon(Icons.chair,color: widget.listSeats[index+(22+(9*(indexColumn-3)))].status!=1?listColor[index+(22+(9*(indexColumn-3)))]:Colors.red,size: widget.size.height*0.04,)),),
            ),
                );
        }
        )
    );
  }
}
