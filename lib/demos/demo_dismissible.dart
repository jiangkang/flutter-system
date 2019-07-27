import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';

class SwipeDismissDemo extends StatefulWidget {
  @override
  _SwipeDismissDemoState createState() {
    return _SwipeDismissDemoState();
  }
}

class _SwipeDismissDemoState extends State<SwipeDismissDemo> {
  final _items = List<String>.generate(100, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe to Dismiss"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    color: Theme.of(context).accentColor,
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "Are you sure?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  child: ListTileCard(
                    borderRadius: 6,
                    title: Text(_items[index]),
                  ),
                  key: Key(_items[index]),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      _items.removeAt(index);
                    });
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("${_items[index]}已删除！")));
                  },
                );
              })),
    );
  }
}
