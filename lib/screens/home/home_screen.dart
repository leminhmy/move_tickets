import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:move_tickets/screens/ticket/ticket_screen.dart';
import 'package:move_tickets/screens/your_ticket/your_ticket.dart';
import 'package:move_tickets/widget/big_text.dart';

import '../../models/movie.dart';
import 'components/bottom_custom.dart';
import 'components/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> pageScreen = [
    HomePage(),
    Container(child: Center(child: BigText(text: "Page IsEmpty")),),
    YourTicket(),
    Container(child: Center(child: BigText(text: "Page IsEmpty")),),
    Container(child: Center(child: BigText(text: "Page IsEmpty")),),
  ];
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white12,
      body: pageScreen[selectedPage],
      bottomNavigationBar: BottomCustom(size: size, indexPage: (int value) {
        setState(()=> selectedPage = value);
      },),
    );
  }
}


/*Container(
            decoration: BoxDecoration(
                color: Colors.tealAccent,
                shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 100,
                  spreadRadius: 200,
                  color: Colors.tealAccent.withOpacity(0.5)
                ),
                BoxShadow(
                  blurRadius: 60,
                  spreadRadius: 90,
                  color: Colors.tealAccent.withRed(50)
                )
              ]
            ),
          ),*/
