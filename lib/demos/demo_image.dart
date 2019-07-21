import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_system/common/res_constants.dart';
import 'package:flutter_system/demos/demos.dart';

const List<String> IMGS = [
  IMG_URL0,
  IMG_URL1,
  IMG_URL2,
  IMG_URL3,
  IMG_URL4,
  IMG_URL5,
  IMG_URL6,
  IMG_URL7,
  IMG_URL8,
];

/// 图片的几大常见需求：
/// 1. 占位图
/// 2. 圆角
/// 3. 圆形
/// 4. 资源/网络/内存加载
/// 5. 缓存
class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image.asset(
          "images/landscape0.jpeg",
          width: double.maxFinite,
          semanticLabel: "Default Image",
        ),
        Image.network(
          IMGS[new Random().nextInt(9)],
          width: double.maxFinite,
        )
      ],
    );
  }
}

void main() => runDemo(ImageDemo(), title: "Image Demo");
