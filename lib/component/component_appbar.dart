import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWithMiddleSearch(),
    );
  }

  AppBar buildAppBarWithMiddleSearch() {
    return AppBar(
      title: Chip(
        backgroundColor: Colors.white,
        label: Row(
          mainAxisSize: MainAxisSize.max,
          children: const <Widget>[
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
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(child: Text("首页"))),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "images/home_bar_scan.png",
            color: Colors.white,
            width: 28,
            height: 28,
          ),
        )
      ],
    );
  }
}

