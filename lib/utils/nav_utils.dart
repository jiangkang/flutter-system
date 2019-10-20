import 'package:flutter/material.dart';
import 'package:flutter_system/page/web_page.dart';

class NavUtils {
  /// 打开WebView
  static Future openWebView(BuildContext context, String webUrl,
      {String title = ""}) async {
    await Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return WebPage(title, webUrl);
    }));
  }

  /// 通过路由名字跳转
  static navByRouterName(BuildContext context, String routerName) {
    Navigator.of(context).pushNamed(routerName);
  }

  /// 跳转指定页面
  static navToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
