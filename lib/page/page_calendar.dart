import 'package:flutter/material.dart';
import 'package:flutter_system/component/calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

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
        child: Column(
          children: const <Widget>[
            Calendar(
              startDayOfWeek: StartDayOfWeek.sunday,
              calendarLanguage: CalendarLanguage.english,
              weekTextStyle: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
