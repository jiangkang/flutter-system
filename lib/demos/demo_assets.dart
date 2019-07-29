import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:flutter_system/model/model_entry.dart';
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
                            NavUtils.openWebView(context, _articles[index].url);
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

class AssetStorage {
  /// 从assets中获取字符串
  static Future<String> getStringFromAsset(
      BuildContext context, String path) async {
    return DefaultAssetBundle.of(context).loadString(path);
  }

  /// 从assets中读取Article列表数据
  static Future<List<Article>> getArticleList(BuildContext context) async {
    Future<List<Article>> Function(String value) _articleListParser =
        (jsonData) {
      final List<dynamic> list = json.decode(jsonData);
      final mapList = list.cast<Map<String, dynamic>>();
      return SynchronousFuture(mapList
          .map((Map<String, dynamic> map) => Article.fromJson(map))
          .toList());
    };
    return DefaultAssetBundle.of(context).loadStructuredData<List<Article>>(
        "assets/json/articles.json", _articleListParser);
  }
}
