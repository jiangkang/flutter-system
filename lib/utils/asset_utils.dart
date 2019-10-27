import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_system/model/model_entry.dart';
import 'package:flutter_system/products/youqi/youqi_model.dart';

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

  static Future<YouQiResponse> getYouQi(BuildContext context) async {}
}
