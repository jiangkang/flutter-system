import 'package:flutter/material.dart';
import 'package:flutter_system/component/dialogs.dart';
import 'package:flutter_system/component/iconfont.dart';
import 'package:flutter_system/demos/demo_animation.dart';
import 'package:flutter_system/demos/demo_assets.dart';
import 'package:flutter_system/demos/demo_camera.dart';
import 'package:flutter_system/demos/demo_container.dart';
import 'package:flutter_system/demos/demo_custom_paint.dart';
import 'package:flutter_system/demos/demo_custom_scrollview.dart';
import 'package:flutter_system/demos/demo_dismissible.dart';
import 'package:flutter_system/demos/demo_drawer.dart';
import 'package:flutter_system/demos/demo_forms.dart';
import 'package:flutter_system/demos/demo_gridview.dart';
import 'package:flutter_system/demos/demo_http.dart';
import 'package:flutter_system/demos/demo_image.dart';
import 'package:flutter_system/demos/demo_list_wheel_scrollview.dart';
import 'package:flutter_system/demos/demo_listview.dart';
import 'package:flutter_system/demos/demo_pageview.dart';
import 'package:flutter_system/demos/demo_platform.dart';
import 'package:flutter_system/demos/demo_progress_indicator.dart';
import 'package:flutter_system/demos/demo_read_write_files.dart';
import 'package:flutter_system/demos/demo_safearea.dart';
import 'package:flutter_system/demos/demo_sqlite.dart';
import 'package:flutter_system/demos/demo_tabs.dart';
import 'package:flutter_system/demos/demo_text.dart';
import 'package:flutter_system/demos/demo_textfield.dart';
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
import 'package:flutter_system/products/todo/todo_list.dart';
import 'package:flutter_system/products/xiyou/xiyou_home.dart';
import 'package:flutter_system/products/youqi/youqi.dart';

import 'component/component_appbar.dart';
import 'component/componet_topbanner.dart';
import 'demos/animation/demo_transform.dart';
import 'demos/demo_button.dart';
import 'demos/demo_chip.dart';
import 'demos/demo_slider.dart';

/// Page Routers
final Map<String, WidgetBuilder> pageRouters = {
  "/page/settings": (BuildContext context) => SettingsPage(),
  "/page/guide": (BuildContext context) => GuidePage(),
  "/page/show0": (BuildContext context) => Show0Page(),
  "/page/markdown": (BuildContext context) => MarkDownEditorPage(),
  "/page/password": (BuildContext context) => PasswordPage(),
  "/page/calendar": (BuildContext context) => CalendarPage(),
};

/// Component Routers
final Map<String, WidgetBuilder> componentRouters = {
  "/component/iconfont": (BuildContext context) => IconFont(),
  "/component/dialogs": (BuildContext context) => DialogsPage(),
  "/component/appbar": (BuildContext context) => AppBarPage(),
  "/component/topbanner": (BuildContext context) => TopBannerPage(),
};

/// Demo Routers
final Map<String, WidgetBuilder> demoRouters = {
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
  "/demo/custompaint": (BuildContext context) => CustomPaintDemo(),
  "/demo/chip": (BuildContext context) => ChipDemo(),
  "/demo/transform": (BuildContext context) => TransformDemo(),
  "/demo/button": (BuildContext context) => ButtonDemo(),
  "/demo/slider": (BuildContext context) => SliderDemo(),
  "/demo/textfield": (BuildContext context) => TextFieldDemo(),
  "/demo/listview": (BuildContext context) => ListViewDemo(),
  "/demo/listwheel": (BuildContext context) => ListWheelScrollViewDemo(),
};

/// Product Routers
final Map<String, WidgetBuilder> productRouters = {
  "/product/xiyou": (BuildContext context) => XiyouHome(),
  "/product/youqi": (BuildContext context) => YouQiHomePage(),
  "/product/todo": (BuildContext context) => TodoListPage(),
};

/// App Routers
/// include of [pageRouters],[componentRouters],[demoRouters],[productRouters]
final Map<String, WidgetBuilder> appRouters = {
  "/": (BuildContext context) => HomePage(),
}
  ..addAll(pageRouters)
  ..addAll(componentRouters)
  ..addAll(demoRouters)
  ..addAll(productRouters);
