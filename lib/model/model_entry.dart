import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class Article {
  final String title;
  final String url;

  Article(this.title, this.url);
}

@immutable
class EntryItem {
  final String title;
  final String routerName;
  final IconData icon;

  EntryItem(this.title, this.routerName, {this.icon});
}
