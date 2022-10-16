import 'package:flutter/material.dart';
import 'package:flutter_system/common/res_constants.dart';

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

final List<Widget> demos = [
  GridViewDemo(),
  GridViewCountDemo(),
  GridViewExtentDemo(),
  GridViewCustomDemo(),
  GridViewBuilderDemo(),
];

enum DemoType {
  GridView,
  GridViewCount,
  GridViewExtent,
  GridViewCustom,
  GridViewBuilder
}

class GridDemo extends StatefulWidget {
  const GridDemo({Key? key}) : super(key: key);

  @override
  _GridDemoState createState() => _GridDemoState();
}

class _GridDemoState extends State<GridDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GridView Demo"),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: PopupMenuButton<DemoType>(
                onSelected: (DemoType type) {
                  setState(() {
                    _currentIndex = type.index;
                  });
                },
                child: Text("切换"),
                itemBuilder: (context) => <PopupMenuEntry<DemoType>>[
                  const PopupMenuItem(
                    value: DemoType.GridView,
                    child: Text("GridView"),
                  ),
                  const PopupMenuItem(
                    value: DemoType.GridViewCount,
                    child: Text("GridViewCount"),
                  ),
                  const PopupMenuItem(
                    value: DemoType.GridViewExtent,
                    child: Text("GridViewExtent"),
                  ),
                  const PopupMenuItem(
                    value: DemoType.GridViewCustom,
                    child: Text("GridViewCustom"),
                  ),
                  const PopupMenuItem(
                    value: DemoType.GridViewBuilder,
                    child: Text("GridViewBuilder"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: demos[_currentIndex],
    );
  }
}

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      scrollDirection: Axis.vertical,
      children: List.generate(
        100,
        (index) {
          return Card(
            child: buildCachedNetworkImage(index),
          );
        },
      ),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        primary: false,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 3,
        children: List.generate(
          100,
          (index) {
            return buildCachedNetworkImage(index);
          },
        ),
      ),
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  const GridViewExtentDemo({Key? key}) : super(key: key);

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
            return buildCachedNetworkImage(index);
          },
        ),
      ),
    );
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  const GridViewBuilderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return buildCachedNetworkImage(index);
        },
        itemCount: 100,
      ),
    );
  }
}

class GridViewCustomDemo extends StatelessWidget {
  const GridViewCustomDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        childrenDelegate: SliverChildListDelegate(
          List.generate(100, (index) {
            return buildCachedNetworkImage(index);
          }),
        ),
      ),
    );
  }
}

buildCachedNetworkImage(int index) => Image.network(
      IMGS[index % 8],
      fit: BoxFit.cover,
      colorBlendMode: BlendMode.colorBurn,
      color: Colors.white10,
    );
