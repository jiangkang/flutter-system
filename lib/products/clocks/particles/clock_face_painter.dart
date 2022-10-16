import 'dart:math';

import 'package:flutter/material.dart';

const int MIN_OF_HOUR = 60;

/// 时钟盘面
class ClockFacePainter extends CustomPainter {
  final Color? color;

  ClockFacePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var cx = size.width / 2;
    var cy = size.height / 2;
    var radius = min(size.width / 2, size.height / 2);
    var dotRadius = radius * 0.012;

    var paint = Paint()
      ..color = color!
      ..strokeWidth = dotRadius * 0.5;

    for (var i = 0; i < MIN_OF_HOUR; i++) {
      var angle = i * 60 * 2 * pi / 360.0;
      var point = Offset(cx + radius * sin(angle), cy - radius * cos(angle));
      if (i % 5 == 0) {
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(point, dotRadius * 2, paint);
      } else {
        paint.style = PaintingStyle.stroke;
        canvas.drawCircle(point, dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
