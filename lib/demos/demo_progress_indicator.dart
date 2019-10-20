import 'package:flutter/material.dart';
import 'package:flutter_system/frouter/router.dart';

@Router("/demo/progress_indicator")
class ProgressIndicatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress Indicator"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.count(
          children: <Widget>[
            Card(child: Center(child: LinearProgressIndicator())),
            Card(
                child: Center(
                    child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.yellow),
            ))),
            Card(
                child: Center(
                    child: LinearProgressIndicator(
              value: 0.5,
            ))),
            Card(
                child: Center(
                    child: LinearProgressIndicator(
              value: 0.1,
            ))),
            Card(
                child: Center(
                    child: LinearProgressIndicator(
              value: 1,
            ))),
            Card(child: Center(child: CircularProgressIndicator())),
            Card(child: Center(child: RefreshProgressIndicator())),
            Card(
                child: Center(
                    child: RefreshProgressIndicator(
              backgroundColor: Colors.pinkAccent,
            ))),
          ],
          crossAxisCount: 2,
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
