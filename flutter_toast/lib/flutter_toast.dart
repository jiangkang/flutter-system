library flutter_toast;

import 'package:flutter/material.dart';

class Toast {
  Toast._();

  static void showMessage(BuildContext context, String message,
      {int duration = 3,
      Color bgColor = Colors.white,
      Color fontColor = Colors.black}) {
    final entry = OverlayEntry(
        builder: (context) => Positioned(
              top: MediaQuery.of(context).size.height * 0.8,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    elevation: 10,
                    shadowColor: Colors.transparent,
                    color: bgColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: Text(
                        message,
                        style: TextStyle(color: fontColor, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ));
    Overlay.of(context).insert(entry);
    Future.delayed(Duration(seconds: duration))
        .then<void>((value) => {entry.remove()});
  }
}
