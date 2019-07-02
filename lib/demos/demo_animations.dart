import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Animations Demo
class AnimationsDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationsState();
}

class _AnimationsState extends State<AnimationsDemo> {
  Color _color;

  Duration _duration;

  @override
  void initState() {
    super.initState();
    _color = Color(0xFF0000FF);
    _duration = Duration(milliseconds: 5000);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _color = Colors.deepOrange;
        });
      },
      child: AnimatedContainer(
        duration: _duration,
        color: _color,
        child: SizedBox(
          width: 360,
          height: 360,
        ),
      ),
    );
  }
}
