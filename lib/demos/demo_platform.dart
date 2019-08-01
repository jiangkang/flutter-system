import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:flutter_system/platform/toast.dart';

class PlatformDemo extends StatefulWidget {
  @override
  _PlatformDemoState createState() {
    return _PlatformDemoState();
  }
}

class _PlatformDemoState extends State<PlatformDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Platform Special"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          ListTileCard(
            borderRadius: 4,
            title: Text("Show a Toast"),
            onTap: () {
              showToast("Are you familar with me?");
            },
          ),
        ],
      )),
    );
  }
}
