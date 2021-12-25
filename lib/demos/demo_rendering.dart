
import 'package:flutter/rendering.dart';

void main() {
  // We use RenderingFlutterBinding to attach the render tree to the window.
  RenderingFlutterBinding(
    // The root of our render tree is a RenderPositionedBox, which centers its
    // child both vertically and horizontally.
    root: RenderPositionedBox(
      // We use a RenderParagraph to display the text 'Hello, world.' without
      // any explicit styling.
      child: RenderParagraph(
        const TextSpan(text: 'Hello, world.'),
        // The text is in English so we specify the text direction as
        // left-to-right. If the text had been in Hebrew or Arabic, we would
        // have specified right-to-left. The Flutter framework does not assume a
        // particular text direction.
        textDirection: TextDirection.ltr,
      ),
    ),
  ).scheduleFrame();
}
