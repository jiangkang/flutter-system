import 'package:flutter/material.dart';

import 'demo_image.dart';

/// Animation Demos
/// 1. PageRouter Animation
class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() {
    return _AnimationDemoState();
  }
}

class _AnimationDemoState extends State<AnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Demo"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          buildPageRouterAnimation(),
        ],
      )),
    );
  }

  /// 创建一个PageRouter动画
  Widget buildPageRouterAnimation() {
    return ListTile(
      title: Text("PageRouter Animation"),
      subtitle: Text("Click here！"),
      onTap: () => Navigator.of(context).push(_createPageRouter()),
    );
  }

  Route _createPageRouter() {
    return PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation animation, Animation secondaryAnimation) {
      return ImageDemo();
    }, transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      var begin = Offset(0, 1);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        child: child,
        position: offsetAnimation,
      );
    });
  }
}
