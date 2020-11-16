import 'package:flutter/material.dart';

class FittedBoxDemo extends StatefulWidget {
  @override
  _FittedBoxDemoState createState() => _FittedBoxDemoState();
}

class _FittedBoxDemoState extends State<FittedBoxDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FittedBox"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Card(
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "Understand With FittedBox",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 200,
                      child: Image.asset("images/landscape2.jpeg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
