import 'dart:math';

import 'package:flutter/material.dart';

import 'basic_shape.dart';

class BasicParticles extends StatefulWidget {
  @override
  _BasicParticlesState createState() => _BasicParticlesState();
}

class _BasicParticlesState extends State<BasicParticles>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  Tween<double> _angletween;

  @override
  void initState() {
    super.initState();
    _angletween = Tween(begin: 0, end: 2 * pi);
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = _angletween.animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: PureBgPainter(),
      foregroundPainter: BasicParticle(_animation.value),
    );
  }
}

class BasicParticle extends CustomPainter {
  final double radius;

  BasicParticle(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // canvas.drawCircle(Offset(centerX, centerY), radius, paint);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: 30),
        0,
        radius,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
