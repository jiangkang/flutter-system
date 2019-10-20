import 'package:flutter/material.dart';
import 'package:flutter_system/demos/demo_animation.dart';
import 'package:flutter_system/demos/demo_assets.dart';
import 'package:flutter_system/demos/demo_camera.dart';
import 'package:flutter_system/demos/demo_container.dart';
import 'package:flutter_system/demos/demo_custom_scrollview.dart';
import 'package:flutter_system/demos/demo_dismissible.dart';
import 'package:flutter_system/demos/demo_drawer.dart';
import 'package:flutter_system/demos/demo_forms.dart';
import 'package:flutter_system/demos/demo_gridview.dart';
import 'package:flutter_system/demos/demo_http.dart';
import 'package:flutter_system/demos/demo_image.dart';
import 'package:flutter_system/demos/demo_pageview.dart';
import 'package:flutter_system/demos/demo_platform.dart';
import 'package:flutter_system/demos/demo_progress_indicator.dart';
import 'package:flutter_system/demos/demo_read_write_files.dart';
import 'package:flutter_system/demos/demo_safearea.dart';
import 'package:flutter_system/demos/demo_sqlite.dart';
import 'package:flutter_system/demos/demo_tabs.dart';
import 'package:flutter_system/demos/demo_text.dart';
import 'package:flutter_system/demos/demo_time.dart';
import 'package:flutter_system/demos/demo_video.dart';
import 'package:flutter_system/demos/demo_websocket.dart';
import 'package:flutter_system/home.dart';
import 'package:flutter_system/page/guide.dart';
import 'package:flutter_system/page/page_calendar.dart';
import 'package:flutter_system/page/page_markdown.dart';
import 'package:flutter_system/page/page_password.dart';
import 'package:flutter_system/page/page_settings.dart';
import 'package:flutter_system/page/page_show0.dart';

/// 路由汇总
final Map<String, WidgetBuilder> pageRouters = {
  "/": (BuildContext context) => HomePage(),
  "/page/settings": (BuildContext context) => SettingsPage(),
  "/page/guide": (BuildContext context) => GuidePage(),
  "/page/show0": (BuildContext context) => Show0Page(),
  "/page/markdown": (BuildContext context) => MarkDownEditorPage(),
  "/page/password": (BuildContext context) => PasswordPage(),
  "/page/calendar": (BuildContext context) => CalendarPage(),
  "/demo/text": (BuildContext context) => TextDemo(),
  "/demo/image": (BuildContext context) => ImageDemo(),
  "/demo/http": (BuildContext context) => HttpDemo(),
  "/demo/gridview": (BuildContext context) => GridDemo(),
  "/demo/container": (BuildContext context) => ContainerDemo(),
  "/demo/safearea": (BuildContext context) => SafeAreaDemo(),
  "/demo/pageview": (BuildContext context) => PageViewDemo(),
  "/demo/video": (BuildContext context) => VideoDemo(),
  "/demo/animation": (BuildContext context) => AnimationDemo(),
  "/demo/drawer": (BuildContext context) => DrawerDemo(),
  "/demo/tabs": (BuildContext context) => TabsDemo(),
  "/demo/forms": (BuildContext context) => FormsDemo(),
  "/demo/dismissible": (BuildContext context) => SwipeDismissDemo(),
  "/demo/CustomScrollView": (BuildContext context) => CustomScrollViewDemo(),
  "/demo/websocket": (BuildContext context) => WebSocketDemo(),
  "/demo/sqlite": (BuildContext context) => SQLiteDemo(),
  "/demo/io": (BuildContext context) => ReadWriteFileDemo(),
  "/demo/camera": (BuildContext context) => CameraDemo(),
  "/demo/assets": (BuildContext context) => AssetsDemo(),
  "/demo/platform": (BuildContext context) => PlatformDemo(),
  "/demo/time": (BuildContext context) => TimeDemo(),
  "/demo/progress_indicator": (BuildContext context) => ProgressIndicatorDemo(),
};
