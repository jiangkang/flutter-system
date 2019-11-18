import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';

import 'animation/anim_animated_container.dart';
import 'demo_image.dart';

enum SlideDirection { right2left, bottom2top }

/// Animation Demos
/// 1. PageRouter Animation
/// 2. AnimatedContainer
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
          buildPageRouterAnimation(SlideDirection.bottom2top),
          buildPageRouterAnimation(SlideDirection.right2left),
          buildAnimatedContainer(),
          ListTileCard(
            title: Text("Transform"),
            onTap: () => Navigator.of(context).pushNamed("/demo/transform"),
          )
        ],
      )),
    );
  }

  /// 创建一个PageRouter动画
  Widget buildPageRouterAnimation(SlideDirection slideDirection) {
    return ListTileCard(
      borderRadius: 4,
      title: Text("PageRouter Animation"),
      subtitle: Text("Click here！"),
      trailing: Text(
          slideDirection == SlideDirection.bottom2top ? "从下往上滑入" : "从右往左滑入"),
      onTap: () =>
          Navigator.of(context).push(_createPageRouter(slideDirection)),
    );
  }

  Route _createPageRouter(SlideDirection slideDirection) {
    return PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation animation, Animation secondaryAnimation) {
      return ImageDemo();
    }, transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      var begin = Offset(0, 1);
      if (slideDirection == SlideDirection.right2left) {
        begin = Offset(1, 0);
      }
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

  buildAnimatedContainer() => ListTileCard(
        borderRadius: 4,
        title: Text("AnimatedContainer Demo"),
        subtitle: Text("Widget属性动画"),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AnimatedContainerDemo()));
        },
      );
}
