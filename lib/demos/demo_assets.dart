import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:flutter_system/model/model_entry.dart';
import 'package:flutter_system/storage/storage_assets.dart';
import 'package:flutter_system/utils/nav_utils.dart';

/// Assets Demo
/// 1. 读取字符串
/// 2. 读取结构性数据
class AssetsDemo extends StatefulWidget {
  @override
  _AssetsDemoState createState() {
    return _AssetsDemoState();
  }
}

class _AssetsDemoState extends State<AssetsDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assets Demo"),
        centerTitle: true,
      ),
      body: SafeArea(
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
              })),
    );
  }
}
