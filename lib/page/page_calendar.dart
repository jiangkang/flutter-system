import 'package:flutter/material.dart';
import 'package:flutter_system/component/calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        child: Calendar(),
      )),
    );
  }
}
