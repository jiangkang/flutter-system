import 'package:flutter/material.dart';
import 'package:flutter_system/generated/i18n.dart';
import 'package:url_launcher/url_launcher.dart';

import 'page/page_entry.dart';

const List<String> titles = [
  "页面",
  "组件",
  "实例",
  "文章",
];

/// Home page
/// basic sketch : drawer + bottom navigation bar
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages = [
    PageEntry(),
    ComponentEntry(),
    DemoEntry(),
    ArticleEntry()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_currentIndex]),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.network(
                "https://github.com/fluidicon.png",
                width: 32,
                height: 32,
              ),
            ),
            onTap: () {
              launch("https://github.com/jiangkang/flutter-system");
            },
          ),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.pageview),
              title: Text(S.of(context).page),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text(S.of(context).component),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.gps_fixed),
              title: Text(S.of(context).demo),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text(S.of(context).article),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launch("https://github.com/jiangkang/flutter-system");
        },
        child: Icon(
          Icons.favorite,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
