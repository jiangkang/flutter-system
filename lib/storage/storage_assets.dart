import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_system/model/model_entry.dart';

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
