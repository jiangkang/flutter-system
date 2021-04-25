import 'package:flutter/material.dart';

/// Button Demo
class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final raisedButtons = Container(
      padding: EdgeInsets.all(8.0),
      height: 60,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text("RaisedButton"),
          ),
          SizedBox(width: 10),
          RaisedButton(
            onPressed: null,
            child: Text("Disabled"),
          ),
          SizedBox(width: 10),
          RaisedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
              label: Text("Icon")),
          SizedBox(width: 10),
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              child: Text("Gradient", style: TextStyle(fontSize: 20)),
            ),
          )
        ],
      ),
    );

    final outlineButtons = Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            OutlineButton(
              onPressed: () {},
              child: Text("OutlineButton"),
            ),
            OutlineButton(
              onPressed: null,
              child: Text("Disabled"),
            ),
            OutlineButton.icon(
                onPressed: () {}, icon: Icon(Icons.info), label: Text("Icon"))
          ],
        ),
      ),
    );

    final flatButtons = Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TextButton(onPressed: () {}, child: Text("TextButton")),
            TextButton(onPressed: null, child: Text("Disabled")),
            TextButton.icon(
                onPressed: () {}, icon: Icon(Icons.check), label: Text("Icon"))
          ],
        ),
      ),
    );

    final toggleButtons = Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ToggleButtons(onPressed: (index) {}, children: <Icon>[
            Icon(Icons.ac_unit),
            Icon(Icons.call),
            Icon(Icons.cake),
          ], isSelected: [
            false,
            true,
            false
          ]),
        ),
      ),
    );

    final iconButtons = Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
          IconButton(icon: Icon(Icons.favorite), onPressed: null),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Button Demo"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          raisedButtons,
          outlineButtons,
          flatButtons,
          toggleButtons,
          iconButtons
        ],
      ),
    );
  }
}
