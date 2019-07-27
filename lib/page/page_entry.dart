import 'package:flutter/material.dart';
import 'package:flutter_system/entries.dart';
import 'package:flutter_system/utils/nav_utils.dart';

/// Page 入口
class PageEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          itemCount: pageEntries.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(pageEntries[index].routerName);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 28.0, bottom: 28.0, left: 10),
                  child: Text(pageEntries[index].title),
                ),
              ),
            );
          }),
    );
  }
}

/// Component 入口
class ComponentEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 3,
          children: List.generate(componentEntries.length, (index) {
            return Card(
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Icon(componentEntries[index].icon),
                    Text(componentEntries[index].title)
                  ],
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(componentEntries[index].routerName);
                },
              ),
            );
          })),
    );
  }
}

/// Demo 入口
class DemoEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 3,
          children: List.generate(demoEntries.length, (index) {
            return Card(
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Icon(demoEntries[index].icon),
                    Text(demoEntries[index].title)
                  ],
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(demoEntries[index].routerName);
                },
              ),
            );
          })),
    );
  }
}

/// Article 入口
class ArticleEntry extends StatelessWidget {
  final List<String> articles = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          itemCount: articleEntries.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  NavUtils.openWebView(context, articleEntries[index].url,
                      title: articleEntries[index].title);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 28.0, bottom: 28.0, left: 10),
                  child: Text(articleEntries[index].title),
                ),
              ),
            );
          }),
    );
  }
}
