import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';

class CustomScrollViewDemo extends StatefulWidget {
  @override
  _CustomScrollViewDemoState createState() {
    return _CustomScrollViewDemoState();
  }
}

class _CustomScrollViewDemoState extends State<CustomScrollViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Floting App bar"),
            centerTitle: true,
            floating: true,
            expandedHeight: 200,
            flexibleSpace: Image.asset(
              "images/landscape0.jpeg",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            pinned: true,
            snap: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            _buildListChildren(),
          )),
        ],
      ),
    );
  }

  List<Widget> _buildListChildren() {
    return List.generate(
        100,
        (index) => ListTileCard(
              title: Text("Item $index"),
              borderRadius: 4,
            ));
  }
}
