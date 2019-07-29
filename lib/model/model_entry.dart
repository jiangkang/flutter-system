import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class Article {
  final String title;
  final String url;

  Article(this.title, this.url);

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(json["title"] as String, json["url"] as String);
  }

  Map<String, String> toJson(Article article) {
    return {"title": article.title, "url": article.url};
  }
}

@immutable
class EntryItem {
  final String title;
  final String routerName;
  final IconData icon;

  EntryItem(this.title, this.routerName, {this.icon});
}
