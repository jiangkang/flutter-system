import 'dart:math';

import 'package:flutter/material.dart';

class AnimContainerDemo extends StatefulWidget {
  @override
  _AnimContainerDemoState createState() => _AnimContainerDemoState();
}

class _AnimContainerDemoState extends State<AnimContainerDemo> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 3),
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(color: _color, borderRadius: _borderRadius),
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(360).toDouble();
            _height = random.nextInt(360).toDouble();
            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: Icon(Icons.track_changes),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: AnimContainerDemo(),
    ));
