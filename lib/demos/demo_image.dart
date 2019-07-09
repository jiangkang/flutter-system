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

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: Image(
            image: AssetImage("images/landscape0.jpeg"),
            filterQuality: FilterQuality.high,
          ),
        ),
      ],
    );
  }
}

void main() => runDemo(ImageDemo(), title: "Image Demo");
