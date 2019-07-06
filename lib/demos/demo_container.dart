import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          width: 100,
          height: 100,
          child:
              DecoratedBox(decoration: BoxDecoration(color: Colors.pinkAccent)),
        ),
      ],
    );
  }
}
