import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  ScrollPhysics _physicsType;

  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
              onPressed: () async {
                _physicsType = await showMenu<ScrollPhysics>(
                  context: context,
                  position: RelativeRect.fromLTRB(160, 100, 0, 0),
                  items: [
                    PopupMenuItem(
                      child: Text("NeverScroll"),
                      value: NeverScrollableScrollPhysics(),
                    ),
                    PopupMenuItem(
                      child: Text("AlwaysScroll"),
                      value: AlwaysScrollableScrollPhysics(),
                    ),
                    PopupMenuItem(
                      child: Text("ClampingScroll"),
                      value: ClampingScrollPhysics(),
                    ),
                    PopupMenuItem(
                      child: Text("BounceScroll"),
                      value: BouncingScrollPhysics(),
                    ),
                  ],
                );
                setState(() {});
              },
              child: Text("physics"))
        ],
      ),
      body: ListView.separated(
        controller: _controller,
        shrinkWrap: true,
        physics: _physicsType,
        itemBuilder: (context, index) => ListTile(
          title: Text("Item$index"),
        ),
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 2,
          color: Theme.of(context).dividerColor,
        ),
        itemCount: 100,
      ),
      floatingActionButton: InkWell(
        onDoubleTap: () {
          if (_controller != null) {
            _controller.animateTo(0,
                duration: Duration(seconds: 3), curve: Curves.linear);
          }
        },
        onLongPress: () {
          if (_controller != null) {
            _controller.jumpTo(0);
          }
        },
        child: FloatingActionButton(
          onPressed: () {
            if (_controller != null) {
              debugPrint("offset:${_controller.offset.toString()}");
              debugPrint("position:${_controller.position.toString()}");
            }
          },
          child: Icon(Icons.info),
        ),
      ),
    );
  }
}
