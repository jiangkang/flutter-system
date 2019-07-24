import 'package:flutter/material.dart';
import 'package:flutter_system/demos/demo_container.dart';
import 'package:flutter_system/demos/demo_http.dart';
import 'package:flutter_system/demos/demo_image.dart';
import 'package:flutter_system/demos/demo_safearea.dart';
import 'package:flutter_system/demos/demo_text.dart';
import 'package:flutter_system/page/guide.dart';
import 'package:flutter_system/page/page_show0.dart';

import 'demos/demo_gridview.dart';
import 'demos/demo_pageview.dart';
import 'demos/demo_video.dart';
import 'home.dart';
import 'page/page_markdown.dart';

/// 路由汇总
final Map<String, WidgetBuilder> pageRouters = {
  "/": (BuildContext context) => HomePage(),
  "/page/guide": (BuildContext context) => GuidePage(),
  "/page/show0": (BuildContext context) => Show0Page(),
  "/page/markdown": (BuildContext context) => MarkDownEditorPage(),
  "/demo/text": (BuildContext context) => TextDemo(),
  "/demo/image": (BuildContext context) => ImageDemo(),
  "/demo/http": (BuildContext context) => HttpDemo(),
  "/demo/gridview": (BuildContext context) => GridDemo(),
  "/demo/container": (BuildContext context) => ContainerDemo(),
  "/demo/safearea": (BuildContext context) => SafeAreaDemo(),
  "/demo/pageview": (BuildContext context) => PageViewDemo(),
  "/demo/video": (BuildContext context) => VideoDemo(),
};
