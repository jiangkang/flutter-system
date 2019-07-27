import 'dart:math';

import 'package:flutter/material.dart';

/// AnimatedContainer Demo
class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() {
    return _AnimatedContainerDemoState();
  }
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  double _width = 50.0;
  double _height = 50.0;

  Color _color = Colors.blue;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer Demo"),
        centerTitle: true,
      ),
      body: InkWell(
        onTap: () {
          _change();
        },
        child: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(color: _color, borderRadius: _borderRadius),
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.swap_horiz),
          onPressed: () {
            _change();
          }),
    );
  }

  void _change() {
    setState(() {
      final random = Random();
      _width = random.nextInt(360).toDouble();
      _height = random.nextInt(360).toDouble();

      _color = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1.0);
      _borderRadius = BorderRadius.circular(random.nextInt(360).toDouble());
    });
  }
}
