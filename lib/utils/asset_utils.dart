import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_system/model/model_entry.dart';

class AssetUtils {
  AssetUtils._();

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

  static Future<String> getString(String filename, bool cache) async {
    return rootBundle.loadString(filename, cache: cache);
  }

  static Future<ByteData> getByteData(String filename) async {
    return rootBundle.load(filename);
  }
}
