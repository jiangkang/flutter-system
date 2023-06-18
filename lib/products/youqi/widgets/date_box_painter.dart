import 'package:flutter/material.dart';

class DateBoxPainter extends CustomPainter {
  final Paint _painter = Paint()
    ..color = Colors.white
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(6, size.height - 6), Offset(size.height - 6, 6), _painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}