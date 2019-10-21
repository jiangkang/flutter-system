import 'dart:ui';
import 'dart:ui' as prefix0;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomPaintDemo extends StatefulWidget {
  @override
  _CustomPaintDemoState createState() => _CustomPaintDemoState();
}

class _CustomPaintDemoState extends State<CustomPaintDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomPaint"),
        centerTitle: true,
      ),
      body: Center(
        child: CustomPaint(
          size: Size(360, 360),
          painter: BackgroundPainter(),
          foregroundPainter: SimplePainter(),
        ),
      ),
    );
  }
}

/// 围棋棋盘盘面，由 18x18个方格和19x19条线组成
class BackgroundPainter extends CustomPainter {
  Paint myPaint = Paint();
  final stars = [
    Offset(3, 3),
    Offset(9, 3),
    Offset(15, 3),
    Offset(3, 9),
    Offset(9, 9),
    Offset(15, 9),
    Offset(3, 15),
    Offset(9, 15),
    Offset(15, 15),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    double cellWidth = size.width / 18;
    double cellHeight = size.height / 18;

    myPaint
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);
    canvas.drawRect(Offset.zero & size, myPaint);

    myPaint
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 18; i++) {
      double dy = cellHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), myPaint);
    }

    for (int i = 0; i <= 18; i++) {
      double dx = cellWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), myPaint);
    }

    myPaint
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    stars.forEach((star) {
      canvas.drawCircle(star * cellWidth, 2, myPaint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// 绘制零星几个棋子
class SimplePainter extends CustomPainter {
  Paint blackPaint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.fill;
  Paint whitePaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  final blacks = [
    Offset(2, 1),
    Offset(2, 2),
    Offset(2, 0),
    Offset(11, 2),
    Offset(13, 7),
    Offset(7, 7),
  ];
  final whites = [
    Offset(2, 3),
    Offset(3, 2),
    Offset(1, 2),
    Offset(8, 3),
    Offset(9, 12),
    Offset(10, 11),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    double cellWidth = size.width / 18;
    double cellHeight = size.height / 18;

    blacks.forEach((offset) {
      blackPaint
        ..shader = prefix0.Gradient.radial(
            offset * cellWidth, 9, [Colors.black, Colors.grey[850]]);
      canvas.drawCircle(offset * cellWidth, 9, blackPaint);
    });

    whites.forEach((offset) {
      whitePaint
        ..shader = prefix0.Gradient.radial(
            offset * cellWidth, 9, [Colors.white, Colors.grey[100]]);
      canvas.drawCircle(offset * cellWidth, 9, whitePaint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
