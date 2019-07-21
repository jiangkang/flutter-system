import 'package:flutter/material.dart';
import 'package:flutter_system/page/web_page.dart';

class NavUtils {
  /// 打开WebView
  static Future openWebView(BuildContext context, String webUrl,
      {String title = ""}) async {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return WebPage(title, webUrl);
    }));
  }
}
