import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';

class CustomScrollViewDemo extends StatefulWidget {
  @override
  _CustomScrollViewDemoState createState() {
    return _CustomScrollViewDemoState();
  }
}

class _CustomScrollViewDemoState extends State<CustomScrollViewDemo>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Floating App bar"),
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
            bottom: TabBar(controller: _tabController, tabs: [
              Tab(
                text: "Tab1",
              ),
              Tab(
                text: "Tab2",
              ),
              Tab(
                text: "Tab3",
              )
            ]),
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
