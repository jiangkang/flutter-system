import 'dart:math';

import 'package:flutter/material.dart';

/// Transform Demo
class TransformDemo extends StatefulWidget {
  @override
  _TransformDemoState createState() => _TransformDemoState();
}

class _TransformDemoState extends State<TransformDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _animRotate;

  Animation<double> _animScale;

  Animation<Offset> _animTranslate;

  Animation _curvedAnim;

  VoidCallback _callback;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    _curvedAnim = CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn);

    _callback = () {
      setState(() {});
    };

    _animRotate = Tween<double>(begin: 0, end: pi * 2.3).animate(_curvedAnim)
      ..addListener(_callback);
    _animScale = Tween(begin: 0.0, end: 0.9).animate(_controller)
      ..addListener(_callback)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // 动画恢复到初始状态时进行
          _controller.forward();
        }
      });
    _animTranslate = Tween(begin: Offset(0, 0), end: Offset(100, 100))
        .animate(_curvedAnim)
          ..addListener(_callback);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform Demo"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Transform.rotate(
            angle: _animRotate.value,
            child: Image.asset(
              "images/banner.jpg",
              width: 100,
              height: 100,
            ),
          ),
          Transform.scale(
            scale: _animScale.value,
            child: Image.asset(
              "images/landscape0.jpeg",
            ),
          ),
          Transform.translate(
            offset: _animTranslate.value,
            child: Image.asset(
              "images/landscape1.jpeg",
              width: 200,
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}
