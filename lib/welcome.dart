import 'package:flutter/material.dart';

import 'common/res_constants.dart';

class WelcomeData {
  String imgUrl;
  String title;
  String desc;

  WelcomeData(this.imgUrl, this.title, this.desc);
}

/// Welcome Page
class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<WelcomeData> data = List();

  @override
  void initState() {
    super.initState();
    data.add(WelcomeData(IMG_URL0, "实用", "实用是开始行动的前提"));
    data.add(WelcomeData(IMG_URL1, "可用", "可用是结果的检验标准"));
    data.add(WelcomeData(IMG_URL2, "好用", "好用是产品的满意程度"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: PageView.builder(
            controller: PageController(),
            itemBuilder: (BuildContext context, int index) =>
                _buildItem(context, index)));
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Image.network(data[index].imgUrl),
          Text(data[index].title),
          Text(data[index].desc)
        ],
      ),
    );
  }
}
