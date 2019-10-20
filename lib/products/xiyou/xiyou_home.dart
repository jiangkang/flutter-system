import 'package:flutter/material.dart';
import 'package:flutter_system/component/calendar.dart';
import 'package:flutter_system/products/xiyou/xiyou_my.dart';
import 'package:flutter_system/utils/nav_utils.dart';
import 'package:flutter_system/utils/time_utils.dart';

/// Xiyou 首页
class XiyouHome extends StatefulWidget {
  @override
  _XiyouHomeState createState() => _XiyouHomeState();
}

class _XiyouHomeState extends State<XiyouHome> {
  @override
  Widget build(BuildContext context) {
    final topHeader = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: <Widget>[
                Text(TimeUtils.getTodayYearAndMonthString()),
                Text("今"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                NavUtils.navToPage(context, XiyouMyPage());
              },
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          )
        ]);

    final indicator = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildLabel(Colors.red, "儿童"),
        _buildLabel(Colors.pink, "少年"),
        _buildLabel(Colors.black, "青年"),
        _buildLabel(Colors.purple, "壮年"),
        _buildLabel(Colors.blue, "老年"),
      ],
    );

    final listView = ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.av_timer),
          title: Text("开关"),
          trailing: Switch(value: false, onChanged: null),
        ),
        ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text("选项"),
            trailing: IconButton(icon: Icon(Icons.add), onPressed: null)),
        ListTile(
          leading: Icon(Icons.check),
          title: Text("点赞"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(icon: Icon(Icons.forward_5), onPressed: null),
              IconButton(icon: Icon(Icons.forward_10), onPressed: null),
              IconButton(icon: Icon(Icons.forward_30), onPressed: null),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.attach_file),
          title: Text("习惯"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(icon: Icon(Icons.file_download), onPressed: null),
              IconButton(icon: Icon(Icons.file_upload), onPressed: null),
              IconButton(icon: Icon(Icons.folder), onPressed: null),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          topHeader,
          Calendar(),
          indicator,
          Divider(
            height: 60,
            thickness: 8,
            color: Colors.grey[300],
          ),
          Expanded(
            child: listView,
          ),
        ],
      ),
    ));
  }

  Widget _buildLabel(Color c, String content) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(shape: BoxShape.circle, color: c),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text(
            content,
            style: TextStyle(fontSize: 11),
          ),
        ),
      ],
    );
  }
}
