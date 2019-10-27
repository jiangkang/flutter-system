import 'package:flutter/material.dart';

import 'model/model_entry.dart';

final List<EntryItem> pageEntries = [
  EntryItem("Guide Page", "/page/guide"),
  EntryItem("MarkDown Editor", "/page/markdown"),
  EntryItem("Password", "/page/password"),
  EntryItem("Xi You", "/product/xiyou"),
  EntryItem("You Qi", "/product/youqi"),
];

final List<EntryItem> componentEntries = [
  EntryItem("Show Case 0", "/page/show0", icon: Icons.show_chart),
  EntryItem("Calendar", "/page/calendar", icon: Icons.calendar_today),
  EntryItem("IconFont", "/component/iconfont", icon: Icons.insert_emoticon)
];

final List<EntryItem> demoEntries = [
  EntryItem("Text", "/demo/text", icon: Icons.text_fields),
  EntryItem("Image", "/demo/image", icon: Icons.image),
  EntryItem("GridView", "/demo/gridview", icon: Icons.grid_on),
  EntryItem("Http", "/demo/http", icon: Icons.http),
  EntryItem("PageView", "/demo/pageview", icon: Icons.pageview),
  EntryItem("Video", "/demo/video", icon: Icons.video_library),
  EntryItem("Animation", "/demo/animation", icon: Icons.motorcycle),
  EntryItem("Drawer", "/demo/drawer", icon: Icons.subdirectory_arrow_right),
  EntryItem("Tabs", "/demo/tabs", icon: Icons.tab),
  EntryItem("Forms", "/demo/forms", icon: Icons.input),
  EntryItem("Dismissible", "/demo/dismissible", icon: Icons.delete_sweep),
  EntryItem("CustomScrollView", "/demo/CustomScrollView",
      icon: Icons.filter_list),
  EntryItem("WebSocket", "/demo/websocket", icon: Icons.web),
  EntryItem("SQLite", "/demo/sqlite", icon: Icons.data_usage),
  EntryItem("File IO", "/demo/io", icon: Icons.insert_drive_file),
  EntryItem("Camera", "/demo/camera", icon: Icons.camera),
  EntryItem("Assets", "/demo/assets", icon: Icons.web_asset),
  EntryItem("Platform", "/demo/platform", icon: Icons.phone_android),
  EntryItem("Time", "/demo/time", icon: Icons.access_time),
  EntryItem("Progress Indicator", "/demo/progress_indicator", icon: Icons.loop),
  EntryItem("CustomPaint", "/demo/custompaint", icon: Icons.brush),
];

final Map<String, IconData> ICONS = {
  "text_fields": Icons.text_fields,
};
