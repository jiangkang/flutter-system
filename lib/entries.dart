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
  EntryItem("Files", "/demo/read-write-file", icon: Icons.insert_drive_file),
];

final List<Article> articleEntries = [
  Article("Text的使用",
      "https://www.jiangkang.tech/archives/%E3%80%90Flutter%E3%80%91Text%E7%9A%84%E4%BD%BF%E7%94%A8"),
  Article("GridView.count的使用",
      "https://www.jiangkang.tech/archives/%E3%80%90Flutter%E3%80%91GridView%E4%B9%8BGridView%20count%E7%9A%84%E4%BD%BF%E7%94%A8"),
  Article("GridView.extent的使用",
      "https://www.jiangkang.tech/archives/%E3%80%90Flutter%E3%80%91GridView%E4%B9%8BGridView%20extent%E7%9A%84%E4%BD%BF%E7%94%A8"),
  Article("GridView的使用总结",
      "https://www.jiangkang.tech/archives/%E3%80%90Flutter%E3%80%91GridView%E4%BD%BF%E7%94%A8%E6%80%BB%E7%BB%93"),
];
