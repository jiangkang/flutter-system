import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:flutter_system/entries.dart';
import 'package:flutter_system/model/model_entry.dart';
import 'package:flutter_system/storage/storage_assets.dart';
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
                    Text(
                      demoEntries[index].title,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    )
                  ],
                ),
                onTap: () {
                  Timeline.timeSync("Page Nav", () {
                    Navigator.of(context)
                        .pushNamed(demoEntries[index].routerName);
                  });
                },
              ),
            );
          })),
    );
  }
}

/// Article 入口
class ArticleEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<List<Article>>(
            future: AssetStorage.getArticleList(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final _articles = snapshot.data;
                return ListView.builder(
                    itemCount: _articles.length,
                    itemBuilder: (context, index) {
                      return ListTileCard(
                        borderRadius: 4,
                        title: Text("${_articles[index].title}"),
                        onTap: () {
                          NavUtils.openWebView(context, _articles[index].url,
                              title: _articles[index].title);
                        },
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
