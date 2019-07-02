import 'package:flutter/material.dart';
import 'package:flutter_system/demos/demo_animations.dart';

/// Home page
/// basic sketch : drawer + bottom navigation bar

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationsDemo(),
    );
  }
}
