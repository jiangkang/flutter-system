import 'package:flutter/material.dart';
import 'package:flutter_system/page/page_entry.dart';

/// Tab Demo
/// important concept: [TabBar.indicator],[TabController],[TabBar],[TabBarView]
class TabsDemo extends StatefulWidget {
  @override
  _TabsDemoState createState() {
    return _TabsDemoState();
  }
}

class _TabsDemoState extends State<TabsDemo>
    with SingleTickerProviderStateMixin {
  final TABS = [
    Tab(icon: Icon(Icons.book)),
    Tab(icon: Icon(Icons.videocam)),
    Tab(icon: Icon(Icons.games)),
  ];

  final PAGES = [
    ArticleEntry(),
    PageEntry(),
    DemoEntry(),
  ];

  TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(initialIndex: 0, length: TABS.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: TABS.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Tabs Demo"),
              centerTitle: true,
              bottom: _buildTabBar(),
            ),
            body: _buildTabBarView(),
            floatingActionButton: Builder(
              builder: (BuildContext context) => FloatingActionButton(
                  child: Icon(Icons.info),
                  onPressed: () {
                    _showSnackBar(context);
                  }),
            )));
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: PAGES,
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: TABS,
      indicatorColor: Colors.white,
      indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
      indicatorWeight: 2,
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
    );
  }

  void _showSnackBar(BuildContext context) {
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text("当前选中index为${_tabController.index}")));
  }
}
