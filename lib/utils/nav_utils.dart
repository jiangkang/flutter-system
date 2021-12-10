import 'package:flutter/material.dart';
import 'package:flutter_system/page/web_page.dart';

class NavUtils {
  /// 打开WebView
  static Future openWebView(BuildContext context, String? webUrl,
      {String? title = ""}) async {
    await Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return WebPage(title, webUrl);
    }));
  }

  /// 通过路由名字跳转
  static navByRouterName(BuildContext context, String routerName) {
    Navigator.of(context).pushNamed(routerName);
    Navigator.of(context).pop();
  }

  /// 跳转指定页面
  static navToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  /// 动画跳转
  static animToPage(BuildContext context, Widget page) {
    final router = PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return page;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        // child是pageBuilder中返回的，一般在这里处理转场动画
        return child;
      },
    );
    Navigator.of(context).push(router);
  }

  static navToPageWithData(BuildContext context, Widget page, Object data) {
    Navigator.of(context).pushNamed("/demo", arguments: data);
  }
}
