import 'package:flutter/material.dart';

class ColorUtils {
  ColorUtils._();

  /// 解析颜色字符串
  /// * `colorString` 颜色格式为"#123456"
  static Color parseColor(String colorString) {
    if (colorString == null || colorString.isEmpty) {
      return null;
    } else {
      int colorInt = int.parse(colorString.substring(1), radix: 16);
      return Color(colorInt);
    }
  }
}
