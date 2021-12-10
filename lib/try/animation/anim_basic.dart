import 'package:flutter/material.dart';

class AnimBasic extends StatefulWidget {
  @override
  _AnimBasicState createState() => _AnimBasicState();
}

class _AnimBasicState extends State<AnimBasic>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    _animation = Tween(begin: 100.0, end: 360.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        setState(() {
          if (_animation.isDismissed) {
            // stop at beginning
            _animationController.forward();
          } else if (_animation.isCompleted) {
            //stop at end
            _animationController.reverse();
          }
        });
      });
    ;
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Basic"),
      ),
      body: SafeArea(
        child: Center(
          child: Image.asset(
            "images/landscape2.jpeg",
            width: _animation.value,
            height: _animation.value,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: AnimBasic(),
  ));
}
