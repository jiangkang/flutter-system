import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
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
