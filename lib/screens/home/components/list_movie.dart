import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../../../widget/big_text.dart';
import '../../ticket/ticket_screen.dart';

class ListMovie extends StatelessWidget {
  const ListMovie({
    Key? key, required this.titleList, required this.listMovie,
  }) : super(key: key);

  final String titleList;
  final List<MovieModel> listMovie;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: BigText(text: titleList,color: Colors.white,fontWeight: FontWeight.bold,fontSize: size.height * 0.02),
        ),
        SizedBox(height: size.height * 0.02,),
        SizedBox(
          height: size.height * 0.18,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: listMovie.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>const TicketScreen())),
                child: Container(
                  margin: EdgeInsets.only(left: size.height * 0.02),
                  width: size.height * 0.135,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.height * 0.03),
                      image: DecorationImage(
                          image: AssetImage(listMovie[index].image!),
                          fit: BoxFit.cover
                      )
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
