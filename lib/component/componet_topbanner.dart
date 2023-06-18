import 'package:flutter/material.dart';
import 'package:flutter_system/utils/ui_utils.dart';
import 'package:kicons/kicons.dart';

/// top banner page
/// 轮播图上覆盖几个快捷入口
class TopBannerPage extends StatefulWidget {
  const TopBannerPage({Key? key}) : super(key: key);

  @override
  State<TopBannerPage> createState() => _TopBannerPageState();
}

class _TopBannerPageState extends State<TopBannerPage> {
  @override
  Widget build(BuildContext context) {
    final bgTopBanner = Column(
      children: <Widget>[
        Image.asset(
          "images/banner.jpg",
          height: 200,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: buildAppBarWithMiddleSearch(),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              bgTopBanner,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: ShapeDecoration(
                    shape: roundedRectBorder(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildEntries(),
                  ),
                ),
              )
            ],
          )
        ],
      ),
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

  _buildEntries() {
    return List.generate(
        5,
        (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(EmojiIcon.wink_smile),
                  ),
                  Text("Item$index")
                ],
              ),
            ));
  }
}
