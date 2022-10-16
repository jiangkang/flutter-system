import 'package:flutter/material.dart';

/// Button Demo
class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final raisedButtons = Container(
      padding: EdgeInsets.all(8.0),
      height: 60,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TextButton(
            onPressed: () {},
            child: Text("TextButton"),
          ),
          SizedBox(width: 10),
          TextButton(
            onPressed: null,
            child: Text("Disabled"),
          ),
          SizedBox(width: 10),
          TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
              label: Text("Icon")),
          SizedBox(width: 10),
          TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: const [
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
            ElevatedButton(
              onPressed: () {},
              child: Text("ElevatedButton"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Disabled"),
            ),
            ElevatedButton.icon(
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
          child: ToggleButtons(onPressed: (index) {}, children: const <Icon>[
            Icon(Icons.ac_unit),
            Icon(Icons.call),
            Icon(Icons.cake),
          ], isSelected: const [
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
