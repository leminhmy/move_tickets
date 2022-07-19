import 'package:flutter/material.dart';
import 'package:move_tickets/screens/seats/seats_screen.dart';
import 'package:move_tickets/screens/ticket/ticket_screen.dart';
import 'package:move_tickets/screens/your_ticket/your_ticket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const YourTicket(),
    );
  }
}

