import 'package:flutter/material.dart';
import 'package:flutter_system/common/res_constants.dart';
import 'package:flutter_system/component/case0.dart';

@immutable
class ShowCaseOModel {
  final String imgUrl;
  final String avatarUrl;
  final String title;
  final String username;
  final double radius;
  final int likeNum;

  ShowCaseOModel(this.imgUrl, this.avatarUrl, this.title, this.username,
      this.radius, this.likeNum);
}

/// 信息流
class Show0Page extends StatefulWidget {
  final List<ShowCaseOModel> dataList = [
    ShowCaseOModel(IMGS[0], IMGS[0], "大江东去浪淘尽", "小白", 6, 10),
    ShowCaseOModel(IMGS[1], IMGS[1], "高处不胜寒", "小苏", 6, 12),
    ShowCaseOModel(IMGS[2], IMGS[2], "为伊消得人憔悴", "小李", 6, 14),
    ShowCaseOModel(IMGS[3], IMGS[3], "滚滚长江东逝水", "匿名", 6, 15),
    ShowCaseOModel(IMGS[4], IMGS[4], "恰同学少年", "老毛", 6, 19),
    ShowCaseOModel(IMGS[5], IMGS[5], "大漠孤烟直", "小愤", 6, 14),
  ];

  @override
  State<StatefulWidget> createState() => _Show0PageState();
}

class _Show0PageState extends State<Show0Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("信息流"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(color: Colors.white),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(1000, gen),
          ),
        ),
      ),
    );
  }

  Widget gen(int index) {
    final ShowCaseOModel model =
        widget.dataList[index % widget.dataList.length];
    return ShowCase0(
      imgUrl: model.imgUrl,
      avatarUrl: model.avatarUrl,
      title: model.title,
      username: model.username,
      radius: model.radius,
      likeNum: model.likeNum,
    );
  }
}
