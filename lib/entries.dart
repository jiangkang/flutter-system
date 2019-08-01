import 'package:flutter/material.dart';

import 'model/model_entry.dart';

final List<EntryItem> pageEntries = [
  EntryItem("Guide Page", "/page/guide"),
  EntryItem("MarkDown Editor", "/page/markdown"),
];

final List<EntryItem> componentEntries = [
  EntryItem("Show Case 0", "/page/show0", icon: Icons.show_chart),
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
];

final Map<String, IconData> ICONS = {
  "Text": Icons.text_fields,
};
