import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_system/common/res_constants.dart';

class MarkDownEditorPage extends StatefulWidget {
  @override
  _MarkDownEditorPageState createState() {
    return _MarkDownEditorPageState();
  }
}

class _MarkDownEditorPageState extends State<MarkDownEditorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Markdown Editor"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Markdown(
        data: "# Title\n [我的博客](https://jiangkang.tech)\n![]($IMG_URL1)",
      )),
    );
  }
}
