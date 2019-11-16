import 'package:flutter/material.dart';

class ChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chip"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Chip(label: Text("Default")),
          Chip(
            label: Text("Default"),
            backgroundColor: Colors.redAccent,
          ),
          Chip(
            label: Text("Default"),
            avatar: Icon(Icons.check),
          ),
          FilterChip(label: Text("Fliter Chip"), onSelected: null),
          InputChip(
            label: Text("Input Chip"),
            deleteIcon: Icon(Icons.close),
          ),
          Chip(
            label: Text("Default"),
            avatar: CircleAvatar(
              backgroundColor: Colors.deepOrange,
            ),
          )
        ],
      ),
    );
  }
}
