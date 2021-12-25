import 'package:flutter/material.dart';

RouteObserver<Route<dynamic>> demoRouteObserver = RouteObserver();

/// Run demo page
void runDemo(Widget widget, {String title = ""}) {
  runApp(
    MaterialApp(
      navigatorObservers: [
        demoRouteObserver,
      ],
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: widget,
      ),
    ),
  );
}
