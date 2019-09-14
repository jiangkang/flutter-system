import 'package:flutter/material.dart';

/// A tab Indicator
/// round corner at bottom of the tab
class RoundCornerTabIndicator extends Decoration {
  final BorderSide borderSide;

  final EdgeInsetsGeometry insets;

  RoundCornerTabIndicator({
    this.borderSide = const BorderSide(width: 4.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
  });

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _RoundCornerTabPainter(this, onChanged);
  }
}

class _RoundCornerTabPainter extends BoxPainter {
  _RoundCornerTabPainter(this.decoration, onChanged);

  final RoundCornerTabIndicator decoration;

  BorderSide get borderSide => decoration.borderSide;

  EdgeInsetsGeometry get insets => decoration.insets;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size;
    final TextDirection textDirection = configuration.textDirection;
    final Rect indicator =
        _indicatorRectFor(rect, textDirection).deflate(borderSide.width / 2.0);
    final Paint paint = borderSide.toPaint()..strokeCap = StrokeCap.round;
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
            indicator.left, indicator.top, indicator.right, indicator.bottom,
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6)),
        paint);
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - borderSide.width,
      indicator.width,
      borderSide.width,
    );
  }
}
