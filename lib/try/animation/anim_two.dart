import 'package:flutter/material.dart';

class AnimTwoDemo extends StatefulWidget {
  const AnimTwoDemo({Key? key}) : super(key: key);

  @override
  _AnimTwoDemoState createState() => _AnimTwoDemoState();
}

class _AnimTwoDemoState extends State<AnimTwoDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        setState(() {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("两个Animation同时运行"),
      ),
      body: AnimatedLogo(
        animation: _animation,
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  static final _tweenOpacity = Tween<double>(begin: 0.0, end: 1.0);
  static final _tweenSize = Tween<double>(begin: 100.0, end: 360.0);

  const AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _tweenOpacity.evaluate(animation),
        child: SizedBox(
          width: _tweenSize.evaluate(animation),
          height: _tweenSize.evaluate(animation),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: AnimTwoDemo(),
    ));
