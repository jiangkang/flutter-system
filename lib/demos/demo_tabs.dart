import 'package:flutter/material.dart';
import 'package:flutter_system/page/page_entry.dart';

class TabsDemo extends StatefulWidget {
  @override
  _TabsDemoState createState() {
    return _TabsDemoState();
  }
}

class _TabsDemoState extends State<TabsDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tabs Demo"),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.book),
              ),
              Tab(
                icon: Icon(Icons.videocam),
              ),
              Tab(
                icon: Icon(Icons.games),
              ),
            ]),
          ),
          body:
              TabBarView(children: [ArticleEntry(), PageEntry(), DemoEntry()]),
        ));
  }
}
