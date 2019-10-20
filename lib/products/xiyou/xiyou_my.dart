import 'package:flutter/material.dart';

/// Xiyou 我的页面
class XiyouMyPage extends StatefulWidget {
  @override
  _XiyouMyPageState createState() => _XiyouMyPageState();
}

class _XiyouMyPageState extends State<XiyouMyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "我的",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: ClipPath(
              clipper: ShapeBorderClipper(shape: CircleBorder()),
              child: Image.asset("images/landscape1.jpeg"),
            ),
            title: Text("立即登录"),
            trailing:
                IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
          ),
          ListTile(
            leading: Icon(Icons.pie_chart),
            title: Text("统计数据"),
            trailing:
                IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("运动天数"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "5天",
                  style: TextStyle(color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12, left: 6),
                  child: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text("测量长度"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "30天",
                  style: TextStyle(color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12, left: 6),
                  child: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text("提醒"),
            trailing:
                IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("设置"),
            trailing:
                IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("关于"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "v1.0.0",
                  style: TextStyle(color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12, left: 6),
                  child: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
