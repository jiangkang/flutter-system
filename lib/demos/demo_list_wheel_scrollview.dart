import 'package:flutter/material.dart';

class ListWheelScrollViewDemo extends StatefulWidget {
  @override
  _ListWheelScrollViewDemoState createState() =>
      _ListWheelScrollViewDemoState();
}

class _ListWheelScrollViewDemoState extends State<ListWheelScrollViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListWheelScrollView"),
        centerTitle: true,
      ),
      body: ListWheelScrollView(
        itemExtent: 60,
        controller: FixedExtentScrollController(),
        physics: FixedExtentScrollPhysics(),
        children: List.generate(
            100,
            (index) => ListTile(
                  title: Text("$index"),
                )),
      ),
    );
  }
}
