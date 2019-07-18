import 'package:flutter/material.dart';

/// Run demo page
void runDemo(Widget widget, {String title = ""}) => runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: widget),
    ));
