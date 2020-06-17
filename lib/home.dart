import 'package:flutter/material.dart';
import 'package:flutter_system/generated/i18n.dart';
import 'package:flutter_system/utils/nav_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import 'page/page_entry.dart';

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
    List<String> _titles = [
      S.of(context).page,
      S.of(context).component,
      S.of(context).demo,
      S.of(context).article,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
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
      drawer: Drawer(
        child: Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: <Widget>[
                DrawerHeader(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  curve: Curves.bounceInOut,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Flutter System",
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                      Text(
                        "姜康",
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor),
                    child: ListView(
                      padding: EdgeInsets.all(10),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "设置",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          onTap: () {
                            NavUtils.navByRouterName(context, "/page/settings");
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
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
