import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';

class TimeDemo extends StatefulWidget {
  @override
  _TimeDemoState createState() => _TimeDemoState();
}

class _TimeDemoState extends State<TimeDemo> {
  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final timeOfDay = TimeOfDay.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Demo"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTileCard(
              title: Text(now.toIso8601String()),
              subtitle: Text("now.toIso8601String()"),
            ),
            ListTileCard(
              title: Text(now.millisecondsSinceEpoch.toString()),
              subtitle: Text("转时间戳"),
            ),
            ListTileCard(
              title: Text(
                  ("${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}")),
              subtitle: Text(
                  "now.year-now.month-now.day now.hour:now.minute:now.second"),
            ),
            ListTileCard(
              title: Text(("星期${now.weekday}")),
              subtitle: Text("now.weekday"),
            ),
            ListTileCard(
              title: Text((now.subtract(Duration(days: 2)).toIso8601String())),
              subtitle: Text("now.subtract(Duration(days: 2)):前两天"),
            ),
            ListTileCard(
              title: Text((now.add(Duration(days: 2)).toIso8601String())),
              subtitle: Text("now.add(Duration(days: 2)):后两天"),
            ),
            ListTileCard(
              title: Text((now
                  .add(Duration(days: 2))
                  .difference(now)
                  .inHours
                  .toString())),
              subtitle: Text("DateTime.difference:求时间差值"),
            ),
            ListTileCard(
              title: Text(timeOfDay.period.toString()),
              subtitle: Text("timeOfDay.period:上午还是下午"),
            ),
            ListTileCard(
              title: Text("${timeOfDay.hour}:${timeOfDay.minute}"),
              subtitle: Text("timeOfDay.hour 24小时制"),
            ),
            ListTileCard(
              title: Text("${timeOfDay.hourOfPeriod}:${timeOfDay.minute}"),
              subtitle: Text("timeOfDay.hourOfPeriod 12小时制"),
            ),
            ListTileCard(
              title: Text("${timeOfDay.format(context)}"),
              subtitle: Text("timeOfDay.format(context) 12小时制格式化显示"),
            ),
          ],
        ),
      ),
    );
  }
}
