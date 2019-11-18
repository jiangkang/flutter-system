import 'package:flutter/material.dart';

/// 圆角矩形Border
ShapeBorder roundedRectBorder(double radius) => RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );

/// 显示SnackBar
void showSnackBar(BuildContext context, String content) {
  Scaffold.of(context).showSnackBar(SnackBar(content: Text(content)));
}
