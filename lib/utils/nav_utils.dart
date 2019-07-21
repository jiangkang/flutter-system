import 'package:flutter/material.dart';
import 'package:flutter_system/page/web_page.dart';

class NavUtils {
  /// 打开WebView
  static void openWebView(BuildContext context, String webUrl,
      {String title = ""}) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return WebPage(title, webUrl);
    }));
  }
}
