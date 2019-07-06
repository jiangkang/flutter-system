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

class GridViewCountDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        primary: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        scrollDirection: Axis.vertical,
        children: List.generate(
          100,
          (index) {
            return Image.network(
              IMGS[index % 8],
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.colorBurn,
              color: Colors.white10,
            );
          },
        ),
        crossAxisCount: 2,
      ),
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.extent(
        maxCrossAxisExtent: 10,
        primary: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        scrollDirection: Axis.vertical,
        children: List.generate(
          100,
          (index) {
            return Image.network(
              IMGS[index % 8],
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.colorBurn,
              color: Colors.white10,
            );
          },
        ),
      ),
    );
  }
}

//void main() => runDemo(GridViewCountDemo(), title: "GridView.count Demo");
void main() => runDemo(GridViewExtentDemo(), title: "GridView.extent Demo");
