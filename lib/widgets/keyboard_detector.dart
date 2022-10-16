import 'dart:math';

import 'package:flutter/material.dart';

mixin KeyboardDetectorMixin on State implements WidgetsBindingObserver {

  bool keyboardShowing = false;

  double realKeyboardHeight = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double bottom = MediaQuery.maybeOf(context)?.viewInsets.bottom ?? 0.0;
      if (bottom > 0) {
        keyboardShowing = true;
      } else {
        keyboardShowing = false;
      }
      realKeyboardHeight = max(realKeyboardHeight, bottom);
    });
  }
}
