import 'package:flutter/material.dart';
import 'package:flutter_system/component/component_appbar.dart';
import 'package:flutter_system/utils/ui_utils.dart';
import 'package:kicons/kicons.dart';

/// top banner page
/// 轮播图上覆盖几个快捷入口
class TopBannerPage extends StatelessWidget {
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
                  Text("Item${index}")
                ],
              ),
            ));
  }
}
