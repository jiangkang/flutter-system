import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWithMiddleSearch(),
    );
  }

  /// 中间带搜索框的Appbar
  AppBar _buildAppBarWithMiddleSearch() {
    return AppBar(
      title: Chip(
        backgroundColor: Colors.white,
        label: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              "点击这里搜索内容",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
      leading: Center(child: Text("首页")),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.share),
        )
      ],
    );
  }
}
