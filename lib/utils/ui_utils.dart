import 'package:flutter/material.dart';

/// 圆角矩形Border
ShapeBorder roundedRectBorder(double radius) => RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
