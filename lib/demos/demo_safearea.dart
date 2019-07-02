import 'package:flutter/material.dart';

/// SafeArea Demo
class SafeAreaDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: List.generate(
            500,
            (index) => ListTile(
                  title: Text("$index"),
                )),
      ),
    );
  }
}
