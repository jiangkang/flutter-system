import 'package:flutter/material.dart';

class ListWheelScrollViewDemo extends StatefulWidget {
  const ListWheelScrollViewDemo({Key? key}) : super(key: key);

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
            (index) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  child: ListTile(
                    title: Text("$index"),
                  ),
                )),
      ),
    );
  }
}
