import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: animation.value,
        height: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class AnimatedDemo extends StatefulWidget {
  @override
  _AnimatedDemoState createState() => _AnimatedDemoState();
}

class _AnimatedDemoState extends State<AnimatedDemo>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 100.0, end: 360.0).animate(_controller)
      ..addStatusListener((status) {
        setState(() {
          if (_animation.isDismissed) {
            // stop at beginning
            _controller.forward();
          } else if (_animation.isCompleted) {
            //stop at end
            _controller.reverse();
          }
        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedWidget"),
      ),
      body: AnimatedLogo(
        animation: _animation,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: AnimatedDemo(),
  ));
}
