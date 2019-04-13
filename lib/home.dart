import 'package:flutter/material.dart';
import 'package:flutter_system/widgets/demo_text.dart';

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
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: TextDemo(),
      ),
      drawer: Drawer(
          semanticLabel: "drawer",
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Title 0",
                ),
              ),
              ListTile(
                title: Text(
                  "Title 1",
                ),
              ),
              ListTile(
                title: Text(
                  "Title 2",
                ),
              ),
              ListTile(
                title: Text(
                  "Title 3",
                ),
              ),
              ListTile(
                title: Text(
                  "Title 4",
                ),
              ),
              ListTile(
                title: Text(
                  "Title 5",
                ),
              ),
            ],
          )),
    );
  }
}
