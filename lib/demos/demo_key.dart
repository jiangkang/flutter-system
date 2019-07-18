import 'dart:math';

import 'package:flutter/material.dart';

class KeyDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _KeyDemoState();
}

class _KeyDemoState extends State<KeyDemo> {
  List<Widget> widgets = [
    RandomColorBlock(key: UniqueKey()),
    RandomColorBlock(key: UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widgets),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widgets.insert(0, widgets.removeAt(1));
          setState(() {});
        },
        child: Icon(Icons.swap_horiz),
      ),
    );
  }
}

class RandomColorBlock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RandomColorBlockState();

  RandomColorBlock({Key key}) : super(key: key);
}

class _RandomColorBlockState extends State<RandomColorBlock> {
  final Color randomColor = Color.fromARGB(Random().nextInt(256),
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: randomColor,
    );
  }
}

void main() => runApp(MaterialApp(home: KeyDemo()));
