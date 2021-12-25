import 'package:flutter/material.dart';
import 'package:flutter_system/demos/demo_navigator.dart';
import 'package:flutter_system/demos/demos.dart';

void main() {
  runDemo(ScrollableDemo(), title: "Scrollable Demo");
}

class ScrollableDemo extends StatefulWidget {
  const ScrollableDemo({Key? key}) : super(key: key);

  @override
  _ScrollableDemoState createState() => _ScrollableDemoState();
}

class _ScrollableDemoState extends State<ScrollableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text("跳转到navigator demo"),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigatorDemo()));
          },
        ),
      ),
      body: Scrollable(
          axisDirection: AxisDirection.right,
          controller: ScrollController(),
          viewportBuilder: (context, offset) {
            return Viewport(
              axisDirection: AxisDirection.right,
              offset: offset,
              slivers: [
                SliverFillViewport(
                    viewportFraction: 1,
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Center(
                          child: Container(
                            color: index.isEven ? Colors.redAccent : Colors.amber,
                            width: 360,
                            height: 360,
                            alignment: Alignment.center,
                            child: Text("Item $index"),
                          ),
                        );
                      },
                      childCount: 24,
                    )),
              ],
            );
          }),
    );
  }
}
