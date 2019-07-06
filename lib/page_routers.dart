import 'package:flutter/material.dart';
import 'package:flutter_system/demos/demo_container.dart';
import 'package:flutter_system/demos/demo_safearea.dart';
import 'package:flutter_system/demos/demo_text.dart';
import 'package:flutter_system/home.dart';
import 'package:flutter_system/page/guide.dart';

import 'demos/demo_pageview.dart';

/// 路由汇总
final Map<String, WidgetBuilder> pageRouters = {
  "/": (BuildContext context) => HomePage(),
  "/page/guide": (BuildContext context) => GuidePage(),
  "/demo/text": (BuildContext context) => TextDemo(),
  "/demo/container": (BuildContext context) => ContainerDemo(),
  "/demo/safearea": (BuildContext context) => SafeAreaDemo(),
  "/demo/pageview": (BuildContext context) => PageViewDemo(),
};
