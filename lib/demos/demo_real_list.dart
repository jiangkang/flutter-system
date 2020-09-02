import 'package:best_toast/best_toast.dart';
import 'package:flutter/material.dart';

class RealListDemo extends StatefulWidget {
  @override
  _RealListDemoState createState() => _RealListDemoState();
}

class _RealListDemoState extends State<RealListDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Particular ListView"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("拖拽排序"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ReorderListViewDemo()));
            },
          ),
          ListTile(
            title: Text("下拉刷新/上拉加载"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RefreshListViewDemo()));
            },
          ),
          ListTile(
            title: Text("瀑布流"),
          ),
          ListTile(
            title: Text("顶部固定"),
          ),
          ListTile(
            title: Text("滑动监听"),
          ),
          ListTile(
            title: Text("展开/折叠"),
          ),
        ],
      ),
    );
  }
}

class ReorderListViewDemo extends StatefulWidget {
  @override
  _ReorderListViewDemoState createState() => _ReorderListViewDemoState();
}

class _ReorderListViewDemoState extends State<ReorderListViewDemo> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(Card(
        key: ValueKey(i),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: ListTile(
          title: Text("Title $i"),
        ),
      ));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("拖拽排序"),
        ),
        body: ReorderableListView(
            header: ListTile(
              title: Text("Header"),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: list,
            onReorder: (oldIndex, newIndex) {
              final target = list.removeAt(oldIndex);
              if (newIndex > oldIndex) {
                newIndex = newIndex - 1;
              }
              list.insert(newIndex, target);
            }));
  }
}

class RefreshListViewDemo extends StatefulWidget {
  @override
  _RefreshListViewDemoState createState() => _RefreshListViewDemoState();
}

class _RefreshListViewDemoState extends State<RefreshListViewDemo> {
  List<String> _dataList;
  ScrollController _scrollController;

  @override
  void initState() {
    _dataList = List.generate(100, (index) => "title $index");
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          List<String> nextList =
              List.generate(100, (index) => "next page $index");
          _dataList.addAll(nextList);
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下拉刷新&上拉加载"),
      ),
      body: RefreshIndicator(
          child: ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(_dataList[index]),
              ),
            ),
            itemCount: _dataList.length,
          ),
          onRefresh: () async {
            setState(() {
              _dataList = List.generate(100, (index) => "refresh title $index");
              Toast.showMessage(context, "刷新完成");
            });
          }),
    );
  }
}
