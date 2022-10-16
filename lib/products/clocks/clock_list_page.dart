import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';

class ClockListPage extends StatefulWidget {
  const ClockListPage({Key? key}) : super(key: key);

  @override
  _ClockListPageState createState() => _ClockListPageState();
}

class _ClockListPageState extends State<ClockListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: <Widget>[
        ListTileCard(
          title: Text("Particle Clock"),
          onTap: () {},
        )
      ],
    ));
  }
}
